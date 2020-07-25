////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _               //
//                                           / _(_)    | |   | |              //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
//                  | |                                                       //
//                  |_|                                                       //
//                                                                            //
//                                                                            //
//              MPSoC-RISCV CPU                                               //
//              General Purpose Input Output Bridge                           //
//              AMBA3 AHB-Lite Bus Interface                                  //
//              Universal Verification Methodology                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* Copyright (c) 2018-2019 by the author(s)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * =============================================================================
 * Author(s):
 *   Paco Reina Campo <pacoreinacampo@queenfield.tech>
 */

class ahb3_write_sequence extends uvm_sequence#(ahb3_transaction);  
  `uvm_object_utils(ahb3_write_sequence)

  function new(string name = "");
    super.new(name);
  endfunction

  task body();
    begin
      `uvm_do_with(req,{req.hready == 1'b0;req.hwrite == 1'b1;})
      `uvm_do_with(req,{req.haddr == 8'h00;req.hwdata == 32'hffffeeee;req.hready == 1'b1;req.hwrite == 1'b1;})
      `uvm_do_with(req,{req.hready == 1'b0;req.hwrite == 1'b1;})
      `uvm_do_with(req,{req.haddr == 8'h04;req.hwdata == 32'hffff1111;req.hready == 1'b1;req.hwrite == 1'b1;})
      `uvm_do_with(req,{req.hready == 1'b0;req.hwrite == 1'b1;})
      `uvm_do_with(req,{req.haddr == 8'h08;req.hwdata == 32'hffff2222;req.hready == 1'b1;req.hwrite == 1'b1;})
    end
  endtask
endclass