// Xor.asm
// Computes z = x ⊕ y (bitwise XOR)

@R0
D=M        // D = x

@R1
D=D&M      // D = x AND y

@R0
A=M
D=D|A      // D = (x AND y) OR x

@R1
A=M
D=D|A      // D = (x AND y) OR x OR y

@R0
A=M
D=!D       // D = NOT((x AND y) OR x OR y) (Equivalent to XOR)

@R2
M=D        // Store result in R2
