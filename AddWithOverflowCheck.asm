// AddWithOverflowCheck.asm
// Computes z = x + y with overflow detection

@R0
D=M          // D = x

@R1
D=D+M        // D = x + y

@R2
M=D          // Store sum in R2

// Overflow detection
@R0
D=M          // D = x
@POSITIVE_X
D;JGE        // If x >= 0, jump to POSITIVE_X

@R1
D=M
@NEGATIVE_OVERFLOW
D;JLT        // If y < 0 and x < 0, check for overflow

@END
0;JMP

(POSITIVE_X)
@R1
D=M
@POSITIVE_OVERFLOW
D;JGE        // If y >= 0 and x >= 0, check for overflow

@END
0;JMP

(NEGATIVE_OVERFLOW)
@R2
D=M
@NO_OVERFLOW
D;JLT        // If sum is still negative, no overflow

@R3
M=1          // Overflow detected
@END
0;JMP

(POSITIVE_OVERFLOW)
@R2
D=M
@NO_OVERFLOW
D;JGE        // If sum is positive, no overflow

@R3
M=1          // Overflow detected
@END
0;JMP

(NO_OVERFLOW)
@R3
M=0          // No overflow

(END)
