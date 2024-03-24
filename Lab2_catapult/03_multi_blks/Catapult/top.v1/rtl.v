// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   r12016@cad40
//  Generated date: Sun Mar 24 17:24:51 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_run_run_fsm (
  clk, rst, run_wen, fsm_output, SHIFT_C_0_tr0
);
  input clk;
  input rst;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input SHIFT_C_0_tr0;


  // FSM State Type Declaration for fir_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    SHIFT_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_run_run_fsm_1
    case (state_var)
      SHIFT_C_0 : begin
        fsm_output = 3'b010;
        if ( SHIFT_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = SHIFT_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = SHIFT_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_staller
// ------------------------------------------------------------------


module fir_run_staller (
  run_wen, input_rsci_wen_comp, output_rsci_wen_comp
);
  output run_wen;
  input input_rsci_wen_comp;
  input output_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = input_rsci_wen_comp & output_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_ctrl
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_ctrl (
  output_rsci_iswt0, output_rsci_biwt, output_rsci_irdy
);
  input output_rsci_iswt0;
  output output_rsci_biwt;
  input output_rsci_irdy;



  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_biwt = output_rsci_iswt0 & output_rsci_irdy;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_ctrl
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_ctrl (
  input_rsci_iswt0, input_rsci_biwt, input_rsci_ivld
);
  input input_rsci_iswt0;
  output input_rsci_biwt;
  input input_rsci_ivld;



  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_biwt = input_rsci_iswt0 & input_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module decimator_run_run_fsm (
  clk, rst, run_wen, fsm_output
);
  input clk;
  input rst;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;


  // FSM State Type Declaration for decimator_run_run_fsm_1
  parameter
    run_rlp_C_0 = 2'd0,
    main_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : decimator_run_run_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 3'b010;
        state_var_NS = main_C_1;
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // run_rlp_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= run_rlp_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_staller
// ------------------------------------------------------------------


module decimator_run_staller (
  run_wen, din_rsci_wen_comp, dout_rsci_wen_comp
);
  output run_wen;
  input din_rsci_wen_comp;
  input dout_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = din_rsci_wen_comp & dout_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_dout_rsci_dout_wait_ctrl
// ------------------------------------------------------------------


module decimator_run_dout_rsci_dout_wait_ctrl (
  dout_rsci_iswt0, dout_rsci_biwt, dout_rsci_irdy
);
  input dout_rsci_iswt0;
  output dout_rsci_biwt;
  input dout_rsci_irdy;



  // Interconnect Declarations for Component Instantiations 
  assign dout_rsci_biwt = dout_rsci_iswt0 & dout_rsci_irdy;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_din_rsci_din_wait_ctrl
// ------------------------------------------------------------------


module decimator_run_din_rsci_din_wait_ctrl (
  din_rsci_iswt0, din_rsci_biwt, din_rsci_ivld
);
  input din_rsci_iswt0;
  output din_rsci_biwt;
  input din_rsci_ivld;



  // Interconnect Declarations for Component Instantiations 
  assign din_rsci_biwt = din_rsci_iswt0 & din_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci
// ------------------------------------------------------------------


module fir_run_output_rsci (
  output_rsc_dat, output_rsc_vld, output_rsc_rdy, output_rsci_oswt, output_rsci_wen_comp,
      output_rsci_idat
);
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input [7:0] output_rsci_idat;


  // Interconnect Declarations
  wire output_rsci_biwt;
  wire output_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd3),
  .width(32'sd8)) output_rsci (
      .irdy(output_rsci_irdy),
      .ivld(output_rsci_oswt),
      .idat(output_rsci_idat),
      .rdy(output_rsc_rdy),
      .vld(output_rsc_vld),
      .dat(output_rsc_dat)
    );
  fir_run_output_rsci_output_wait_ctrl fir_run_output_rsci_output_wait_ctrl_inst
      (
      .output_rsci_iswt0(output_rsci_oswt),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_irdy(output_rsci_irdy)
    );
  assign output_rsci_wen_comp = (~ output_rsci_oswt) | output_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci
// ------------------------------------------------------------------


