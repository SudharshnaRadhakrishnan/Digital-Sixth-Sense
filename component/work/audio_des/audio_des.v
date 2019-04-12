//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Apr 12 12:41:20 2019
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// audio_des
module audio_des(
    // Inputs
    F2M_GPI_1,
    MSS_RESET_N,
    UART_0_RXD,
    UART_1_RXD,
    VAREF1,
    // Outputs
    M2F_GPO_0,
    SDD_1,
    UART_0_TXD,
    UART_1_TXD,
    // Inouts
    I2C_0_SCL,
    I2C_0_SDA,
    I2C_1_SCL,
    I2C_1_SDA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  F2M_GPI_1;
input  MSS_RESET_N;
input  UART_0_RXD;
input  UART_1_RXD;
input  VAREF1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output M2F_GPO_0;
output SDD_1;
output UART_0_TXD;
output UART_1_TXD;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  I2C_0_SCL;
inout  I2C_0_SDA;
inout  I2C_1_SCL;
inout  I2C_1_SDA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   F2M_GPI_1;
wire   I2C_0_SCL;
wire   I2C_0_SDA;
wire   I2C_1_SCL;
wire   I2C_1_SDA;
wire   M2F_GPO_0_net_0;
wire   MSS_RESET_N;
wire   SDD_1_net_0;
wire   UART_0_RXD;
wire   UART_0_TXD_net_0;
wire   UART_1_RXD;
wire   UART_1_TXD_net_0;
wire   VAREF1;
wire   M2F_GPO_0_net_1;
wire   SDD_1_net_1;
wire   UART_0_TXD_net_1;
wire   UART_1_TXD_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign M2F_GPO_0_net_1  = M2F_GPO_0_net_0;
assign M2F_GPO_0        = M2F_GPO_0_net_1;
assign SDD_1_net_1      = SDD_1_net_0;
assign SDD_1            = SDD_1_net_1;
assign UART_0_TXD_net_1 = UART_0_TXD_net_0;
assign UART_0_TXD       = UART_0_TXD_net_1;
assign UART_1_TXD_net_1 = UART_1_TXD_net_0;
assign UART_1_TXD       = UART_1_TXD_net_1;
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
        // Outputs
        .M2F_GPO_0   ( M2F_GPO_0_net_0 ),
        .SDD_1       ( SDD_1_net_0 ),
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .UART_1_TXD  ( UART_1_TXD_net_0 ),
        // Inouts
        .I2C_1_SCL   ( I2C_1_SCL ),
        .I2C_1_SDA   ( I2C_1_SDA ),
        .I2C_0_SCL   ( I2C_0_SCL ),
        .I2C_0_SDA   ( I2C_0_SDA ) 
        );


endmodule
