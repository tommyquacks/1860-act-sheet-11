// AbsoluteValue.asm
// Computes absolute value of x

@R0
D=M          // D = x

@R1
M=D          // Assume |x| = x

@R2
M=0          // R2 = 0 (Assume x is non-negative)

@R3
M=0          // R3 = 0 (Assume absolute value can be computed)

@R0
D=M
@NEGATIVE
D;JLT        // If x < 0, jump to NEGATIVE

@END
0;JMP        // If x >= 0, jump to END

(NEGATIVE)
@R2
M=1          // x was negative, set R2 flag

@R0
D=M
D=-D         // Compute -x

@R1
M=D          // Store |x| in R1

@END
0;JMP

(END)
