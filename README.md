# Layered Testbench for D Flip-Flop using SystemVerilog

## Overview

This project implements a **layered testbench architecture** using SystemVerilog to verify the functionality of a D Flip-Flop with asynchronous active-high reset.

The testbench follows a modular approach in which different components are designed independently to generate stimulus, drive inputs, monitor outputs and verify the functionality of the Design Under Test (DUT).

## Design Under Test (DUT)

The DUT is a positive-edge-triggered D Flip-Flop with:
- Asynchronous active-high reset.
- Data input (D).
- Clock input (CLK).
- Normal output (Q).
- Complementary output (Q_bar).

### Functionality

| Reset | Clock | D | Q | Q_bar |
|---|---|---|---|---|
| 1 | X | X | 0 | 1 |
| 0 | Rising Edge | 0 | 0 | 1 |
| 0 | Rising Edge | 1 | 1 | 0 |
| 0 | No Edge | X | Previous Q | Complement of Q |

## Testbench Architecture

The testbench is divided into the following components:

### 1. Packet (`packet.sv`)
- Defines the transaction class.
- Contains randomized input data.
- Stores the observed DUT outputs.
- Provides a display function to print transaction details.

### 2. Generator (`generator.sv`)
- Generates randomized input transactions.
- Randomizes the packet class.
- Sends generated transactions to the driver through a mailbox.

### 3. Driver (`driver.sv`)
- Receives transactions from the generator.
- Drives input data to the DUT through a virtual interface.
- Synchronizes input driving with the clock.

### 4. Monitor (`monitor.sv`)
- Observes DUT inputs and outputs.
- Samples clock, reset, data and output signals.
- Sends collected transactions to the scoreboard through a mailbox.

### 5. Scoreboard (`scoreboard.sv`)
- Receives monitored transactions.
- Compares actual DUT outputs with expected outputs.
- Reports PASS or FAIL based on the verification result.

### 6. Environment (`environment.sv`)
- Instantiates and connects the generator, driver, monitor and scoreboard.
- Creates mailboxes for communication between components.
- Coordinates the execution of testbench components.

### 7. Test (`test.sv`)
- Creates the environment object.
- Passes the interface instance to the environment.
- Starts the verification process by calling the environment's run task.

### 8. Interface (`intf.sv`)
- Declares the signals required for communication between the DUT and testbench.
- Provides a common connection point for the driver and monitor.
- Is accessed by class-based components using a virtual interface.

### 9. Top Module (`tb.sv`)
- Instantiates the interface and DUT.
- Generates the clock.
- Instantiates the test program.
- Acts as the simulation top module.

## Project Directory Structure

```text
Layered_DFF_Testbench/
│
├── D_FF.sv
│
├── SystemVerilog/
│   ├── intf.sv
│   ├── packet.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   ├── environment.sv
│   ├── test.sv
│   └── tb.sv
│
└── README.md
```

## Communication Mechanism

The testbench uses SystemVerilog mailboxes for communication between different components.

- **Mailbox 1:** Transfers randomized transactions from the generator to the driver.
- **Mailbox 2:** Transfers monitored DUT responses from the monitor to the scoreboard.

Virtual interfaces are used to provide access to DUT signals from class-based components.

## Verification Flow

1. The top module generates the clock and instantiates the DUT and interface.
2. The test program creates the environment.
3. The generator creates randomized input transactions.
4. The driver receives transactions and applies inputs to the DUT.
5. The DUT performs its D Flip-Flop operation.
6. The monitor captures the DUT inputs and outputs.
7. The scoreboard checks the DUT response against the expected result.
8. The simulation reports PASS or FAIL.

## Tools Used

- **Hardware Description Language:** SystemVerilog
- **Simulation and Verification:** Xilinx Vivado / XSim
- **Verification Concepts:** Object-Oriented Programming, Classes, Mailboxes, Virtual Interfaces, Fork-Join Concurrency and Layered Testbench Architecture.

## Key Concepts Demonstrated

- Modular testbench design.
- Object-oriented programming in SystemVerilog.
- Random stimulus generation.
- Inter-process communication using mailboxes.
- Virtual interface implementation.
- Concurrent execution using `fork...join`.
- Functional verification using a scoreboard.

## Future Improvements

- Extend randomized testing to multiple transactions.
- Add more asynchronous reset test scenarios.
- Implement functional coverage.
- Add assertions for improved verification.
- Expand the testbench to support additional sequential circuits.

## Conclusion

This project demonstrates the implementation of a modular, class-based layered testbench for verifying a D Flip-Flop using SystemVerilog. It provides practical experience with object-oriented verification concepts and establishes a foundation for developing more advanced verification environments.
