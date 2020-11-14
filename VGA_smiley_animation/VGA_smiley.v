`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Dominic Meads
// 
// Create Date: 11/07/2020 20:47:37 PM
// Module Name: VGA_smiley
// Project Name: VGA_smiley
// Description: creates an animation of a smiley face to output over VGA
//
// Revision 0.01 - File Created
// Additional Comments: Needs clock divider/multiplier if system clock is not 25 MHz
// 
//////////////////////////////////////////////////////////////////////////////////

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
	
	assign o_red = r_red;
	assign o_blue = r_blue;
	assign o_green = r_green;

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
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.2 (FOREHEAD)
						else if (i_counter_y >= 135 && i_counter_y < 205)
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
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.2 (FOREHEAD)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.3 (EYES)
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 383)
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 383 && i_counter_x < 545)
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 545 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)
							end  // else if (i_counter_y >= 205 && i_counter_y < 217)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.3 (EYES)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.4 (MIDDLE OF FACE)
						else if (i_counter_y >= 217 && i_counter_y < 305)
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
							end  // else if (i_counter_y >= 217 && i_counter_y < 305)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.4 (MIDDLE OF FACE)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.5 (MOUTH)
						else if (i_counter_y >= 305 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 217 && i_counter_y < 305)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.5 (MOUTH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.6 (CHIN)
						else if (i_counter_y >= 305 && i_counter_y < 414)
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
							end  // else if (i_counter_y >= 305 && i_counter_y < 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.6 (CHIN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.7 (BOTTOM OF SCREEN)
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.7 (BOTTOM OF SCREEN)
					end  // FRAME_1
				
				FRAME_2 :
					begin
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.1 (TOP OF SCREEN)
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y < 135)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.1 (TOP OF SCREEN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.2 (FOREHEAD)
						else if (i_counter_y >= 135 && i_counter_y < 205)
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
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.2 (FOREHEAD)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.3 (EYES)
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 383)
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 383 && i_counter_x < 545)
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 545 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)
							end  // else if (i_counter_y >= 205 && i_counter_y < 217)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.3 (EYES)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.4 (MIDDLE OF FACE)
						else if (i_counter_y >= 217 && i_counter_y < 305)
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
							end  // else if (i_counter_y >= 217 && i_counter_y < 305)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.4 (MIDDLE OF FACE)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.5 (MOUTH)
						else if (i_counter_y >= 305 && i_counter_y < 326)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 305 && i_counter_y < 326)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.5 (MOUTH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.6 (CHIN)
						else if (i_counter_y >= 326 && i_counter_y < 414)
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
							end  // else if (i_counter_y >= 326 && i_counter_y < 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.6 (CHIN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 2.7 (BOTTOM OF SCREEN)
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 2.7 (BOTTOM OF SCREEN)
					end  // FRAME_2
					
				FRAME_3 : 
					begin
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.1 (TOP OF SCREEN)
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y < 135)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.1 (TOP OF SCREEN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.2 (FOREHEAD)
						else if (i_counter_y >= 135 && i_counter_y < 205)
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
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.2 (FOREHEAD)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.3 (EYES)
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 383)
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 383 && i_counter_x < 545)
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 545 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)
							end  // else if (i_counter_y >= 205 && i_counter_y < 217)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.3 (EYES)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.4 (MIDDLE OF FACE)
						else if (i_counter_y >= 217 && i_counter_y < 290)
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
							end  // else if (i_counter_y >= 217 && i_counter_y < 290)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.4 (MIDDLE OF FACE)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.5 (UPPER LIP)
						else if (i_counter_y >= 290 && i_counter_y < 297)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 290 && i_counter_y < 297)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.5 (UPPER LIP)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.6 (TEETH)
						else if (i_counter_y >= 297 && i_counter_y < 325)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 378)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 378)
								else if (i_counter_x >= 378 && i_counter_x < 550)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 378 && i_counter_x < 550)
								else if (i_counter_x >= 550 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 550 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 297 && i_counter_y < 325)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.6 (TEETH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.7 (LOWER LIP)
						else if (i_counter_y >= 325 && i_counter_y < 332)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 325 && i_counter_y < 332)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.7 (LOWER LIP)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.8 (CHIN)
						else if (i_counter_y >= 332 && i_counter_y < 414)
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
							end  // else if (i_counter_y >= 332 && i_counter_y < 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.8 (CHIN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 3.9 (BOTTOM OF SCREEN)
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 3.9 (BOTTOM OF SCREEN)
					end  // FRAME_3
					
				FRAME_4 :
					begin			
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.1 (TOP OF SCREEN)
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y < 135)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.1 (TOP OF SCREEN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.2 (FOREHEAD)
						else if (i_counter_y >= 135 && i_counter_y < 205)
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
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.2 (FOREHEAD)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.3 (EYES)
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 383)
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 383 && i_counter_x < 545)
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 545 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)
							end  // else if (i_counter_y >= 205 && i_counter_y < 217)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.3 (EYES)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.4 (MIDDLE OF FACE)
						else if (i_counter_y >= 217 && i_counter_y < 283)
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
							end  // else if (i_counter_y >= 217 && i_counter_y < 283)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.4 (MIDDLE OF FACE)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.5 (UPPER LIP)
						else if (i_counter_y >= 283 && i_counter_y < 290)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 283 && i_counter_y < 290)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.5 (UPPER LIP)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.6 (TOP TEETH)
						else if (i_counter_y >= 290 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)       
								else if (i_counter_x >= 371 && i_counter_x < 378)              // Left side of mouth
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 378)
								else if (i_counter_x >= 378 && i_counter_x < 418)                // 1st tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 378 && i_counter_x < 418)
								else if (i_counter_x >= 418 && i_counter_x < 422)                // 1st divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 418 && i_counter_x < 422)
								else if (i_counter_x >= 422 && i_counter_x < 462)                // 2nd tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 422 && i_counter_x < 462) 
								else if (i_counter_x >= 462 && i_counter_x < 466)                // 2nd divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 462 && i_counter_x < 466)
								else if (i_counter_x >= 466 && i_counter_x < 506)                // 3rd tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 466 && i_counter_x < 506)
								else if (i_counter_x >= 506 && i_counter_x < 510)                // 3rd divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 506 && i_counter_x < 510)
								else if (i_counter_x >= 510 && i_counter_x < 550)                // 4th tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 510 && i_counter_x < 550) 
								else if (i_counter_x >= 550 && i_counter_x < 557)              // Right side of mouth
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 550 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 290 && i_counter_y < 310)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.6 (TOP TEETH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.7 (SPACE UNDER TEETH)
						else if (i_counter_y >= 310 && i_counter_y < 314)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 310 && i_counter_y < 314)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.7 (SPACE UNDER TEETH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.8 (BOTTOM TEETH)
						else if (i_counter_y >= 314 && i_counter_y < 344)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)       
								else if (i_counter_x >= 371 && i_counter_x < 378)              // Left side of mouth
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 378)
								else if (i_counter_x >= 378 && i_counter_x < 418)                // 1st tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 378 && i_counter_x < 418)
								else if (i_counter_x >= 418 && i_counter_x < 422)                // 1st divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 418 && i_counter_x < 422)
								else if (i_counter_x >= 422 && i_counter_x < 462)                // 2nd tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 422 && i_counter_x < 462) 
								else if (i_counter_x >= 462 && i_counter_x < 466)                // 2nd divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 462 && i_counter_x < 466)
								else if (i_counter_x >= 466 && i_counter_x < 506)                // 3rd tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 466 && i_counter_x < 506)
								else if (i_counter_x >= 506 && i_counter_x < 510)                // 3rd divider
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 506 && i_counter_x < 510)
								else if (i_counter_x >= 510 && i_counter_x < 550)                // 4th tooth
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 510 && i_counter_x < 550) 
								else if (i_counter_x >= 550 && i_counter_x < 557)              // Right side of mouth
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 550 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 314 && i_counter_y < 344)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.8 (BOTTOM TEETH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.9 (LOWER LIP)
						else if (i_counter_y >= 344 && i_counter_y < 351)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 344 && i_counter_y < 351)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.9 (LOWER LIP)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.10 (CHIN)
						else if (i_counter_y >= 351 && i_counter_y < 414)
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
							end  // else if (i_counter_y >= 351 && i_counter_y < 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.10 (CHIN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 4.11 (BOTTOM OF SCREEN)
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 4.11 (BOTTOM OF SCREEN)
					end  // FRAME_4
				
				default :
					begin 
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.1 (TOP OF SCREEN)
						if (i_counter_y < 135)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y < 135)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.1 (TOP OF SCREEN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.2 (FOREHEAD)
						else if (i_counter_y >= 135 && i_counter_y < 205)
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
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.2 (FOREHEAD)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.3 (EYES)
						else if (i_counter_y >= 205 && i_counter_y < 217)
							begin 
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 383)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 383)
								else if (i_counter_x >= 383 && i_counter_x < 545)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 383 && i_counter_x < 545)
								else if (i_counter_x >= 545 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 545 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)
							end  // else if (i_counter_y >= 205 && i_counter_y < 217)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.3 (EYES)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.4 (MIDDLE OF FACE)
						else if (i_counter_y >= 217 && i_counter_y < 305)
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
							end  // else if (i_counter_y >= 217 && i_counter_y < 305)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.4 (MIDDLE OF FACE)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.5 (MOUTH)
						else if (i_counter_y >= 305 && i_counter_y < 310)
							begin
								if (i_counter_x < 324)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // if (i_counter_x < 324)
								else if (i_counter_x >= 324 && i_counter_x < 371)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 324 && i_counter_x < 371)
								else if (i_counter_x >= 371 && i_counter_x < 557)
									begin 
										r_red <= 4'h0;    // black
										r_blue <= 4'h0;
										r_green <= 4'h0;
									end  // else if (i_counter_x >= 371 && i_counter_x < 557)
								else if (i_counter_x >= 557 && i_counter_x < 604)
									begin 
										r_red <= 4'hF;    // yellow
										r_blue <= 4'h0;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 557 && i_counter_x < 604)
								else if (i_counter_x >= 604)
									begin 
										r_red <= 4'hF;    // white
										r_blue <= 4'hF;
										r_green <= 4'hF;
									end  // else if (i_counter_x >= 604)	
							end  // else if (i_counter_y >= 217 && i_counter_y < 305)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.5 (MOUTH)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.6 (CHIN)
						else if (i_counter_y >= 305 && i_counter_y < 414)
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
							end  // else if (i_counter_y >= 305 && i_counter_y < 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.6 (CHIN)
						
						////////////////////////////////////////////////////////////////////////////////////// SECTION 1.7 (BOTTOM OF SCREEN)
						else if (i_counter_y <= 414)
							begin              
								r_red <= 4'hF;    // white
								r_blue <= 4'hF;
								r_green <= 4'hF;
							end  // if (i_counter_y >= 414)
						////////////////////////////////////////////////////////////////////////////////////// END SECTION 1.7 (BOTTOM OF SCREEN)
					end  // default (same as FRAME_1) 
			endcase
		end  // always 
endmodule  // VGA_smiley
					
						
						
