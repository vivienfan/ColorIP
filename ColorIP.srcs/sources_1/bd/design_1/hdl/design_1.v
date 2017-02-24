//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Feb 23 21:37:36 2017
//Host        : DESKTOP-U1ER32I running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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

  wire CLK_1;
  wire [1:0]COLOR_1;
  wire [1:0]COLOR_1_1;
  wire [1:0]COLOR_2_1;
  wire [1:0]COLOR_3_1;
  wire [31:0]ColorDetect_Blue_COORDINATE;
  wire ColorDetect_Blue_READY;
  wire [31:0]ColorDetect_Green_COORDINATE;
  wire ColorDetect_Green_READY;
  wire [13:0]ColorDetect_Red_ADDR;
  wire [31:0]ColorDetect_Red_COORDINATE;
  wire ColorDetect_Red_READY;
  wire [31:0]ColorDetect_Yellow_COORDINATE;
  wire ColorDetect_Yellow_READY;
  wire EN_1;
  wire RESET_1;
  wire [23:0]ROM_douta;

  assign CLK_1 = CLK;
  assign COLOR_1 = COLOR_RED[1:0];
  assign COLOR_1_1 = COLOR_GREEN[1:0];
  assign COLOR_2_1 = COLOR_BLUE[1:0];
  assign COLOR_3_1 = COLOR_YELLOW[1:0];
  assign COORD_BLUE[31:0] = ColorDetect_Blue_COORDINATE;
  assign COORD_GREEN[31:0] = ColorDetect_Green_COORDINATE;
  assign COORD_RED[31:0] = ColorDetect_Red_COORDINATE;
  assign COORD_YELLOW[31:0] = ColorDetect_Yellow_COORDINATE;
  assign EN_1 = EN;
  assign READY_BLUE = ColorDetect_Blue_READY;
  assign READY_GREEN = ColorDetect_Green_READY;
  assign READY_RED = ColorDetect_Red_READY;
  assign READY_YELLOW = ColorDetect_Yellow_READY;
  assign RESET_1 = RESET;
  design_1_ColorDetect_Red_1 ColorDetect_Blue
       (.CLK(CLK_1),
        .COLOR(COLOR_2_1),
        .COORDINATE(ColorDetect_Blue_COORDINATE),
        .DATA_IN(ROM_douta),
        .EN(EN_1),
        .READY(ColorDetect_Blue_READY),
        .RESET(RESET_1));
  design_1_ColorDetect_Red_2 ColorDetect_Green
       (.CLK(CLK_1),
        .COLOR(COLOR_1_1),
        .COORDINATE(ColorDetect_Green_COORDINATE),
        .DATA_IN(ROM_douta),
        .EN(EN_1),
        .READY(ColorDetect_Green_READY),
        .RESET(RESET_1));
  design_1_ColorDetect_0_0 ColorDetect_Red
       (.ADDR(ColorDetect_Red_ADDR),
        .CLK(CLK_1),
        .COLOR(COLOR_1),
        .COORDINATE(ColorDetect_Red_COORDINATE),
        .DATA_IN(ROM_douta),
        .EN(EN_1),
        .READY(ColorDetect_Red_READY),
        .RESET(RESET_1));
  design_1_ColorDetect_Red_0 ColorDetect_Yellow
       (.CLK(CLK_1),
        .COLOR(COLOR_3_1),
        .COORDINATE(ColorDetect_Yellow_COORDINATE),
        .DATA_IN(ROM_douta),
        .EN(EN_1),
        .READY(ColorDetect_Yellow_READY),
        .RESET(RESET_1));
  design_1_blk_mem_gen_0_0 ROM
       (.addra(ColorDetect_Red_ADDR),
        .clka(CLK_1),
        .douta(ROM_douta));
endmodule
