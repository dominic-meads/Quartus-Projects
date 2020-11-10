`timescale 1ns / 1ps

// image generator of a road and a sky 640x480 @ 60 fps

////////////////////////////////////////////////////////////////////////
module VGA_image_gen(
	input clk,           // 50 MHz
	output o_hsync,      // horizontal sync
	output o_vsync,	     // vertical sync
	output [3:0] o_red,
	output [3:0] o_blue,
	output [3:0] o_green  
);

	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter
	reg [3:0] r_red = 0;
	reg [3:0] r_blue = 0;
	reg [3:0] r_green = 0;
	
	reg reset = 0;  // for PLL
	
	wire clk25MHz;

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// clk divider 50 MHz to 25 MHz
	ip ip1(
		.areset(reset),
		.inclk0(clk),
		.c0(clk25MHz),
		.locked()
		);  
	// end clk divider 50 MHz to 25 MHz

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// counter and sync generation
	always @(posedge clk25MHz)  // horizontal counter
		begin 
			if (counter_x < 799)
				counter_x <= counter_x + 1;  // horizontal counter (including off-screen horizontal 160 pixels) total of 800 pixels 
			else
				counter_x <= 0;              
		end  // always 
	
	always @ (posedge clk25MHz)  // vertical counter
		begin 
			if (counter_x == 799)  // only counts up 1 count after horizontal finishes 800 counts
				begin
					if (counter_y < 525)  // vertical counter (including off-screen vertical 45 pixels) total of 525 pixels
						counter_y <= counter_y + 1;
					else
						counter_y <= 0;              
				end  // if (counter_x...
		end  // always
	// end counter and sync generation  

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// hsync and vsync output assignments
	assign o_hsync = (counter_x >= 0 && counter_x < 96) ? 1:0;  // hsync high for 96 counts                                                 
	assign o_vsync = (counter_y >= 0 && counter_y < 2) ? 1:0;   // vsync high for 2 counts
	// end hsync and vsync output assignments

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// pattern generate
	always @ (*) 
		begin 
			if (counter_x < 263 && counter_y > 100)
				begin 
					r_red = 4'h0;
					r_blue = 4'h0;    
					r_green = 4'hF;  // only green
				end  // if (counter_x...
			else if (counter_x >= 263 && counter_x <= 663 && counter_y > 100)
				begin
					r_red = 4'h9;    // make more of a grey color
					r_blue = 4'h9;   
					r_green = 4'h9; 
				end  // else if 
			else if (counter_x > 663 && counter_x <= 783 && counter_y > 100)
				begin
					r_red = 4'h0;    
					r_blue = 4'h0;   
					r_green = 4'hF;  // only green
				end  // else if 
			else if (counter_y < 100)
				begin 
					r_red = 4'h0;    
					r_blue = 4'hF;   // only blue
					r_green = 4'h0;  
				end  // else if
			else 
				begin  
					r_red = 4'hF;    // black
					r_blue = 4'hF;   
					r_green = 4'hF; 
				end  // else 
		end  // always
	// end pattern generate

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// color output assignments
	// only output the colors if the counters are within the adressable video time constraints
	assign o_red = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_red : 4'h0;
	assign o_blue = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_blue : 4'h0;
	assign o_green = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_green : 4'h0;
	// end color output assignments
	
endmodule  // VGA_image_gen
