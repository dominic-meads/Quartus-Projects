`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Dominic Meads
// 
// Create Date: 11/13/2020 22:41:03 PM
// Module Name: VGA_smiley_top
// Project Name: VGA_smiley
// Description: generic VGA driver 640x480 @ 60 FPS 
//
// Revision 0.01 - File Created
// Additional Comments: Needs clock divider/multiplier if system clock is not 25 MHz 
// 
//////////////////////////////////////////////////////////////////////////////////

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
	
	clk_divider_50MHz_to_25MHz cd0 (
		.inclk0(clk),
		.c0(clk25MHz)
		);
	
	VGA_smiley vs0 (
		.clk (clk25MHz),
		.i_counter_x(w_counter_x),
		.i_counter_y(w_counter_y),
		.o_red(w_red),
		.o_blue(w_blue),
		.o_green(w_green)
		);
		
	VGA_driver vd0(
		.clk(clk25MHz),
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











