## probleemstelling

Als extra heb ik 2 projecten gemaakt. 1 ervaan is gelukt en kun je zelf uitbreiden en de andere is niet gelukt maar toch zal ik de stapppen uitleggen.


# emoji 
Het project dat ik eraan gewerkt heb is een emoji via de vga poort op de scherm te tonen. Dit is een leuk concept om juist te beseffen hoe je via met de vga poort van de fpga of andere elektronische hardware ermee kunt spelen. Niet alleen is het gelukt om een emoji op mijn beelt te zetten maar ook frame per frame iets anders te laten doen. 

### vga in fpga
Om dit te kunnen laten werken zijn er verschillende manieren maar basis hiervan is dat je moet weten hoe juist de communicatie in vga werkt.

* vga
 <p align="center">
<img img width="500" height="300" src='../../img/vga1.PNG'></img><br>

Om met de vga te kunnen werken moeten we toch zel rekening houden met een paar dingens. Ten eerste is de vga 640x480, werkt op 60Hz en heeft een clock nodig van 25MHz.

* vga horizontal counter
 <p align="center">
<img img width="500" height="300" src='../../img/vga2.PNG'></img><br>

Bij de horizontal counter zien we dat we geen 640 hebben maar 800. Hoe kan dit ? dit kan omdat de eerste puls van 0-96 eigenlijk een waarschuwig puls is omdat het gaat "starten" van 96-144 gaat die wachten of toch niet op de scherm tonen en vanaf 144 tot 784 tekent die wat je maar wilt. daarna gaat die tot 800 tot die terug bij 0 begint.

* vga vertical counter
 <p align="center">
<img img width="500" height="300" src='../../img/vga3.PNG'></img><br>
 
 Bij de vertical counter doen we hetzelfde maar niet tot 800 maar tot 521 hier zien we weer dat de display time van 31 tot 511 gaat wat ons 480 geeft. 


### wat hebben we nodig?

om met de fpga de vga te laten werken hebben we dus een clock nodig van 25MHz een vga block van 640x480 en een block te tekenen op het scherm. Een belangrijke concept over de vga is dat die maar 3 primaire kleuren heeft. Rood, blauw en groen. Hieronder zie je een foto van de pinnen van zo'n vga.


* vga pinout
 <p align="center">
<img img width="400" height="150" src='../../img/vga4.PNG'></img><br>

#### clock
om zo'n clock te maken heb ik gebruik gemaakt van clock wizard die je terug kunt vinden bij IP catalog. hier kies je 25Hz als output clock. 

* video clock
 <p align="center">
<figure class="video_container">
  <iframe width="700" height="400" src="../../img/dsd.mp4" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

### 640x480 block
ik heb dit op mijn manier gedaan maar je kunt nog altijd betere en slimmere manieren vinden op het internet ( Voor verder te gaan maak zeker een verilog bestand aan geef die VGA_Driver als naam en kopier al de onderstaande code).Als eerste voeg in de inputs en de outputs toe. Hier zien we dat ik bij elke kleur [3:0] zet. dit omdat de artix-7 elke kleur 4 keer heeft(bekijke afbeelding) en het zi vermeld staat in hun schema.
sync dient om te kunnen synchroniseren en counter om de pixels te tellen en naar de volgende block door te geven. De block om te teknen.  


    
    module VGA_driver (
    input clk,                // 25 MHz     
	input [3:0] i_red,        
	input [3:0] i_blue,      
	input [3:0] i_green,     
	output o_hsync,           
	output o_vsync,          
	output [9:0] o_hcounter,  
	output [9:0] o_vcounter,  
	output [3:0] o_red,      
	output [3:0] o_blue,      
	output [3:0] o_green       
   ); 


 <p align="center">
<img img width="300" height="400" src='../../img/vga5.PNG'></img><br>

Hier zet ik alles in een register die van 0 tot 9 gaat

	reg [9:0] r_hcounter = 0;  
	reg [9:0] r_vcounter = 0;   
	reg [3:0] r_red = 0;
	reg [3:0] r_blue = 0;
	reg [3:0] r_green = 0;

Het volgende moet je goed is kijken. Hier zeg ik dat wanneer er een positieve edge van de clock is het controleert ls horizontal counter kleiner is dan 799 en dus begint te tellen tot 799. Daarna doe ik hetzelfde met de vertical counter.


	always @(posedge clk)  // horizontal counter
		begin 
			if (r_hcounter < 799)
				r_hcounter <= r_hcounter + 1;  // horizontal counter (including off-screen horizontal 160 pixels) total of 800 pixels 
			else
				r_hcounter <= 0;              
		end  // always 
	
	always @ (posedge clk)  // vertical counter
		begin 
			if (r_hcounter == 799)  // only counts up 1 count after horizontal finishes 800 counts
				begin
					if (r_vcounter < 525)  // vertical counter total of 525 pixels
						r_vcounter <= r_vcounter + 1;
					else
						r_vcounter <= 0;              
				end  // if (r_hcounter...
		end  // always

