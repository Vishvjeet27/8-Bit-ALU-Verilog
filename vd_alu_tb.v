`timescale 1ns / 1ps

// Testbench for VD 8-Bit ALU

module vd_alu_tb;

    reg [7:0] A, B;
    reg [3:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire CarryOut;
    
    integer i;

    vd_alu_8bit uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut)
    );

    initial begin
        A = 0; B = 0; ALU_Sel = 0;

        $dumpfile("vd_alu_waveform.vcd");
        $dumpvars(0, vd_alu_tb);

        $display("Time\t A\t B\t Sel\t Out\t Carry");
        $monitor("%0d\t %b\t %b\t %b\t %b\t %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut);

        // arithmetic tests
        #10; A = 8'hFF; B = 8'h01; ALU_Sel = 4'b0000;
        #10; A = 8'h0A; B = 8'h05; ALU_Sel = 4'b0001;
        
        // logic and shift tests
        #10; A = 8'h0F; B = 8'h00; ALU_Sel = 4'b0010;
        #10; A = 8'hAA; B = 8'h55; ALU_Sel = 4'b0100;
        #10; A = 8'hF0; B = 8'h0F; ALU_Sel = 4'b0110;
        #10; A = 8'hC3; B = 8'hC3; ALU_Sel = 4'b1011;

        // sweep remaining ops
        #10;
        A = 8'h8A; 
        B = 8'h02;
        for (i = 0; i < 12; i = i + 1) begin
            ALU_Sel = i;
            #10;
        end

        #10 $finish;
    end
endmodule
