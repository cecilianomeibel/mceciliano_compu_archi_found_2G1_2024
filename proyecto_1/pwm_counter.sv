// pwm_counter.v
module pwm_counter (
    input  logic clk,
    input  logic rst,
    input  logic [3:0] duty_multiplier,
    output logic pwm_out
);

parameter WIDTH = 8;

logic [WIDTH-1:0] count;
logic [WIDTH-1:0] duty_value;

// Instantiate a counter module
counter #(.WIDTH(8)) counter_inst (
   .clk(clk),
   .rst(rst),
   .count(count)
);

// Instantiate a comparator module
comparator #(.WIDTH(8)) comparator_inst (
   .a(count),
   .b(duty_value),
   .lt(pwm_out)
);

// Calculate the duty value
assign duty_value = duty_multiplier * (2**8)/10;

endmodule

// counter.v
module counter #(
    parameter WIDTH = 8
) (
    input  logic clk,
    input  logic rst,
    output logic [WIDTH-1:0] count
);

reg [WIDTH-1:0] count_reg;

always @(posedge clk, negedge rst) begin
    if (!rst) begin
        count_reg <= {WIDTH{1'b0}};
    end else begin
        count_reg <= count_reg + 1;
    end
end

assign count = count_reg;

endmodule

// comparator.v
module comparator #(
    parameter WIDTH = 8
) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic lt
);

assign lt = (a < b);

endmodule