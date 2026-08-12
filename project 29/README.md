# RAM Controller in Verilog

## Description

This project implements a simple **RAM Controller using Verilog HDL**.

The RAM controller allows data to be written to and read from specific memory addresses. The design uses write and read enable signals to control memory operations.

This project implements a **16 × 8-bit RAM**, meaning it contains 16 memory locations and each location can store 8 bits of data.

## Features

* Verilog HDL implementation
* 8-bit data width
* 16 memory locations
* 4-bit address
* Synchronous write operation
* Synchronous read operation
* Read and write enable signals
* Testbench included
* VCD waveform generation
* GTKWave simulation support

## RAM Configuration

| Parameter     |       Value |
| ------------- | ----------: |
| Data Width    |      8 bits |
| RAM Depth     |          16 |
| Address Width |      4 bits |
| Clock         |      50 MHz |
| Read          | Synchronous |
| Write         | Synchronous |

## Block Diagram

```text id="9q8m1v"
                  +--------------------+
                  |   RAM CONTROLLER   |
                  |                    |
     clk -------->|                    |
     wr_en ------>|                    |
     rd_en ------>|                    |
     addr ------->|     RAM MEMORY     |----> data_out
     data_in ---->|                    |
                  |                    |
                  +--------------------+
```

## Working Principle

### Write Operation

When `wr_en` is HIGH, the input data is stored at the selected address.

For example:

```text id="4ld3e7"
wr_en  = 1
addr   = 4'd2
data_in = 8'hF0
```

The RAM stores:

```text id="z5h85u"
Memory[2] = F0
```

### Read Operation

When `rd_en` is HIGH, the data stored at the selected address is transferred to `data_out`.

For example:

```text id="x2s7yq"
rd_en = 1
addr  = 4'd2
```

The output becomes:

```text id="c5j7q3"
data_out = F0
```

## Memory Organization

```text id="q9s44e"
Address       Data
--------------------
0000          8 bits
0001          8 bits
0010          8 bits
0011          8 bits
0100          8 bits
0101          8 bits
0110          8 bits
0111          8 bits
1000          8 bits
1001          8 bits
1010          8 bits
1011          8 bits
1100          8 bits
1101          8 bits
1110          8 bits
1111          8 bits
```

## Project Structure

```text id="d8o1ba"
RAM-Controller-Verilog/
│
├── README.md
│
├── src/
│   └── ram_controller.v
│
├── tb/
│   └── ram_controller_tb.v
│
└── simulation/
    └── simulation_output.txt
```

## Simulation

### Compile

```bash id="x3s8v5"
iverilog -o ram_sim src/ram_controller.v tb/ram_controller_tb.v
```

### Run

```bash id="4smc3v"
vvp ram_sim
```

### Expected Output

```text id="p2q29y"
WRITE: Address = 0, Data = AA
WRITE: Address = 1, Data = 55
WRITE: Address = 2, Data = F0
READ : Address = 0, Data = aa
READ : Address = 1, Data = 55
READ : Address = 2, Data = f0
----------------------------------------
RAM CONTROLLER SIMULATION
----------------------------------------
Data Width : 8 bits
RAM Depth  : 16
Status     : SIMULATION COMPLETED
----------------------------------------
```

## Waveform

The testbench generates:

```text id="j0j1du"
ram.vcd
```

Open the waveform using GTKWave:

```bash id="p76nmg"
gtkwave ram.vcd
```

Important signals:

```text id="bq8k6j"
clk
rst
wr_en
rd_en
addr
data_in
data_out
```

The waveform demonstrates data being written into RAM and subsequently read from the selected addresses.

## Applications

RAM controllers are used in:

* FPGA designs
* Microprocessors
* Embedded systems
* Digital systems
* Data storage
* Buffer systems
* Image processing
* Computer architecture

## Future Improvements

* Larger RAM size
* Parameterized memory depth
* Parameterized data width
* Asynchronous read
* Byte-enable support
* Dual-port RAM
* Burst read/write operations
* Memory initialization from a file

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## Author

**Your Name**

## License
