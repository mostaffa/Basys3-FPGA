module gates (
    input logic a,
    input logic b,
    input logic c,
    output logic out_and,
    output logic out_xor
);

// describ physical connections

// 1. out_and signal
assign out_and = a & b;

// 2. out_xor signal
assign out_xor = out_and ^ c;


endmodule