`timescale 1ns / 1ps

// 8-bit ALU for Xilinx Artix-7 FPGA
// Synthesizable Verilog-2001

module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [3:0] ALU_Sel,
    output reg  [7:0] Result,
    output reg        Carry,
    output reg        Zero,
    output reg        Overflow,
    output reg        Negative
);

    reg [8:0] temp;

    always @(*) begin
        // Default values
        Result   = 8'b0;
        Carry    = 1'b0;
        Overflow = 1'b0;

        case (ALU_Sel)

            4'b0000: begin // ADD
                temp     = {1'b0, A} + {1'b0, B};
                Result   = temp[7:0];
                Carry    = temp[8];
                Overflow = (~(A[7] ^ B[7])) & (Result[7] ^ A[7]);
            end

            4'b0001: begin // SUB
                temp     = {1'b0, A} - {1'b0, B};
                Result   = temp[7:0];
                Carry    = (A >= B); // 1 = no borrow
                Overflow = (A[7] ^ B[7]) & (Result[7] ^ A[7]);
            end

            4'b0010: begin // AND
                Result = A & B;
            end

            4'b0011: begin // OR
                Result = A | B;
            end

            4'b0100: begin // XOR
                Result = A ^ B;
            end

            4'b0101: begin // NOT A
                Result = ~A;
            end

            4'b0110: begin // Increment A
                temp   = {1'b0, A} + 9'b1;
                Result = temp[7:0];
                Carry  = temp[8];
            end

            4'b0111: begin // Decrement A
                Result = A - 8'b1;
                Carry  = (A != 8'b0); // 1 = no borrow
            end

            4'b1000: begin // Shift Left
                Result = A << 1;
                Carry  = A[7];
            end

            4'b1001: begin // Shift Right
                Result = A >> 1;
                Carry  = A[0];
            end

            4'b1010: begin // Compare A == B
                Result = (A == B) ? 8'b00000001 : 8'b00000000;
            end

            default: begin
                Result   = 8'b0;
                Carry    = 1'b0;
                Overflow = 1'b0;
            end
        endcase

        Zero     = (Result == 8'b0);
        Negative = Result[7];
    end

endmodule
