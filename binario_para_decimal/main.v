module top (
    input wire clk,
    input wire reset,
    output wire [6:0] bcd_1,
    output wire [6:0] bcd_2,
    output wire [6:0] bcd_3,
    output wire [6:0] bcd_4,
    output wire [6:0] bcd_5
);

wire [19:0] bcd_number;
reg [15:0] number;
reg start, counter;

initial begin
    number = 16'd2555;
    counter = 1'b0;
    start = 1'b0;
end

always @(clk) begin
    if(reset == 1'b1) begin
        counter <= 1'b0;
        start <= 1'b0;
    end else begin
        if(counter == 1'b1 && start == 1'b1) begin
            start <= 1'b0;
        end else if(counter == 1'b0 && start == 1'b0) begin
            start <= 1'b1;
            counter <= 1'b1;
        end 
    end
end

Converter Converter (
    .clk(clk),
    .reset(reset),
    .start(start),
    .number(number),
    .bcd_number(bcd_number)
);

BCD_to_7Segment bcd_m_1(
    .bcd_code(bcd_number[3:0]),
    .seg(bcd_1)
);

BCD_to_7Segment bcd_m_2(
    .bcd_code(bcd_number[7:4]),
    .seg(bcd_2)
);

BCD_to_7Segment bcd_m_3(
    .bcd_code(bcd_number[11:8]),
    .seg(bcd_3)
);

BCD_to_7Segment bcd_m_4(
    .bcd_code(bcd_number[15:12]),
    .seg(bcd_4)
);

BCD_to_7Segment bcd_m_5(
    .bcd_code(bcd_number[19:16]),
    .seg(bcd_5)
);
    
endmodule