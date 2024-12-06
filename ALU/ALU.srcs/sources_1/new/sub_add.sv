`timescale 1ns / 1ps

module ALU(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [1:0] sel,
    output logic [3:0] op_out
);

    // Internal signals
    logic [3:0] mux_out; 

    // Instantiate Mux
    Mux dut (
        .a(a), 
        .b(b),
        .s(sel[0]), // MUX controlled by sel[0]
        .op(mux_out)
    );

    logic carry;
    logic [3:0] sum;

    // Instantiate sub_add
    SUB_ADD dut2 (
        .a(a),
        .b(b),
        .cin(sel[0]), // Carry in also controlled by sel[0]
        .sum(sum),
        .carry(carry)
    );

    // Always block for output selection using sel[1]
    always @(*) begin
        if (sel[1] == 0) 
            op_out <= sum; // Use sum for addition/subtraction
        else 
            op_out <= mux_out; // Use MUX output for shift/AND
    end 
endmodule