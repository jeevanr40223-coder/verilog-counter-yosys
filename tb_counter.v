`timescale 1ns/1ps

module tb_counter;
    reg clk = 0;
    reg rst = 1;
    wire [3:0] count;

    counter dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter);

        $monitor("Time=%0t ns | reset=%b | count=%d",
                 $time, rst, count);

        #12 rst = 0;
        repeat (18) @(posedge clk);
        #1;
        $finish;
    end
endmodule
