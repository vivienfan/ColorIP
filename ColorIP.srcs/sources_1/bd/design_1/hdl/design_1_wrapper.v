//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Feb 23 21:37:36 2017
//Host        : DESKTOP-U1ER32I running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    COLOR_BLUE,
    COLOR_GREEN,
    COLOR_RED,
    COLOR_YELLOW,
    COORD_BLUE,
    COORD_GREEN,
    COORD_RED,
    COORD_YELLOW,
    EN,
    READY_BLUE,
    READY_GREEN,
    READY_RED,
    READY_YELLOW,
    RESET);
  input CLK;
  input [1:0]COLOR_BLUE;
  input [1:0]COLOR_GREEN;
  input [1:0]COLOR_RED;
  input [1:0]COLOR_YELLOW;
  output [31:0]COORD_BLUE;
  output [31:0]COORD_GREEN;
  output [31:0]COORD_RED;
  output [31:0]COORD_YELLOW;
  input EN;
  output READY_BLUE;
  output READY_GREEN;
  output READY_RED;
  output READY_YELLOW;
  input RESET;

  wire CLK;
  wire [1:0]COLOR_BLUE;
  wire [1:0]COLOR_GREEN;
  wire [1:0]COLOR_RED;
  wire [1:0]COLOR_YELLOW;
  wire [31:0]COORD_BLUE;
  wire [31:0]COORD_GREEN;
  wire [31:0]COORD_RED;
  wire [31:0]COORD_YELLOW;
  wire EN;
  wire READY_BLUE;
  wire READY_GREEN;
  wire READY_RED;
  wire READY_YELLOW;
  wire RESET;

  design_1 design_1_i
       (.CLK(CLK),
        .COLOR_BLUE(COLOR_BLUE),
        .COLOR_GREEN(COLOR_GREEN),
        .COLOR_RED(COLOR_RED),
        .COLOR_YELLOW(COLOR_YELLOW),
        .COORD_BLUE(COORD_BLUE),
        .COORD_GREEN(COORD_GREEN),
        .COORD_RED(COORD_RED),
        .COORD_YELLOW(COORD_YELLOW),
        .EN(EN),
        .READY_BLUE(READY_BLUE),
        .READY_GREEN(READY_GREEN),
        .READY_RED(READY_RED),
        .READY_YELLOW(READY_YELLOW),
        .RESET(RESET));
endmodule
