// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter ADDR_WIDTH = 6   ,
    parameter DATA_WIDTH = 24
)(

`ifdef USE_POWER_PINS
    inout vcc,	
    inout vss,	
`endif

    // IOs
    input   [37:0]  io_in,
    output  [37:0]  io_out,
    output  [37:0]  io_oeb,

);

    wire clk;
    assign clk = io_in[5];

    wire wc;
    assign wc = io_in[6];

    wire en;
    assign en = io_in[7];

    wire [DATA_WIDTH-1:0] data_in;
    reg  [DATA_WIDTH-1:0] data_out;
    assign data_in = io_in[8+DATA_WIDTH-1:8];
    assign io_out[8+DATA_WIDTH-1:8] = data_out;

    wire [ADDR_WIDTH-1:0] addr;
    assign addr = io_in[16+ADDR_WIDTH-1:16];

    assign io_oeb = {{(30-ADDR_WIDTH-DATA_WIDTH){0}}, {(ADDR_WIDTH){0}}, {(DATA_WIDTH){~wc}}, 3'b000, 5'b00000};

    reg [DATA_WIDTH-1:0] data[(1<<(ADDR_WIDTH))-1:0];

    always @(posedge clk) begin
        if (en) begin
            if (wc) begin
                data[addr] <= data_in;
            end else begin
                data_out <= data[addr];
            end
        end
    end

endmodule

`default_nettype wire