module fir_run_input_rsci (
  input_rsc_dat, input_rsc_vld, input_rsc_rdy, input_rsci_oswt, input_rsci_wen_comp,
      input_rsci_idat_mxwt
);
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;


  // Interconnect Declarations
  wire input_rsci_biwt;
  wire input_rsci_ivld;
  wire [7:0] input_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd8)) input_rsci (
      .rdy(input_rsc_rdy),
      .vld(input_rsc_vld),
      .dat(input_rsc_dat),
      .irdy(input_rsci_oswt),
      .ivld(input_rsci_ivld),
      .idat(input_rsci_idat)
    );
  fir_run_input_rsci_input_wait_ctrl fir_run_input_rsci_input_wait_ctrl_inst (
      .input_rsci_iswt0(input_rsci_oswt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_ivld(input_rsci_ivld)
    );
  assign input_rsci_idat_mxwt = input_rsci_idat;
  assign input_rsci_wen_comp = (~ input_rsci_oswt) | input_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_dout_rsci
// ------------------------------------------------------------------


module decimator_run_dout_rsci (
  dout_rsc_dat, dout_rsc_vld, dout_rsc_rdy, dout_rsci_oswt, dout_rsci_wen_comp, dout_rsci_idat
);
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;
  input dout_rsci_oswt;
  output dout_rsci_wen_comp;
  input [7:0] dout_rsci_idat;


  // Interconnect Declarations
  wire dout_rsci_biwt;
  wire dout_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd6),
  .width(32'sd8)) dout_rsci (
      .irdy(dout_rsci_irdy),
      .ivld(dout_rsci_oswt),
      .idat(dout_rsci_idat),
      .rdy(dout_rsc_rdy),
      .vld(dout_rsc_vld),
      .dat(dout_rsc_dat)
    );
  decimator_run_dout_rsci_dout_wait_ctrl decimator_run_dout_rsci_dout_wait_ctrl_inst
      (
      .dout_rsci_iswt0(dout_rsci_oswt),
      .dout_rsci_biwt(dout_rsci_biwt),
      .dout_rsci_irdy(dout_rsci_irdy)
    );
  assign dout_rsci_wen_comp = (~ dout_rsci_oswt) | dout_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_din_rsci
// ------------------------------------------------------------------


module decimator_run_din_rsci (
  din_rsc_dat, din_rsc_vld, din_rsc_rdy, din_rsci_oswt, din_rsci_wen_comp, din_rsci_idat_mxwt
);
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  input din_rsci_oswt;
  output din_rsci_wen_comp;
  output [7:0] din_rsci_idat_mxwt;


  // Interconnect Declarations
  wire din_rsci_biwt;
  wire din_rsci_ivld;
  wire [7:0] din_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd5),
  .width(32'sd8)) din_rsci (
      .rdy(din_rsc_rdy),
      .vld(din_rsc_vld),
      .dat(din_rsc_dat),
      .irdy(din_rsci_oswt),
      .ivld(din_rsci_ivld),
      .idat(din_rsci_idat)
    );
  decimator_run_din_rsci_din_wait_ctrl decimator_run_din_rsci_din_wait_ctrl_inst
      (
      .din_rsci_iswt0(din_rsci_oswt),
      .din_rsci_biwt(din_rsci_biwt),
      .din_rsci_ivld(din_rsci_ivld)
    );
  assign din_rsci_idat_mxwt = din_rsci_idat;
  assign din_rsci_wen_comp = (~ din_rsci_oswt) | din_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run
// ------------------------------------------------------------------