de laatste stappen is assign. Hier voeg ik alles bij elkaar. assign is eigenlijk koppelen met elkaar. ik koppel de o_hcounter wat de output is met r_hcounter en hetzelfde met v_counter

	assign o_hcounter = r_hcounter;
	assign o_vcounter = r_vcounter;

als we terug naar de bovenste afbeelding gaan zien kun je zien dat bij de horizontale counter een hsync was van 0-96 en bij vsync 0-2. Dit is wat we hier ook doen.

	assign o_hsync = (r_hcounter >= 0 && r_hcounter < 96) ? 1:0;  // hsync high for 96 counts                                                 
	assign o_vsync = (r_vcounter >= 0 && r_vcounter < 2) ? 1:0;   // vsync high for 2 counts

En als laatste gaan we alleen de kleuren terugsturen de binnen de display time range zit.

    assign o_red = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_red : 4'h0;
	assign o_blue = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_blue : 4'h0;
	assign o_green = (r_hcounter > 144 && r_hcounter <= 783 && r_vcounter > 35 && r_vcounter <= 514) ? i_green : 4'h0;

Nu dat we dit gedaan hebben moeten we nog een paar dings doen en dan kunnen we beginnen met het tekenen!
Maak een verilog bestand aan en noem het vga_smiley. 

Dit is mijn teken block dat ik gemaakt heb. is niet de meeste schone code maar het werkt. Hier zie je dat ik eerst de poorten declareer als input en output. de input poorten komen voornamelijk van de vga block zodat we kunnen gaan tekenen. de output poorten verbind ik met d vga uitgang zodat we onze tekening op de scherm kunnen tonen. daarnaa maak ik een paar register aan die paar dingens gaan bijhouden. je ziet ook 4'h0 staan, dit is omdat ik zeg in hexadecimaal dat de kleur hier niet 'aan' moet staan. als ik dit aanpas naar bv. 4'hF geef dit mij de kleur terug. ik declareer verder 4 frames die ik gemaakt heb elke frame heeft zijn binaire waarde. 2'b00 betekendt dat het een binaire is en 2 bits groot. 


    module VGA_smiley (
	input clk, 
	input [9:0] i_counter_x,
	input [9:0] i_counter_y,
	output [3:0] o_red,
	output [3:0] o_blue,
	output [3:0] o_green
	);
	
	reg [26:0] clk_counter = 0;
	reg [1:0] FRAME = 0;
	reg [3:0] r_red = 4'h0;
	reg [3:0] r_blue = 4'h0;
	reg [3:0] r_green = 4'h0;
	
	localparam FRAME_1 = 2'b00;
	localparam FRAME_2 = 2'b01;
	localparam FRAME_3 = 2'b10;
	localparam FRAME_4 = 2'b11;


Bij de volgende code controleer ik als de clk counter onder de 79000000 is anders doe ik +1 zo kan ik een overzicht houden op hoeveel clk pulsen het momenteel staat en zo een bewegende animatie maken gebaseerd op frames. Dit kunnen we zien op de volgende code, hier zetten we een clk bereik en zeggen we wanneer frame 1 tot frame 4 moet starten.

	always @ (posedge clk)
		begin 
			if (clk_counter < 79000000)
				clk_counter <= clk_counter + 1;
			else 
				clk_counter <= 0;
		end 
		
	always @ (posedge clk) 
		begin 
			if (clk_counter < 25000000)
				FRAME <= FRAME_1;
			else if (clk_counter >= 25000000 && clk_counter < 27000000)
				FRAME <= FRAME_2;
			else if (clk_counter >= 27000000 && clk_counter < 29000000)
				FRAME <= FRAME_3;
			else if (clk_counter >= 29000000 && clk_counter < 75000000)
				FRAME <= FRAME_4;
			else if (clk_counter >= 75000000 && clk_counter < 77000000)
				FRAME <= FRAME_3;
			else if (clk_counter >= 77000000 && clk_counter < 79000001)
				FRAME <= FRAME_2;
		end 

voor dat we echt beginnen te tekenen gaan we een assign doen zodat we de kleuren die we in de register hebben gestoken we sturen naar de ingang van de vga en dus op het scherm komt.

	assign o_red = r_red;
	assign o_blue = r_blue;
	assign o_green = r_green;


