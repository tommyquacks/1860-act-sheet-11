// EvaluateExpression.asm
// Computes z = 17 + x - 3y

@R0         // Load x
D=M         // D = x

@17         // Load constant 17
D=D+A       // D = 17 + x

@R1         // Load y
D=D-M       // D = 17 + x - y

D=D-M       // D = 17 + x - 2y
D=D-M       // D = 17 + x - 3y

@R2         // Store result in R2
M=D         // R2 = 17 + x - 3y
