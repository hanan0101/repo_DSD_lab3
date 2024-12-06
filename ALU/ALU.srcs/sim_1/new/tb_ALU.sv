`timescale 1ns / 1ps

module tb_ALU;
    logic [3:0] a;
    logic [3:0] b; // Correct size for b
    logic [1:0] s; // Selector
    logic [3:0] sum; // Output from ALU
    logic carry;

    // Instantiate the ALU module
    ALU dut (
        .a(a),
        .b(b),
        .sel(s),
        .op_out(sum)
    );

    initial begin
        // Monitor signal values
        $monitor("Time=%0t | a=%b, b=%b, s=%b | sum=%b",
                 $time, a, b, s, sum ,carry);

        // Test cases
        a = 4'b0001; b = 4'b0011; carry =1'b0; s = 2'b00; // Add
        #10;

        a = 4'b1001; b = 4'b0111; carry =1'b1;s = 2'b01; // Sub
        #10;

        a = 4'b0011; b = 4'b1010; carry =1'b0; s = 2'b10; // Shift
        #10;

        a = 4'b1111; b = 4'b1100; carry =1'b1; s = 2'b11; // AND
        #10;

        $finish;
    end
endmodule