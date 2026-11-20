# 8-Bit ALU Operation Table

| Select | Operation | Equation |
|---|---|---|
| 0000 | Addition | A + B |
| 0001 | Subtraction | A - B |
| 0010 | AND | A & B |
| 0011 | OR | A \| B |
| 0100 | XOR | A ^ B |
| 0101 | NOT | ~A |
| 0110 | Increment | A + 1 |
| 0111 | Decrement | A - 1 |
| 1000 | Shift Left | A << 1 |
| 1001 | Shift Right | A >> 1 |
| 1010 | Compare | 1 if A == B, otherwise 0 |

### Flags

- **Carry:** Carry-out for addition, no-borrow indicator for subtraction, or shifted-out bit.
- **Zero:** `1` when the result is zero.
- **Overflow:** Signed arithmetic overflow for ADD/SUB.
- **Negative:** Copy of `Result[7]`.
