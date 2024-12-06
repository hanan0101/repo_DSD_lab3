`timescale 1ns / 1ps

module ALU(
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic [9:8] s,
    output logic [3:0] op_out, // Use op_out as the output
    output logic cout          // Include cout if needed
);

    logic [3:0] w1;  
    logic mode;
    assign mode = s[8];

    // Instantiate sub_add module
    sub_add inst1(
        .a(a),
        .b(b),
        .sum(w1),
        .cin(mode),
        .carry(cout)
    );

    logic [3:0] shiftand_result;

    always @ (a, b, mode) begin
        case (mode)
            1'b0: shiftand_result = a << 1;  // Shift left by 1
            1'b1: shiftand_result = a & b;    // AND operation
            default: shiftand_result = 4'b0000; // Default case
        endcase
    end

    always @ (*) begin
        case (s[9])
            1'b0: op_out = w1;  // Use w1 for addition/subtraction
            1'b1: op_out = shiftand_result;  // Use result from shift/AND operation
            default: op_out = 4'b0000; // Default case
        endcase
    end
endmodule