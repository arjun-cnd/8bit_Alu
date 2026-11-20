## Example XDC template for an Artix-7 board.
## IMPORTANT:
## Replace the placeholder PACKAGE_PIN values and IOSTANDARD
## with the correct pins from your board's master XDC.
##
## Suggested mapping:
## A[7:0]       -> 8 switches
## B[7:0]       -> 8 switches
## ALU_Sel[3:0] -> 4 switches/buttons
## Result[7:0]  -> 8 LEDs
## Carry/Zero/Overflow/Negative -> 4 LEDs
##
## Example syntax:
# set_property PACKAGE_PIN <PIN> [get_ports {A[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]

## Clock is not required by this combinational ALU.
## No clock constraint is therefore necessary.
