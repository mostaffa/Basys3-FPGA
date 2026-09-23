module mux (
    input logic d0,
    input logic d1,
    input logic sel,
    output logic y
);

always_comb begin
    if (sel) begin
        y = d1;
    end else begin
        y = d0;
    end
end

endmodule
