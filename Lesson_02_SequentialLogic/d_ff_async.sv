module d_ff_async (
	input logic clk,
	input logic rst,
	input logic d,
	output logic q
);

always_ff @(posedge clk, posedge rst) begin
	if (rst) begin
		q <= 0;
	end else begin
		q <= d;
	end
end

endmodule
