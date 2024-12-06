`timescale 1ns / 1ps

module rotating_word(
    input wire [1:0] in,
    output reg[15:0] out
);
   
 always @(in) 
begin
    case(in)
        2'b00: out = 16'hC0dE;  // C0dE      
        2'b01: out = 16'hE0Cd;          
        2'b10: out = 16'hdEC0;
        2'b11: out = 16'h0dCE;    
    endcase
end
endmodule
 
 