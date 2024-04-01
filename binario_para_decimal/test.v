module testbench ();
    
reg clk, reset;

always #1 clk = ~clk;

top top(
    .clk(clk),
    .reset(reset)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars;

    clk = 1'b0;
    reset = 1'b1;

    #4

    reset = 1'b0;

    #200

    $finish;
end

endmodule