module fir_run (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs, output_rsc_dat,
      output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire input_rsci_wen_comp;
  wire [7:0] input_rsci_idat_mxwt;
  wire output_rsci_wen_comp;
  reg [7:0] output_rsci_idat;
  wire [2:0] fsm_output;
  wire [3:0] SHIFT_acc_1_tmp;
  wire [4:0] nl_SHIFT_acc_1_tmp;
  wire or_dcpl_5;
  wire or_dcpl_6;
  wire or_dcpl_7;
  wire or_dcpl_8;
  wire or_dcpl_9;
  wire or_dcpl_10;
  wire or_dcpl_11;
  wire or_dcpl_12;
  wire or_dcpl_14;
  wire or_dcpl_16;
  reg [2:0] SHIFT_i_3_0_sva_2_0;
  reg reg_input_rsci_oswt_cse;
  reg reg_output_rsci_iswt0_cse;
  wire MAC_and_m1c;
  wire MAC_and_m1c_1;
  wire MAC_and_m1c_2;
  wire MAC_and_m1c_3;
  wire MAC_and_m1c_4;
  wire MAC_and_m1c_5;
  wire or_13_cse;
  reg [2:0] MAC_i_3_0_sva_2_0;
  wire MAC_and_12_m1c;
  reg [7:0] regs_0_lpi_2;
  reg [7:0] regs_3_lpi_2;
  reg [7:0] regs_4_lpi_2;
  reg [7:0] regs_2_lpi_2;
  reg [7:0] regs_5_lpi_2;
  reg [7:0] regs_1_lpi_2;
  reg [7:0] regs_6_lpi_2;
  reg [7:0] regs_7_lpi_2;
  reg [18:0] temp_sva;
  wire [7:0] regs_0_lpi_2_mx1;
  wire [18:0] temp_sva_2;
  wire [19:0] nl_temp_sva_2;
  wire [7:0] SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
  wire [3:0] MAC_i_3_0_sva_2;
  wire [4:0] nl_MAC_i_3_0_sva_2;
  wire and_35_cse;

  wire not_22_nl;
  wire not_31_nl;
  wire or_15_nl;
  wire[15:0] MAC_mul_nl;
  wire[7:0] MAC_mux_nl;
  wire[7:0] MAC_MAC_mux1h_nl;
  wire MAC_nor_nl;
  wire MAC_or_nl;
  wire MAC_and_6_nl;
  wire MAC_and_7_nl;
  wire MAC_and_8_nl;
  wire MAC_and_9_nl;
  wire MAC_and_10_nl;
  wire MAC_and_11_nl;
  wire MAC_and_20_nl;
  wire signed [15:0] nl_MAC_mul_sgnd;

  // Interconnect Declarations for Component Instantiations 
  fir_run_input_rsci fir_run_input_rsci_inst (
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .input_rsci_oswt(reg_input_rsci_oswt_cse),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt)
    );
  fir_run_output_rsci fir_run_output_rsci_inst (
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .output_rsci_oswt(reg_output_rsci_iswt0_cse),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_idat(output_rsci_idat)
    );
  fir_run_staller fir_run_staller_inst (
      .run_wen(run_wen),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .output_rsci_wen_comp(output_rsci_wen_comp)
    );
  fir_run_run_fsm fir_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .SHIFT_C_0_tr0(and_35_cse)
    );
  assign or_13_cse = or_dcpl_5 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign and_35_cse = (MAC_i_3_0_sva_2[3]) & (SHIFT_acc_1_tmp[3]);
  assign or_15_nl = or_dcpl_11 | (SHIFT_i_3_0_sva_2_0[1]);
  assign regs_0_lpi_2_mx1 = MUX_v_8_2_2(input_rsci_idat_mxwt, regs_0_lpi_2, or_15_nl);
  assign MAC_and_m1c = (MAC_i_3_0_sva_2_0==3'b001);
  assign MAC_and_m1c_1 = (MAC_i_3_0_sva_2_0==3'b010);
  assign MAC_and_m1c_2 = (MAC_i_3_0_sva_2_0==3'b011);
  assign MAC_and_m1c_3 = (MAC_i_3_0_sva_2_0==3'b100);
  assign MAC_and_m1c_4 = (MAC_i_3_0_sva_2_0==3'b101);
  assign MAC_and_m1c_5 = (MAC_i_3_0_sva_2_0==3'b110);
  assign MAC_and_12_m1c = (MAC_i_3_0_sva_2_0==3'b111);
  assign MAC_mux_nl = MUX_v_8_8_2((coeffs[7:0]), (coeffs[15:8]), (coeffs[23:16]),
      (coeffs[31:24]), (coeffs[39:32]), (coeffs[47:40]), (coeffs[55:48]), (coeffs[63:56]),
      MAC_i_3_0_sva_2_0);
  assign MAC_nor_nl = ~((MAC_i_3_0_sva_2_0!=3'b000));
  assign MAC_or_nl = ((~ or_dcpl_8) & MAC_and_m1c) | ((~ or_dcpl_12) & MAC_and_m1c_1)
      | ((~ or_dcpl_14) & MAC_and_m1c_2) | ((~ or_dcpl_16) & MAC_and_m1c_3) | ((~
      or_dcpl_6) & MAC_and_m1c_4) | ((~ or_dcpl_10) & MAC_and_m1c_5) | ((~ or_13_cse)
      & MAC_and_12_m1c);
  assign MAC_and_6_nl = or_dcpl_8 & MAC_and_m1c;
  assign MAC_and_7_nl = or_dcpl_12 & MAC_and_m1c_1;
  assign MAC_and_8_nl = or_dcpl_14 & MAC_and_m1c_2;
  assign MAC_and_9_nl = or_dcpl_16 & MAC_and_m1c_3;
  assign MAC_and_10_nl = or_dcpl_6 & MAC_and_m1c_4;
  assign MAC_and_11_nl = or_dcpl_10 & MAC_and_m1c_5;
  assign MAC_and_20_nl = or_13_cse & MAC_and_12_m1c;
  assign MAC_MAC_mux1h_nl = MUX1HOT_v_8_9_2(regs_0_lpi_2_mx1, SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      regs_7_lpi_2, {MAC_nor_nl , MAC_or_nl , MAC_and_6_nl , MAC_and_7_nl , MAC_and_8_nl
      , MAC_and_9_nl , MAC_and_10_nl , MAC_and_11_nl , MAC_and_20_nl});
  assign nl_MAC_mul_sgnd = $signed(MAC_mux_nl) * $signed(MAC_MAC_mux1h_nl);
  assign MAC_mul_nl = $unsigned(nl_MAC_mul_sgnd);
  assign nl_temp_sva_2 = temp_sva + conv_s2s_16_19(MAC_mul_nl);
  assign temp_sva_2 = nl_temp_sva_2[18:0];
  assign SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 = MUX_v_8_8_2x0(regs_0_lpi_2,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      SHIFT_i_3_0_sva_2_0);
  assign nl_SHIFT_acc_1_tmp = conv_u2s_3_4(SHIFT_i_3_0_sva_2_0) + 4'b1111;
  assign SHIFT_acc_1_tmp = nl_SHIFT_acc_1_tmp[3:0];
  assign nl_MAC_i_3_0_sva_2 = conv_u2s_3_4(MAC_i_3_0_sva_2_0) + 4'b1111;
  assign MAC_i_3_0_sva_2 = nl_MAC_i_3_0_sva_2[3:0];
  assign or_dcpl_5 = ~((SHIFT_i_3_0_sva_2_0[2]) & (SHIFT_i_3_0_sva_2_0[0]));
  assign or_dcpl_6 = or_dcpl_5 | (SHIFT_i_3_0_sva_2_0[1]);
  assign or_dcpl_7 = (SHIFT_i_3_0_sva_2_0[2]) | (~ (SHIFT_i_3_0_sva_2_0[0]));
  assign or_dcpl_8 = or_dcpl_7 | (SHIFT_i_3_0_sva_2_0[1]);
  assign or_dcpl_9 = (~ (SHIFT_i_3_0_sva_2_0[2])) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_10 = or_dcpl_9 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_11 = (SHIFT_i_3_0_sva_2_0[2]) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_12 = or_dcpl_11 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_14 = or_dcpl_7 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_16 = or_dcpl_9 | (SHIFT_i_3_0_sva_2_0[1]);
  always @(posedge clk) begin
    if ( rst ) begin
      reg_input_rsci_oswt_cse <= 1'b0;
      SHIFT_i_3_0_sva_2_0 <= 3'b000;
      MAC_i_3_0_sva_2_0 <= 3'b000;
      temp_sva <= 19'b0000000000000000000;
      reg_output_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_input_rsci_oswt_cse <= (~((SHIFT_acc_1_tmp[0]) | and_35_cse)) & (SHIFT_acc_1_tmp[2:1]==2'b00)
          & (fsm_output[1]);
      SHIFT_i_3_0_sva_2_0 <= MUX_v_3_2_2((SHIFT_acc_1_tmp[2:0]), 3'b111, not_22_nl);
      MAC_i_3_0_sva_2_0 <= MUX_v_3_2_2((MAC_i_3_0_sva_2[2:0]), 3'b111, not_31_nl);
      temp_sva <= MUX_v_19_2_2(19'b0000000000000000000, temp_sva_2, (fsm_output[1]));
      reg_output_rsci_iswt0_cse <= and_35_cse & (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_5_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_6 | (~ (fsm_output[1])))) ) begin
      regs_5_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_1_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_8 | (~ (fsm_output[1])))) ) begin
      regs_1_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_6_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_10 | (~ (fsm_output[1])))) ) begin
      regs_6_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_2_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_12 | (~ (fsm_output[1])))) ) begin
      regs_2_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_7_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(((SHIFT_acc_1_tmp[2:0]==3'b111)) | and_35_cse)) & (~ or_13_cse)
        ) begin
      regs_7_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_3_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_14 | (~ (fsm_output[1])))) ) begin
      regs_3_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_0_lpi_2 <= 8'b00000000;
    end
    else if ( ((SHIFT_acc_1_tmp[2:0]!=3'b000) | and_35_cse) & (fsm_output[1]) & run_wen
        & (SHIFT_i_3_0_sva_2_0==3'b000) ) begin
      regs_0_lpi_2 <= regs_0_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_4_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(or_dcpl_16 | (~ (fsm_output[1])))) ) begin
      regs_4_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_idat <= 8'b00000000;
    end
    else if ( run_wen & and_35_cse & (fsm_output[1]) ) begin
      output_rsci_idat <= temp_sva_2[18:11];
    end
  end
  assign not_22_nl = ~ (fsm_output[1]);
  assign not_31_nl = ~ (fsm_output[1]);

  function automatic [7:0] MUX1HOT_v_8_9_2;
    input [7:0] input_8;
    input [7:0] input_7;
    input [7:0] input_6;
    input [7:0] input_5;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [8:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    result = result | (input_3 & {8{sel[3]}});
    result = result | (input_4 & {8{sel[4]}});
    result = result | (input_5 & {8{sel[5]}});
    result = result | (input_6 & {8{sel[6]}});
    result = result | (input_7 & {8{sel[7]}});
    result = result | (input_8 & {8{sel[8]}});
    MUX1HOT_v_8_9_2 = result;
  end
  endfunction


  function automatic [18:0] MUX_v_19_2_2;
    input [18:0] input_0;
    input [18:0] input_1;
    input  sel;
    reg [18:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_19_2_2 = result;
  end
  endfunction


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input  sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_8_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = input_0;
      end
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      3'b110 : begin
        result = input_6;
      end
      default : begin
        result = input_7;
      end
    endcase
    MUX_v_8_8_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_8_2x0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      3'b110 : begin
        result = input_6;
      end
      default : begin
        result = input_7;
      end
    endcase
    MUX_v_8_8_2x0 = result;
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction


  function automatic [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run
// ------------------------------------------------------------------


module decimator_run (
  clk, rst, din_rsc_dat, din_rsc_vld, din_rsc_rdy, dout_rsc_dat, dout_rsc_vld, dout_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire din_rsci_wen_comp;
  wire [7:0] din_rsci_idat_mxwt;
  wire dout_rsci_wen_comp;
  reg [7:0] dout_rsci_idat;
  wire [2:0] fsm_output;
  wire equal_tmp;
  reg reg_dout_rsci_iswt0_cse;
  reg reg_din_rsci_iswt0_cse;
  reg [1:0] count_2_0_sva_1_0;
  wire [2:0] nl_count_2_0_sva_1_0;


  // Interconnect Declarations for Component Instantiations 
  decimator_run_din_rsci decimator_run_din_rsci_inst (
      .din_rsc_dat(din_rsc_dat),
      .din_rsc_vld(din_rsc_vld),
      .din_rsc_rdy(din_rsc_rdy),
      .din_rsci_oswt(reg_din_rsci_iswt0_cse),
      .din_rsci_wen_comp(din_rsci_wen_comp),
      .din_rsci_idat_mxwt(din_rsci_idat_mxwt)
    );
  decimator_run_dout_rsci decimator_run_dout_rsci_inst (
      .dout_rsc_dat(dout_rsc_dat),
      .dout_rsc_vld(dout_rsc_vld),
      .dout_rsc_rdy(dout_rsc_rdy),
      .dout_rsci_oswt(reg_dout_rsci_iswt0_cse),
      .dout_rsci_wen_comp(dout_rsci_wen_comp),
      .dout_rsci_idat(dout_rsci_idat)
    );
  decimator_run_staller decimator_run_staller_inst (
      .run_wen(run_wen),
      .din_rsci_wen_comp(din_rsci_wen_comp),
      .dout_rsci_wen_comp(dout_rsci_wen_comp)
    );
  decimator_run_run_fsm decimator_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .fsm_output(fsm_output)
    );
  assign equal_tmp = ~((count_2_0_sva_1_0!=2'b00));
  always @(posedge clk) begin
    if ( rst ) begin
      dout_rsci_idat <= 8'b00000000;
    end
    else if ( run_wen & equal_tmp & (fsm_output[1]) ) begin
      dout_rsci_idat <= din_rsci_idat_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_dout_rsci_iswt0_cse <= 1'b0;
      reg_din_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_dout_rsci_iswt0_cse <= equal_tmp & (fsm_output[1]);
      reg_din_rsci_iswt0_cse <= ~ (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      count_2_0_sva_1_0 <= 2'b00;
    end
    else if ( run_wen & (fsm_output[1]) ) begin
      count_2_0_sva_1_0 <= nl_count_2_0_sva_1_0[1:0];
    end
  end
  assign nl_count_2_0_sva_1_0  = count_2_0_sva_1_0 + 2'b01;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir
// ------------------------------------------------------------------


module fir (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs, output_rsc_dat,
      output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  fir_run fir_run_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .coeffs(coeffs),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator
// ------------------------------------------------------------------


module decimator (
  clk, rst, din_rsc_dat, din_rsc_vld, din_rsc_rdy, dout_rsc_dat, dout_rsc_vld, dout_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  decimator_run decimator_run_inst (
      .clk(clk),
      .rst(rst),
      .din_rsc_dat(din_rsc_dat),
      .din_rsc_vld(din_rsc_vld),
      .din_rsc_rdy(din_rsc_rdy),
      .dout_rsc_dat(dout_rsc_dat),
      .dout_rsc_vld(dout_rsc_vld),
      .dout_rsc_rdy(dout_rsc_rdy)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    top
// ------------------------------------------------------------------


module top (
  clk, rst, din_rsc_dat, din_rsc_vld, din_rsc_rdy, coeffs, dout_rsc_dat, dout_rsc_vld,
      dout_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  input [63:0] coeffs;
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;


  // Interconnect Declarations
  wire [7:0] output_rsc_dat_n_block0;
  wire [7:0] output_rsc_dat_n_block1;
  wire [7:0] dout_rsc_dat_n_block2;
  wire input_rsc_rdy_n_block0_bud;
  wire output_rsc_vld_n_block0_bud;
  wire input_rsc_rdy_n_block1_bud;
  wire output_rsc_vld_n_block1_bud;
  wire din_rsc_rdy_n_block2_bud;
  wire dout_rsc_vld_n_block2_bud;


  // Interconnect Declarations for Component Instantiations 
  fir block0 (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(din_rsc_dat),
      .input_rsc_vld(din_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy_n_block0_bud),
      .coeffs(coeffs),
      .output_rsc_dat(output_rsc_dat_n_block0),
      .output_rsc_vld(output_rsc_vld_n_block0_bud),
      .output_rsc_rdy(input_rsc_rdy_n_block1_bud)
    );
  fir block1 (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(output_rsc_dat_n_block0),
      .input_rsc_vld(output_rsc_vld_n_block0_bud),
      .input_rsc_rdy(input_rsc_rdy_n_block1_bud),
      .coeffs(coeffs),
      .output_rsc_dat(output_rsc_dat_n_block1),
      .output_rsc_vld(output_rsc_vld_n_block1_bud),
      .output_rsc_rdy(din_rsc_rdy_n_block2_bud)
    );
  decimator block2 (
      .clk(clk),
      .rst(rst),
      .din_rsc_dat(output_rsc_dat_n_block1),
      .din_rsc_vld(output_rsc_vld_n_block1_bud),
      .din_rsc_rdy(din_rsc_rdy_n_block2_bud),
      .dout_rsc_dat(dout_rsc_dat_n_block2),
      .dout_rsc_vld(dout_rsc_vld_n_block2_bud),
      .dout_rsc_rdy(dout_rsc_rdy)
    );
  assign din_rsc_rdy = input_rsc_rdy_n_block0_bud;
  assign dout_rsc_vld = dout_rsc_vld_n_block2_bud;
  assign dout_rsc_dat = dout_rsc_dat_n_block2;
endmodule



