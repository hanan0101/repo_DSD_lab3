`timescale 1ns / 1ps



module tb_word;

reg [1:0] in;
wire [15:0] out;

// Instantiate the rotating_word module
rotating_word uut (
    .in(in),
    .out(out)
);

initial begin

    // Test all input combinations
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    $display("input %b ",in);
    $display("output %h",out);
    
    // Finish simulation
    $finish;
end

endmodule
    
   