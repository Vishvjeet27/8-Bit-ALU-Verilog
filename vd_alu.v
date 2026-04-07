`timescale 1ns / 1ps

// 8-Bit ALU
// Author: Vishvajeet Dangi (VD)

module vd_alu_8bit(
    input [7:0] A,          
    input [7:0] B,          
    input [3:0] ALU_Sel,    
    output reg [7:0] ALU_Out, 
    output reg CarryOut       
);

    wire [8:0] tmp;
    // 9-bit add to catch the carry out
    assign tmp = {1'b0, A} + {1'b0, B}; 

    always @(*) begin
        CarryOut = 1'b0; 
        
        case(ALU_Sel)
            4'b0000: begin 
                ALU_Out = A + B;
                CarryOut = tmp[8];
            end
            4'b0001: ALU_Out = A - B;         
            4'b0010: ALU_Out = A << 1;        // LSL
            4'b0011: ALU_Out = A >> 1;        // LSR
            4'b0100: ALU_Out = A & B;         
            4'b0101: ALU_Out = A | B;         
            4'b0110: ALU_Out = A ^ B;         
            4'b0111: ALU_Out = ~(A | B);      // NOR
            4'b1000: ALU_Out = ~(A & B);      // NAND
            4'b1001: ALU_Out = ~(A ^ B);      // XNOR
            4'b1010: ALU_Out = (A > B) ? 8'd1 : 8'd0;  
            4'b1011: ALU_Out = (A == B) ? 8'd1 : 8'd0; 
            default: ALU_Out = A + B;         
        endcase
    end
endmodule
