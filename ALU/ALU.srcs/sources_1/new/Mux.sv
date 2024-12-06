`timescale 1ns / 1ps



module Mux(

input logic [3:0]a , // for 10 shifting 
input logic [3:0]b,
input logic s ,
output logic [3:0]op

    );
    logic [3:0] shift;
    logic [3:0] andop;
    assign shift = a >> b;
    assign andop = a&b; 
    
always @( a , b ,s ) 

begin 
   if(s==0)
     op <= shift;
   else
  op <=  andop; 
 end 
    
endmodule
