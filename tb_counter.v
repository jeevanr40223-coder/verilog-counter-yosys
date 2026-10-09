`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg rst;
    reg en;
    wire [3:0] count;

    counter #(.WIDTH(4)) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter);

        clk = 0;
        rst = 1;
        en = 0;

        @(posedge clk);
        #1;
        if (count !== 4'd0)
            $fatal(1, "FAIL: Reset did not clear counter");

        rst = 0;
        en = 1;

        repeat (3) @(posedge clk);
        #1;
        if (count !== 4'd3)
            $fatal(1, "FAIL: Expected count 3, got %0d", count);

        en = 0;
        repeat (2) @(posedge clk);
        #1;
        if (count !== 4'd3)
            $fatal(1, "FAIL: Counter changed while disabled");

        en = 1;
        repeat (13) @(posedge clk);
        #1;
        if (count !== 4'd0)
            $fatal(1, "FAIL: Expected wraparound to 0, got %0d", count);

        $display("PASS: Reset, enable, hold, and wraparound tests passed.");
        $finish;
    end

endmodule
