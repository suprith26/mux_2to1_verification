`timescale 1ns/1ps

module mux_tb;

    logic a;
    logic b;
    logic sel;
    logic y;

    int pass_count = 0;
    int fail_count = 0;

    // Instantiate DUT
    mux2to1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Reusable test task
    task automatic run_test(
        input logic a_in,
        input logic b_in,
        input logic sel_in
    );

        logic expected;

        begin

            // Apply inputs
            a   = a_in;
            b   = b_in;
            sel = sel_in;

            // Calculate expected output
            if (sel_in == 1'b0)
                expected = a_in;
            else
                expected = b_in;

            // Wait before checking
            #10;

            // Compare DUT output with expected output
            if (y === expected) begin
                $display(
                    "Time: %0t a=%0b b=%0b sel=%0b y=%0b expected=%0b PASS",
                    $time, a, b, sel, y, expected
                );

                pass_count++;
            end
            else begin
                $display(
                    "Time: %0t a=%0b b=%0b sel=%0b y=%0b expected=%0b FAIL",
                    $time, a, b, sel, y, expected
                );

                fail_count++;
            end

        end
    endtask


    initial begin

        $timeformat(-9, 0, " ns", 10);

        // Waveform generation
        $dumpfile("dump.vcd");
        $dumpvars(0, mux_tb);

        // Initial values
        a   = 0;
        b   = 0;
        sel = 0;

        // Required test cases
        run_test(0, 0, 0);
        run_test(1, 0, 0);
        run_test(0, 1, 1);
        run_test(1, 1, 1);

        // Final result
        $display("--------------------------------");
        $display("Simulation Summary");
        $display("PASS = %0d", pass_count);
        $display("FAIL = %0d", fail_count);
        $display("--------------------------------");

        if (fail_count == 0)
            $display("ALL TESTS PASSED");
        else
            $display("SOME TESTS FAILED");

        $finish;

    end

endmodule
