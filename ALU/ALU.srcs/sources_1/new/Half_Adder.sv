`timescale 1ns / 1ps


module Half_Adder(
input a,
input b,
 output sum,
output carry);


xor (sum,a,b);
and (carry,a,b);
endmodule

