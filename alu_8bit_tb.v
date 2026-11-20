`timescale 1ns / 1ps

module alu_8bit_tb;

    reg  [7:0] A;
    reg  [7:0] B;
    reg  [3:0] ALU_Sel;

    wire [7:0] Result;
    wire       Carry;
    wire       Zero;
    wire       Overflow;
    wire       Negative;

    alu_8bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero),
        .Overflow(Overflow),
        .Negative(Negative)
    );

    task test;
        input [3:0] op;
        input [7:0] a;
        input [7:0] b;
        begin
            ALU_Sel = op;
            A = a;
            B = b;
            #10;
            $display(
                "time=%0t A=%h B=%h SEL=%b RESULT=%h C=%b Z=%b OV=%b N=%b",
                $time, A, B, ALU_Sel, Result, Carry, Zero, Overflow, Negative
            );
        end
    endtask

    initial begin
        A = 8'h00;
        B = 8'h00;
        ALU_Sel = 4'b0000;

        // ADD
        test(4'b0000, 8'h15, 8'h27); // 3C
        test(4'b0000, 8'hFF, 8'h01); // 00, carry

        // SUB
        test(4'b0001, 8'h35, 8'h12); // 23
        test(4'b0001, 8'h10, 8'h20); // F0

        // Logic
        test(4'b0010, 8'hAA, 8'h0F); // AND
        test(4'b0011, 8'hAA, 8'h0F); // OR
        test(4'b0100, 8'hAA, 8'h0F); // XOR
        test(4'b0101, 8'hAA, 8'h00); // NOT

        // Increment / decrement
        test(4'b0110, 8'h7F, 8'h00);
        test(4'b0111, 8'h10, 8'h00);

        // Shifts
        test(4'b1000, 8'b10000001, 8'h00);
        test(4'b1001, 8'b10000001, 8'h00);

        // Compare
        test(4'b1010, 8'h55, 8'h55);
        test(4'b1010, 8'h55, 8'hAA);

        #10;
        $finish;
    end

endmodule
