# mux_2to1_verification
Verification of a 2:1 Multiplexer using a SystemVerilog testbench
# 2:1 Multiplexer Verification Using SystemVerilog

## Project Description

This project verifies the functionality of a 2:1 Multiplexer using a SystemVerilog testbench.

The design was simulated using EDA Playground.

The testbench applies different input values to the Multiplexer, checks the DUT output, compares it with the expected output, and displays whether each test case has passed or failed.

## DUT Functionality

The DUT is a 2:1 Multiplexer.

DUT stands for **Design Under Test**.

The Multiplexer has three inputs:

* `a`
* `b`
* `sel`

and one output:

* `y`

The Multiplexer works as follows:

* When `sel = 0`, output `y` should be equal to input `a`.
* When `sel = 1`, output `y` should be equal to input `b`.

The main DUT logic is:

```systemverilog
assign y = sel ? b : a;
```

## Verification Approach

A SystemVerilog testbench was created to verify the DUT.

The testbench performs the following steps:

1. Applies values to inputs `a`, `b`, and `sel`.
2. Calculates the expected output.
3. Reads the actual DUT output `y`.
4. Compares the actual output with the expected output.
5. Displays PASS or FAIL for each test case.
6. Generates waveform data for verification using EPWave.

A clock and reset are not required because the 2:1 Multiplexer is combinational logic and does not store any previous state.

## Test Scenarios

| Test Case | a | b | sel | Expected y |
| --------- | - | - | --- | ---------- |
| 1         | 0 | 0 | 0   | 0          |
| 2         | 1 | 0 | 0   | 1          |
| 3         | 0 | 1 | 1   | 1          |
| 4         | 1 | 1 | 1   | 1          |

## Simulation Result

The simulation completed successfully.

```text
PASS = 4
FAIL = 0
ALL TESTS PASSED
```

All four required test cases passed.

## Waveform Verification

The waveform was viewed using EPWave.

The following signals were observed:

* `a`
* `b`
* `sel`
* `y`

The waveform confirms that:

* When `sel = 0`, `y` follows `a`.
* When `sel = 1`, `y` follows `b`.

## Tools Used

* SystemVerilog
* EDA Playground
* Icarus Verilog
* EPWave
* GitHub

## Project Files

```text
mux_2to1_verification/
├── mux.sv
├── mux_tb.sv
├── README.md
└── waveform.png
```

* `mux.sv` contains the 2:1 Multiplexer DUT.
* `mux_tb.sv` contains the SystemVerilog testbench.
* `README.md` contains the project documentation.
* `waveform.png` contains the EPWave waveform screenshot.

## EDA Playground Link

(https://www.edaplayground.com/x/hFYe)

## Conclusion

The 2:1 Multiplexer was successfully verified using a SystemVerilog testbench.

The testbench generated stimulus, checked the DUT output against the expected result, and reported PASS or FAIL for each test case.

All four required test cases passed successfully.
