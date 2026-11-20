# 8-Bit ALU – Xilinx Vivado / Artix-7

A synthesizable Verilog HDL implementation of an 8-bit ALU targeted at Xilinx Artix-7 FPGAs and developed/tested in Xilinx Vivado.

## Operations

| ALU_Sel | Operation | Result |
|---|---|---|
| 0000 | ADD | A + B |
| 0001 | SUB | A - B |
| 0010 | AND | A & B |
| 0011 | OR | A \| B |
| 0100 | XOR | A ^ B |
| 0101 | NOT A | ~A |
| 0110 | Increment A | A + 1 |
| 0111 | Decrement A | A - 1 |
| 1000 | Shift Left | A << 1 |
| 1001 | Shift Right | A >> 1 |
| 1010 | Compare | A == B |

## Inputs
- `A[7:0]`
- `B[7:0]`
- `ALU_Sel[3:0]`

## Outputs
- `Result[7:0]`
- `Carry`
- `Zero`
- `Overflow`
- `Negative`

## Vivado
1. Create a new RTL project in Xilinx Vivado.
2. Select your Artix-7 FPGA part/board.
3. Add `rtl/alu_8bit.v`.
4. Add `tb/alu_8bit_tb.v` as simulation source.
5. Add the appropriate XDC file from `constraints/` for your exact Artix-7 board.
6. Run **Simulation → Run Behavioral Simulation**.
7. Run **Synthesis → Implementation → Generate Bitstream** when board-specific pin constraints are available.

> Important: Do not use the example XDC blindly. Artix-7 board pin assignments differ by board. Replace the placeholder/example pin names with the pins from your board's master XDC.

## Repository structure

```text
8_bit_alu_artix7/
├── rtl/
│   └── alu_8bit.v
├── tb/
│   └── alu_8bit_tb.v
├── constraints/
│   └── alu_artix7_example.xdc
├── docs/
│   └── operation_table.md
├── .gitignore
├── LICENSE
└── README.md
```
