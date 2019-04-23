//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Apr 22 22:53:33 2019
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// audio_des
module audio_des(
    // Inputs
    F2M_GPI_1,
    MSS_RESET_N,
    SPI_1_DI,
    UART_0_RXD,
    UART_1_RXD,
    VAREF1,
    // Outputs
    M2F_GPO_2,
    M2F_GPO_3,
    M2F_GPO_4,
    M2F_GPO_5,
    M2F_GPO_6,
    SDD_1,
    SPI_1_DO,
    UART_0_TXD,
    UART_1_TXD,
    // Inouts
    I2C_0_SCL,
    I2C_0_SDA,
    I2C_1_SCL,
    I2C_1_SDA,
    SPI_1_CLK,
    SPI_1_SS
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  F2M_GPI_1;
input  MSS_RESET_N;
input  SPI_1_DI;
input  UART_0_RXD;
input  UART_1_RXD;
input  VAREF1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output M2F_GPO_2;
output M2F_GPO_3;
output M2F_GPO_4;
output M2F_GPO_5;
output M2F_GPO_6;
output SDD_1;
output SPI_1_DO;
output UART_0_TXD;
output UART_1_TXD;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  I2C_0_SCL;
inout  I2C_0_SDA;
inout  I2C_1_SCL;
inout  I2C_1_SDA;
inout  SPI_1_CLK;
inout  SPI_1_SS;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   F2M_GPI_1;
wire   I2C_0_SCL;
wire   I2C_0_SDA;
wire   I2C_1_SCL;
wire   I2C_1_SDA;
wire   M2F_GPO_2_net_0;
wire   M2F_GPO_3_net_0;
wire   M2F_GPO_4_net_0;
wire   M2F_GPO_5_net_0;
wire   M2F_GPO_6_net_0;
wire   MSS_RESET_N;
wire   SDD_1_net_0;
wire   SPI_1_CLK;
wire   SPI_1_DI;
wire   SPI_1_DO_net_0;
wire   SPI_1_SS;
wire   UART_0_RXD;
wire   UART_0_TXD_net_0;
wire   UART_1_RXD;
wire   UART_1_TXD_net_0;
wire   VAREF1;
wire   SDD_1_net_1;
wire   UART_0_TXD_net_1;
wire   UART_1_TXD_net_1;
wire   M2F_GPO_6_net_1;
wire   M2F_GPO_5_net_1;
wire   M2F_GPO_4_net_1;
wire   M2F_GPO_3_net_1;
wire   M2F_GPO_2_net_1;
wire   SPI_1_DO_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SDD_1_net_1      = SDD_1_net_0;
assign SDD_1            = SDD_1_net_1;
assign UART_0_TXD_net_1 = UART_0_TXD_net_0;
assign UART_0_TXD       = UART_0_TXD_net_1;
assign UART_1_TXD_net_1 = UART_1_TXD_net_0;
assign UART_1_TXD       = UART_1_TXD_net_1;
assign M2F_GPO_6_net_1  = M2F_GPO_6_net_0;
assign M2F_GPO_6        = M2F_GPO_6_net_1;
assign M2F_GPO_5_net_1  = M2F_GPO_5_net_0;
assign M2F_GPO_5        = M2F_GPO_5_net_1;
assign M2F_GPO_4_net_1  = M2F_GPO_4_net_0;
assign M2F_GPO_4        = M2F_GPO_4_net_1;
assign M2F_GPO_3_net_1  = M2F_GPO_3_net_0;
assign M2F_GPO_3        = M2F_GPO_3_net_1;
assign M2F_GPO_2_net_1  = M2F_GPO_2_net_0;
assign M2F_GPO_2        = M2F_GPO_2_net_1;
assign SPI_1_DO_net_1   = SPI_1_DO_net_0;
assign SPI_1_DO         = SPI_1_DO_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------audio_mss
audio_mss audio_mss_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        .F2M_GPI_1   ( F2M_GPI_1 ),
        .VAREF1      ( VAREF1 ),
        .UART_0_RXD  ( UART_0_RXD ),
        .UART_1_RXD  ( UART_1_RXD ),
        .SPI_1_DI    ( SPI_1_DI ),
        // Outputs
        .SDD_1       ( SDD_1_net_0 ),
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .UART_1_TXD  ( UART_1_TXD_net_0 ),
        .M2F_GPO_6   ( M2F_GPO_6_net_0 ),
        .M2F_GPO_5   ( M2F_GPO_5_net_0 ),
        .M2F_GPO_4   ( M2F_GPO_4_net_0 ),
        .M2F_GPO_3   ( M2F_GPO_3_net_0 ),
        .M2F_GPO_2   ( M2F_GPO_2_net_0 ),
        .SPI_1_DO    ( SPI_1_DO_net_0 ),
        // Inouts
        .I2C_1_SCL   ( I2C_1_SCL ),
        .I2C_1_SDA   ( I2C_1_SDA ),
        .I2C_0_SCL   ( I2C_0_SCL ),
        .I2C_0_SDA   ( I2C_0_SDA ),
        .SPI_1_CLK   ( SPI_1_CLK ),
        .SPI_1_SS    ( SPI_1_SS ) 
        );


endmodule
