```verilog id="8a3n7u"
`timescale 1ns/1ps

module ram_controller_tb;

    reg clk;
    reg rst;

    reg wr_en;
    reg rd_en;

    reg [3:0] addr;
    reg [7:0] data_in;

    wire [7:0] data_out;

    // Instantiate RAM Controller
    ram_controller #(
        .DATA_WIDTH(8),
        .ADDR_WIDTH(4)
    ) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // ------------------------------------------------
    // Clock generation
    // 50 MHz clock
    // Period = 20 ns
    // ------------------------------------------------

    initial begin
        clk = 1'b0;

        forever #10 clk = ~clk;
    end

    // ------------------------------------------------
    // Simulation
    // ------------------------------------------------

    initial begin

        // Generate waveform
        $dumpfile("ram.vcd");
        $dumpvars(0, ram_controller_tb);

        // Initial values
        rst     = 1'b1;
        wr_en   = 1'b0;
        rd_en   = 1'b0;
        addr    = 4'd0;
        data_in = 8'h00;

        // Reset
        #50;
        rst = 1'b0;

        // -----------------------------
        // Write data
        // -----------------------------

        @(posedge clk);
        wr_en   = 1'b1;
        addr    = 4'd0;
        data_in = 8'hAA;

        @(posedge clk);
        wr_en   = 1'b0;

        $display("WRITE: Address = 0, Data = AA");

        @(posedge clk);
        wr_en   = 1'b1;
        addr    = 4'd1;
        data_in = 8'h55;

        @(posedge clk);
        wr_en   = 1'b0;

        $display("WRITE: Address = 1, Data = 55");

        @(posedge clk);
        wr_en   = 1'b1;
        addr    = 4'd2;
        data_in = 8'hF0;

        @(posedge clk);
        wr_en   = 1'b0;

        $display("WRITE: Address = 2, Data = F0");

        // -----------------------------
        // Read data
        // -----------------------------

        @(posedge clk);
        rd_en = 1'b1;
        addr  = 4'd0;

        @(posedge clk);
        rd_en = 1'b0;

        $display("READ : Address = 0, Data = %h", data_out);

        @(posedge clk);
        rd_en = 1'b1;
        addr  = 4'd1;

        @(posedge clk);
        rd_en = 1'b0;

        $display("READ : Address = 1, Data = %h", data_out);

        @(posedge clk);
        rd_en = 1'b1;
        addr  = 4'd2;

        @(posedge clk);
        rd_en = 1'b0;

        $display("READ : Address = 2, Data = %h", data_out);

        // -----------------------------
        // End simulation
        // -----------------------------

        #20;

        $display("----------------------------------------");
        $display("RAM CONTROLLER SIMULATION");
        $display("----------------------------------------");
        $display("Data Width : 8 bits");
        $display("RAM Depth  : 16");
        $display("Status     : SIMULATION COMPLETED");
        $display("----------------------------------------");

        $finish;

    end

endmodule
```
