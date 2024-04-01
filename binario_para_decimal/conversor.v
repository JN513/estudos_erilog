module Converter (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [15:0] number,
    output wire [19:0] bcd_number
);

localparam IDLE = 2'b00;
localparam RUN  = 2'b01;
localparam SUM  = 2'b10;

reg [1:0] state;
reg [3:0] bcd_number_1, bcd_number_2, bcd_number_3, bcd_number_4, bcd_number_5;
reg [19:0] input_number;

wire zero = ~( |input_number );

initial begin
    bcd_number_1 = 4'h0;
    bcd_number_2 = 4'h0;
    bcd_number_3 = 4'h0;
    bcd_number_4 = 4'h0;
    bcd_number_5 = 4'h0;
    state = IDLE;
end

always @(posedge clk ) begin
    if(reset == 1'b1) begin
        bcd_number_1 <= 4'h0;
        bcd_number_2 <= 4'h0;
        bcd_number_3 <= 4'h0;
        bcd_number_4 <= 4'h0;
        bcd_number_5 <= 4'h0;
        state <= IDLE;
        input_number <= 20'h00000;
    end else begin
        case (state)
            IDLE: begin
                if(start == 1'b1) begin
                    state <= RUN;
                    bcd_number_1 <= 4'h0;
                    bcd_number_2 <= 4'h0;
                    bcd_number_3 <= 4'h0;
                    bcd_number_4 <= 4'h0;
                    bcd_number_5 <= 4'h0;
                    input_number <= number;
                end
                else state <= IDLE;
            end
            RUN: begin
                if(zero == 1'b0) begin
                    bcd_number_1 <= {bcd_number_1[2:0], input_number[19]};
                    bcd_number_2 <= {bcd_number_2[2:0], bcd_number_1[3]};
                    bcd_number_3 <= {bcd_number_3[2:0], bcd_number_2[3]};
                    bcd_number_4 <= {bcd_number_4[2:0], bcd_number_3[3]};
                    bcd_number_5 <= {bcd_number_5[2:0], bcd_number_4[3]};
                    input_number <= {input_number[18:0], 1'b0};

                    state <= SUM;
                end else begin
                    state <= IDLE;
                end
            end
            SUM: begin
                if(zero == 1'b0) begin
                    if(bcd_number_1 > 'd4)
                        bcd_number_1 <= bcd_number_1 + 'd3;
                    if(bcd_number_2 > 'd4)
                        bcd_number_2 <= bcd_number_2 + 'd3;
                    if(bcd_number_3 > 'd4)
                        bcd_number_3 <= bcd_number_3 + 'd3;
                    if(bcd_number_4 > 'd4)
                        bcd_number_4 <= bcd_number_4 + 'd3;
                    if(bcd_number_5 > 'd4)
                        bcd_number_5 <= bcd_number_5 + 'd3;
                        
                    state <= RUN;
                end else begin
                    state <= IDLE;
                end
            end
            default: state <= IDLE;
        endcase
    end
end

assign bcd_number = {bcd_number_5, bcd_number_4, bcd_number_3, bcd_number_2, bcd_number_1};
    
endmodule
