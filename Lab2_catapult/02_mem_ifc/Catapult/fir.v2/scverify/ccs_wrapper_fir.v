// SCVerify DUT wrapper used for SystemC > HDL interface bindings


module ccs_wrapper (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_radr, coeffs_rsc_re, coeffs_rsc_q, coeffs_triosy_lz,
      coeff_addr_rsc_dat, coeff_addr_rsc_vld, coeff_addr_rsc_rdy, output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  output [4:0] coeffs_rsc_radr;
  output coeffs_rsc_re;
  input [63:0] coeffs_rsc_q;
  output coeffs_triosy_lz;
  input [4:0] coeff_addr_rsc_dat;
  input coeff_addr_rsc_vld;
  output coeff_addr_rsc_rdy;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;


  fir dut_inst (
    .clk(clk),
    .rst(rst),
    .input_rsc_dat(input_rsc_dat),
    .input_rsc_vld(input_rsc_vld),
    .input_rsc_rdy(input_rsc_rdy),
    .coeffs_rsc_radr(coeffs_rsc_radr),
    .coeffs_rsc_re(coeffs_rsc_re),
    .coeffs_rsc_q(coeffs_rsc_q),
    .coeffs_triosy_lz(coeffs_triosy_lz),
    .coeff_addr_rsc_dat(coeff_addr_rsc_dat),
    .coeff_addr_rsc_vld(coeff_addr_rsc_vld),
    .coeff_addr_rsc_rdy(coeff_addr_rsc_rdy),
    .output_rsc_dat(output_rsc_dat),
    .output_rsc_vld(output_rsc_vld),
    .output_rsc_rdy(output_rsc_rdy)
  );

endmodule