hier gaan we weer een posedge doen en controlleren met een case welke frame het nu is. We kunnen teknene door te zeggen dat binnen een bepaalde bereike die de kleur rood of blauw of green op 4'hF moet gaan zetten. I_counter_y bepaalde de verticale pixels waarde op de scherm en i_counter_x de horizontale pixels. als we dus links van boven willen iets willen tekenen moeten we dus if(i_counter_y >= 32 && i_counter_y < 35 && i_counter_x >= 144 && i_counter_y < 150)r_red <= 4'hF; nu kunnen we iets links boven tekenen. maar waarom deze waardes? Denk eraan dat de v counter op 32 begint en h counter op 144 nu hebben we iets 6pixels breed en 3 pixels hoog getekend met de kleur rood. Als je dit nu wilt update dat die naar rechts gaan kun je dit update door gebruik te maken van FRAME2 en FRAME3 enz en de x en y locatie update. zo kun je zien dat uw punt beweegt.

	always @ (posedge clk)
		begin 
			case (FRAME)
				FRAME_1 : 
					begin 
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.1 (TOP OF SCREEN)
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y < 135)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.1 (TOP OF SCREEN)
						
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.2 (FOREHEAD)
						
						else if (i_counter_y >= 135 && i_counter_y < 150)
                                      begin 
                                      if (i_counter_x < 324)
                                      begin 
                                        r_red <= 4'hF;    // white
                                        r_blue <= 4'hF;
                                        r_green <= 4'hF;
                                      end  // if (i_counter_x < 324)
                                      else if (i_counter_x >= 324 && i_counter_x < 604)
                                  begin 
                                       r_red <= 4'hF;    // yellow
                                       r_blue <= 4'h0;
                                       r_green <= 4'hF;
                                 end  // else if (i_counter_x >= 324 && i_counter_x < 604)
                                 else if (i_counter_x >= 604)
                                 begin 
                                        r_red <= 4'hF;    // white
                                        r_blue <= 4'hF;
                                        r_green <= 4'hF;
                                 end  // else if (i_counter_x >= 604)
                            end  // else if (i_counter_y >= 135 && i_counter_y < 205)
						
						/////////////

Als laatste maak je een top block en declareer je alle inputs en outputs en de verbindingen. Hieronder vind je de code. 

	`timescale 1ns / 1ps

	module VGA_smiley_top(
	input clk,
	output o_hsync,           
	output o_vsync,
	output [3:0] o_red,       // output color red
	output [3:0] o_blue,      // output color blue
	output [3:0] o_green
	);
	
	wire clk25MHz;
	
	wire [9:0] w_counter_x;
	wire [9:0] w_counter_y;
	wire [3:0] w_red;
	wire [3:0] w_blue;
	wire [3:0] w_green;
	
	clk_wiz_0 clk25hertz(
            .clk_in1(clk),
            .clk_out1(clk25)
            );
	
	VGA_smiley vs0 (
		.clk (clk25),
		.i_counter_x(w_counter_x),
		.i_counter_y(w_counter_y),
		.o_red(w_red),
		.o_blue(w_blue),
		.o_green(w_green)
		);
		
	VGA_driver vd0(
		.clk(clk25),
		.i_red(w_red),
		.i_blue(w_blue),
		.i_green(w_green),
		.o_hsync(o_hsync),
		.o_vsync(o_vsync),
		.o_hcounter(w_counter_x),
		.o_vcounter(w_counter_y),
		.o_red(o_red),
		.o_blue(o_blue),
		.o_green(o_green)
		);

	endmodule

Dit is een leuk project om de werking van de vga beter te begrijpen en zelf ermee te spelen.

P.s.
Dit is wat ik gemaakt heb.


 <p align="center">
<figure class="video_container">
  <iframe width="700" height="400" src="../../img/smile.mp4" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

# Tic Tac Toe
Dit is jammer genoeg niet gelukt maar heb er veel moeite erin gestoken dus geef ik hier toch wat extra uitleg over de werking en wat ik in gedachten had. Maar natuurlijk is het de bedoeling dat jij verder aan dit werkt of niet. Om te kunnen maken wat ik heb gemaakt is niet zo anders dan de bovenste project. Hier maak je ook gebruik van een vga block en een teken block. 

#### stap1
we maken een top, vga_img (teken blok), vga_driver(vga block) aan en kopieren alles van ervoor hierin. wat hier anders is dat we i.p.v een smiley lijnen blocken enz gaat tekenen, ook is hier een button die in een flipflip gestoken gaat worden en zo een binaire output gaat krijgen en we vervolgens dit in een binary to decimal steken om dan de decimale waarde naar de teken block in te sturen om zo een vak te selecteren.  