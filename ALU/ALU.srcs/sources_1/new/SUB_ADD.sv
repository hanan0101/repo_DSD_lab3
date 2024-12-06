`timescale 1ns / 1ps



module SUB_ADD(

    input [3:0] a,
    input [3:0] b,
    input cin,        
    output [3:0] sum,
    output carry
);
    wire [2:0] c;    // Internal carries between full adders
    wire [3:0] y;    // XORed outputs before full adder
    // XOR gates for subtraction control
    xor x1(y[0], b[0], cin);
    xor x2(y[1], b[1], cin);
    xor x3(y[2], b[2], cin);
    xor x4(y[3], b[3], cin);
    // Full adder instantiations
    FF fa0(
        .a(a[0]),
        .b(y[0]),
        .cin(cin),
        .sum(sum[0]),
        .carry(c[0])
    );
    FF fa1(
        .a(a[1]),
        .b(y[1]),
        .cin(c[0]),
        .sum(sum[1]),
        .carry(c[1])
    );
    FF fa2(
        .a(a[2]),
        .b(y[2]),
        .cin(c[1]),
        .sum(sum[2]),
        .carry(c[2])
    );
    FF fa3(
        .a(a[3]),
        .b(y[3]),
        .cin(c[2]),
        .sum(sum[3]),
        .carry(carry)
    );
endmodule


