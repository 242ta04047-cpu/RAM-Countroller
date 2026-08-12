```verilog id="2j5f7w"
`timescale 1ns/1ps

module ram_controller #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input  wire                  clk,
    input  wire                  rst,

    input  wire                  wr_en,
    input  wire                  rd_en,

    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [DATA_WIDTH-1:0] data_in,

    output reg  [DATA_WIDTH-1:0] data_out
);

    // 16 x 8-bit RAM
    reg [DATA_WIDTH-1:0] memory [0:15];

    // RAM read/write operation
    always @(posedge clk) begin

        if (rst) begin
            data_out <= 8'h00;
        end

        else begin

            // Write operation
            if (wr_en) begin
                memory[addr] <= data_in;
            end

            // Read operation
            if (rd_en) begin
                data_out <= memory[addr];
            end

        end

    end

endmodule
```

