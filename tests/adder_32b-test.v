//Testbench for adder 32b

`include "Single Cycle Processor/adder_32b.v"

module Testbench;

    logic  [31:0] in0;
    logic  [31:0] in1;
    logic  [31:0] sum;

    adder_32b dut 
    (
        .in0 (in0),
        .in1 (in1),
        .sum (sum)
    );

    task check
    (
        input  [31:0] in0_,
        input  [31:0] in1_,
        output [31:0] sum_expected,
    );

    begin

        in0 = in0_;
        in1 = in1_;

        if (sum != sum_expected) begin
            $display("FAIL");
        end else begin
            $display("PASS")
        end

    end
    endtask

    task basic_test_case;
        
        begin 
            $display("\n Running basic test case");
            check(32'd0, 32'd0, 32'd0);
            check(32'd3, 32'd1, 32'd4);
        end

    endtask

    initial begin

        basic_test_case();

        $display("\n all tests passed");
        $finish;

    end

endmodule