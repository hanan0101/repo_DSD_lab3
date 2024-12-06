    module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW     
);


logic reset_n;
logic clk;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;


// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];

/*
//for word
logic [1:0]in;
logic [15:0]out;
//assign in =SW[3:0];
assign in = SW[1:0];
*/

logic [3:0]in;
logic [3:0]out;

incrementer_circuit_ROM rom(.in(in),
                            .out(out));
                            

assign digits[0] = in[3:0]; //input 
assign digits[1] = out[7:4]; //output 
assign digits[2] = SW[11:8];
assign digits[3] = SW[15:12];
assign digits[4] = 4'b1111;
assign digits[5] = 4'b1111;
assign digits[6] = 4'b1111;
assign digits[7] = 4'b1111;


sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);

/* rotating_word word(.out(out),.in(in));
*/



assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : sev_seg_top