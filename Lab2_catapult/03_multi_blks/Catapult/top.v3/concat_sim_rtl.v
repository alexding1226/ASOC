
//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   r12016@cad40
//  Generated date: Sun Mar 24 17:33:30 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_run_run_fsm (
  clk, rst, run_wen, fsm_output
);
  input clk;
  input rst;
  input run_wen;
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for fir_run_run_fsm_1
  parameter
    run_rlp_C_0 = 1'd0,
    main_C_0 = 1'd1;

  reg  state_var;
  reg  state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_run_run_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 2'b10;
        state_var_NS = main_C_0;
      end
      // run_rlp_C_0
      default : begin
        fsm_output = 2'b01;
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
//  Design Unit:    fir_run_output_rsci_output_wait_dp
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_dp (
  clk, rst, output_rsci_oswt, output_rsci_wen_comp, output_rsci_biwt, output_rsci_bdwt,
      output_rsci_bcwt
);
  input clk;
  input rst;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input output_rsci_biwt;
  input output_rsci_bdwt;
  output output_rsci_bcwt;
  reg output_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_wen_comp = (~ output_rsci_oswt) | output_rsci_biwt | output_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_bcwt <= 1'b0;
    end
    else begin
      output_rsci_bcwt <= ~((~(output_rsci_bcwt | output_rsci_biwt)) | output_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_ctrl
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_ctrl (
  run_wen, output_rsci_oswt, output_rsci_biwt, output_rsci_bdwt, output_rsci_bcwt,
      output_rsci_irdy, output_rsci_ivld_run_sct
);
  input run_wen;
  input output_rsci_oswt;
  output output_rsci_biwt;
  output output_rsci_bdwt;
  input output_rsci_bcwt;
  input output_rsci_irdy;
  output output_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire output_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_bdwt = output_rsci_oswt & run_wen;
  assign output_rsci_biwt = output_rsci_ogwt & output_rsci_irdy;
  assign output_rsci_ogwt = output_rsci_oswt & (~ output_rsci_bcwt);
  assign output_rsci_ivld_run_sct = output_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_dp
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_dp (
  clk, rst, input_rsci_oswt, input_rsci_wen_comp, input_rsci_idat_mxwt, input_rsci_biwt,
      input_rsci_bdwt, input_rsci_bcwt, input_rsci_idat
);
  input clk;
  input rst;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;
  input input_rsci_biwt;
  input input_rsci_bdwt;
  output input_rsci_bcwt;
  reg input_rsci_bcwt;
  input [7:0] input_rsci_idat;


  // Interconnect Declarations
  reg [7:0] input_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_wen_comp = (~ input_rsci_oswt) | input_rsci_biwt | input_rsci_bcwt;
  assign input_rsci_idat_mxwt = MUX_v_8_2_2(input_rsci_idat, input_rsci_idat_bfwt,
      input_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      input_rsci_bcwt <= 1'b0;
    end
    else begin
      input_rsci_bcwt <= ~((~(input_rsci_bcwt | input_rsci_biwt)) | input_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      input_rsci_idat_bfwt <= 8'b00000000;
    end
    else if ( input_rsci_biwt ) begin
      input_rsci_idat_bfwt <= input_rsci_idat;
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_ctrl
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_ctrl (
  run_wen, input_rsci_oswt, input_rsci_biwt, input_rsci_bdwt, input_rsci_bcwt, input_rsci_irdy_run_sct,
      input_rsci_ivld
);
  input run_wen;
  input input_rsci_oswt;
  output input_rsci_biwt;
  output input_rsci_bdwt;
  input input_rsci_bcwt;
  output input_rsci_irdy_run_sct;
  input input_rsci_ivld;


  // Interconnect Declarations
  wire input_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_bdwt = input_rsci_oswt & run_wen;
  assign input_rsci_biwt = input_rsci_ogwt & input_rsci_ivld;
  assign input_rsci_ogwt = input_rsci_oswt & (~ input_rsci_bcwt);
  assign input_rsci_irdy_run_sct = input_rsci_ogwt;
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
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for decimator_run_run_fsm_1
  parameter
    run_rlp_C_0 = 1'd0,
    main_C_0 = 1'd1;

  reg  state_var;
  reg  state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : decimator_run_run_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 2'b10;
        state_var_NS = main_C_0;
      end
      // run_rlp_C_0
      default : begin
        fsm_output = 2'b01;
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
//  Design Unit:    decimator_run_dout_rsci_dout_wait_dp
// ------------------------------------------------------------------


module decimator_run_dout_rsci_dout_wait_dp (
  clk, rst, dout_rsci_oswt, dout_rsci_wen_comp, dout_rsci_biwt, dout_rsci_bdwt, dout_rsci_bcwt
);
  input clk;
  input rst;
  input dout_rsci_oswt;
  output dout_rsci_wen_comp;
  input dout_rsci_biwt;
  input dout_rsci_bdwt;
  output dout_rsci_bcwt;
  reg dout_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dout_rsci_wen_comp = (~ dout_rsci_oswt) | dout_rsci_biwt | dout_rsci_bcwt;
  always @(posedge clk) begin
    if ( rst ) begin
      dout_rsci_bcwt <= 1'b0;
    end
    else begin
      dout_rsci_bcwt <= ~((~(dout_rsci_bcwt | dout_rsci_biwt)) | dout_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_dout_rsci_dout_wait_ctrl
// ------------------------------------------------------------------


module decimator_run_dout_rsci_dout_wait_ctrl (
  run_wen, dout_rsci_oswt, dout_rsci_biwt, dout_rsci_bdwt, dout_rsci_bcwt, dout_rsci_irdy,
      dout_rsci_ivld_run_sct
);
  input run_wen;
  input dout_rsci_oswt;
  output dout_rsci_biwt;
  output dout_rsci_bdwt;
  input dout_rsci_bcwt;
  input dout_rsci_irdy;
  output dout_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dout_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dout_rsci_bdwt = dout_rsci_oswt & run_wen;
  assign dout_rsci_biwt = dout_rsci_ogwt & dout_rsci_irdy;
  assign dout_rsci_ogwt = dout_rsci_oswt & (~ dout_rsci_bcwt);
  assign dout_rsci_ivld_run_sct = dout_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_din_rsci_din_wait_dp
// ------------------------------------------------------------------


module decimator_run_din_rsci_din_wait_dp (
  clk, rst, din_rsci_oswt, din_rsci_wen_comp, din_rsci_idat_mxwt, din_rsci_biwt,
      din_rsci_bdwt, din_rsci_bcwt, din_rsci_idat
);
  input clk;
  input rst;
  input din_rsci_oswt;
  output din_rsci_wen_comp;
  output [7:0] din_rsci_idat_mxwt;
  input din_rsci_biwt;
  input din_rsci_bdwt;
  output din_rsci_bcwt;
  reg din_rsci_bcwt;
  input [7:0] din_rsci_idat;


  // Interconnect Declarations
  reg [7:0] din_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign din_rsci_wen_comp = (~ din_rsci_oswt) | din_rsci_biwt | din_rsci_bcwt;
  assign din_rsci_idat_mxwt = MUX_v_8_2_2(din_rsci_idat, din_rsci_idat_bfwt, din_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      din_rsci_bcwt <= 1'b0;
    end
    else begin
      din_rsci_bcwt <= ~((~(din_rsci_bcwt | din_rsci_biwt)) | din_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      din_rsci_idat_bfwt <= 8'b00000000;
    end
    else if ( din_rsci_biwt ) begin
      din_rsci_idat_bfwt <= din_rsci_idat;
    end
  end

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

endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_din_rsci_din_wait_ctrl
// ------------------------------------------------------------------


module decimator_run_din_rsci_din_wait_ctrl (
  run_wen, din_rsci_oswt, din_rsci_biwt, din_rsci_bdwt, din_rsci_bcwt, din_rsci_irdy_run_sct,
      din_rsci_ivld
);
  input run_wen;
  input din_rsci_oswt;
  output din_rsci_biwt;
  output din_rsci_bdwt;
  input din_rsci_bcwt;
  output din_rsci_irdy_run_sct;
  input din_rsci_ivld;


  // Interconnect Declarations
  wire din_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign din_rsci_bdwt = din_rsci_oswt & run_wen;
  assign din_rsci_biwt = din_rsci_ogwt & din_rsci_ivld;
  assign din_rsci_ogwt = din_rsci_oswt & (~ din_rsci_bcwt);
  assign din_rsci_irdy_run_sct = din_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci
// ------------------------------------------------------------------


module fir_run_output_rsci (
  clk, rst, output_rsc_dat, output_rsc_vld, output_rsc_rdy, run_wen, output_rsci_oswt,
      output_rsci_wen_comp, output_rsci_idat
);
  input clk;
  input rst;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  input run_wen;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input [7:0] output_rsci_idat;


  // Interconnect Declarations
  wire output_rsci_biwt;
  wire output_rsci_bdwt;
  wire output_rsci_bcwt;
  wire output_rsci_irdy;
  wire output_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd3),
  .width(32'sd8)) output_rsci (
      .irdy(output_rsci_irdy),
      .ivld(output_rsci_ivld_run_sct),
      .idat(output_rsci_idat),
      .rdy(output_rsc_rdy),
      .vld(output_rsc_vld),
      .dat(output_rsc_dat)
    );
  fir_run_output_rsci_output_wait_ctrl fir_run_output_rsci_output_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .output_rsci_oswt(output_rsci_oswt),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_bdwt(output_rsci_bdwt),
      .output_rsci_bcwt(output_rsci_bcwt),
      .output_rsci_irdy(output_rsci_irdy),
      .output_rsci_ivld_run_sct(output_rsci_ivld_run_sct)
    );
  fir_run_output_rsci_output_wait_dp fir_run_output_rsci_output_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .output_rsci_oswt(output_rsci_oswt),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_bdwt(output_rsci_bdwt),
      .output_rsci_bcwt(output_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci
// ------------------------------------------------------------------


module fir_run_input_rsci (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, run_wen, input_rsci_oswt,
      input_rsci_wen_comp, input_rsci_idat_mxwt
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input run_wen;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;


  // Interconnect Declarations
  wire input_rsci_biwt;
  wire input_rsci_bdwt;
  wire input_rsci_bcwt;
  wire input_rsci_irdy_run_sct;
  wire input_rsci_ivld;
  wire [7:0] input_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd8)) input_rsci (
      .rdy(input_rsc_rdy),
      .vld(input_rsc_vld),
      .dat(input_rsc_dat),
      .irdy(input_rsci_irdy_run_sct),
      .ivld(input_rsci_ivld),
      .idat(input_rsci_idat)
    );
  fir_run_input_rsci_input_wait_ctrl fir_run_input_rsci_input_wait_ctrl_inst (
      .run_wen(run_wen),
      .input_rsci_oswt(input_rsci_oswt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_bdwt(input_rsci_bdwt),
      .input_rsci_bcwt(input_rsci_bcwt),
      .input_rsci_irdy_run_sct(input_rsci_irdy_run_sct),
      .input_rsci_ivld(input_rsci_ivld)
    );
  fir_run_input_rsci_input_wait_dp fir_run_input_rsci_input_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .input_rsci_oswt(input_rsci_oswt),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_bdwt(input_rsci_bdwt),
      .input_rsci_bcwt(input_rsci_bcwt),
      .input_rsci_idat(input_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_dout_rsci
// ------------------------------------------------------------------


module decimator_run_dout_rsci (
  clk, rst, dout_rsc_dat, dout_rsc_vld, dout_rsc_rdy, run_wen, dout_rsci_oswt, dout_rsci_wen_comp,
      dout_rsci_idat
);
  input clk;
  input rst;
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;
  input run_wen;
  input dout_rsci_oswt;
  output dout_rsci_wen_comp;
  input [7:0] dout_rsci_idat;


  // Interconnect Declarations
  wire dout_rsci_biwt;
  wire dout_rsci_bdwt;
  wire dout_rsci_bcwt;
  wire dout_rsci_irdy;
  wire dout_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd6),
  .width(32'sd8)) dout_rsci (
      .irdy(dout_rsci_irdy),
      .ivld(dout_rsci_ivld_run_sct),
      .idat(dout_rsci_idat),
      .rdy(dout_rsc_rdy),
      .vld(dout_rsc_vld),
      .dat(dout_rsc_dat)
    );
  decimator_run_dout_rsci_dout_wait_ctrl decimator_run_dout_rsci_dout_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dout_rsci_oswt(dout_rsci_oswt),
      .dout_rsci_biwt(dout_rsci_biwt),
      .dout_rsci_bdwt(dout_rsci_bdwt),
      .dout_rsci_bcwt(dout_rsci_bcwt),
      .dout_rsci_irdy(dout_rsci_irdy),
      .dout_rsci_ivld_run_sct(dout_rsci_ivld_run_sct)
    );
  decimator_run_dout_rsci_dout_wait_dp decimator_run_dout_rsci_dout_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .dout_rsci_oswt(dout_rsci_oswt),
      .dout_rsci_wen_comp(dout_rsci_wen_comp),
      .dout_rsci_biwt(dout_rsci_biwt),
      .dout_rsci_bdwt(dout_rsci_bdwt),
      .dout_rsci_bcwt(dout_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    decimator_run_din_rsci
// ------------------------------------------------------------------


module decimator_run_din_rsci (
  clk, rst, din_rsc_dat, din_rsc_vld, din_rsc_rdy, run_wen, din_rsci_oswt, din_rsci_wen_comp,
      din_rsci_idat_mxwt
);
  input clk;
  input rst;
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  input run_wen;
  input din_rsci_oswt;
  output din_rsci_wen_comp;
  output [7:0] din_rsci_idat_mxwt;


  // Interconnect Declarations
  wire din_rsci_biwt;
  wire din_rsci_bdwt;
  wire din_rsci_bcwt;
  wire din_rsci_irdy_run_sct;
  wire din_rsci_ivld;
  wire [7:0] din_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd5),
  .width(32'sd8)) din_rsci (
      .rdy(din_rsc_rdy),
      .vld(din_rsc_vld),
      .dat(din_rsc_dat),
      .irdy(din_rsci_irdy_run_sct),
      .ivld(din_rsci_ivld),
      .idat(din_rsci_idat)
    );
  decimator_run_din_rsci_din_wait_ctrl decimator_run_din_rsci_din_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .din_rsci_oswt(din_rsci_oswt),
      .din_rsci_biwt(din_rsci_biwt),
      .din_rsci_bdwt(din_rsci_bdwt),
      .din_rsci_bcwt(din_rsci_bcwt),
      .din_rsci_irdy_run_sct(din_rsci_irdy_run_sct),
      .din_rsci_ivld(din_rsci_ivld)
    );
  decimator_run_din_rsci_din_wait_dp decimator_run_din_rsci_din_wait_dp_inst (
      .clk(clk),
      .rst(rst),
      .din_rsci_oswt(din_rsci_oswt),
      .din_rsci_wen_comp(din_rsci_wen_comp),
      .din_rsci_idat_mxwt(din_rsci_idat_mxwt),
      .din_rsci_biwt(din_rsci_biwt),
      .din_rsci_bdwt(din_rsci_bdwt),
      .din_rsci_bcwt(din_rsci_bcwt),
      .din_rsci_idat(din_rsci_idat)
    );
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
  wire [1:0] fsm_output;
  reg reg_output_rsci_iswt0_cse;
  reg reg_input_rsci_iswt0_cse;
  wire and_18_cse;
  reg [7:0] regs_1_sva;
  reg [7:0] regs_0_sva;
  reg [7:0] MAC_asn_4_itm;
  reg [7:0] MAC_asn_8_itm;
  reg [7:0] MAC_asn_10_itm;
  reg [7:0] MAC_asn_12_itm;
  reg [7:0] MAC_asn_14_itm;

  wire[18:0] MAC_8_acc_1_nl;
  wire[21:0] nl_MAC_8_acc_1_nl;
  wire[15:0] MAC_3_mul_nl;
  wire signed [15:0] nl_MAC_3_mul_sgnd;
  wire[15:0] MAC_4_mul_nl;
  wire signed [15:0] nl_MAC_4_mul_sgnd;
  wire[15:0] MAC_7_mul_nl;
  wire signed [15:0] nl_MAC_7_mul_sgnd;
  wire[15:0] MAC_8_mul_nl;
  wire signed [15:0] nl_MAC_8_mul_sgnd;
  wire[15:0] MAC_5_mul_nl;
  wire signed [15:0] nl_MAC_5_mul_sgnd;
  wire[15:0] MAC_6_mul_nl;
  wire signed [15:0] nl_MAC_6_mul_sgnd;
  wire[15:0] MAC_1_mul_nl;
  wire signed [15:0] nl_MAC_1_mul_sgnd;
  wire[15:0] MAC_2_mul_nl;
  wire signed [15:0] nl_MAC_2_mul_sgnd;

  // Interconnect Declarations for Component Instantiations 
  fir_run_input_rsci fir_run_input_rsci_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .run_wen(run_wen),
      .input_rsci_oswt(reg_input_rsci_iswt0_cse),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt)
    );
  fir_run_output_rsci fir_run_output_rsci_inst (
      .clk(clk),
      .rst(rst),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .run_wen(run_wen),
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
      .fsm_output(fsm_output)
    );
  assign and_18_cse = run_wen & (~ (fsm_output[0]));
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_idat <= 8'b00000000;
      regs_0_sva <= 8'b00000000;
      MAC_asn_4_itm <= 8'b00000000;
      regs_1_sva <= 8'b00000000;
      MAC_asn_8_itm <= 8'b00000000;
      MAC_asn_10_itm <= 8'b00000000;
      MAC_asn_12_itm <= 8'b00000000;
      MAC_asn_14_itm <= 8'b00000000;
    end
    else if ( and_18_cse ) begin
      output_rsci_idat <= readslicef_19_8_11(MAC_8_acc_1_nl);
      regs_0_sva <= input_rsci_idat_mxwt;
      MAC_asn_4_itm <= regs_1_sva;
      regs_1_sva <= regs_0_sva;
      MAC_asn_8_itm <= MAC_asn_10_itm;
      MAC_asn_10_itm <= MAC_asn_4_itm;
      MAC_asn_12_itm <= MAC_asn_14_itm;
      MAC_asn_14_itm <= MAC_asn_8_itm;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      reg_output_rsci_iswt0_cse <= 1'b0;
      reg_input_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_output_rsci_iswt0_cse <= fsm_output[1];
      reg_input_rsci_iswt0_cse <= 1'b1;
    end
  end
  assign nl_MAC_3_mul_sgnd = $signed((coeffs[47:40])) * $signed(MAC_asn_8_itm);
  assign MAC_3_mul_nl = $unsigned(nl_MAC_3_mul_sgnd);
  assign nl_MAC_4_mul_sgnd = $signed((coeffs[39:32])) * $signed(MAC_asn_10_itm);
  assign MAC_4_mul_nl = $unsigned(nl_MAC_4_mul_sgnd);
  assign nl_MAC_7_mul_sgnd = $signed((coeffs[15:8])) * $signed(regs_0_sva);
  assign MAC_7_mul_nl = $unsigned(nl_MAC_7_mul_sgnd);
  assign nl_MAC_8_mul_sgnd = $signed((coeffs[7:0])) * $signed((input_rsci_idat_mxwt));
  assign MAC_8_mul_nl = $unsigned(nl_MAC_8_mul_sgnd);
  assign nl_MAC_5_mul_sgnd = $signed((coeffs[31:24])) * $signed(MAC_asn_4_itm);
  assign MAC_5_mul_nl = $unsigned(nl_MAC_5_mul_sgnd);
  assign nl_MAC_6_mul_sgnd = $signed((coeffs[23:16])) * $signed(regs_1_sva);
  assign MAC_6_mul_nl = $unsigned(nl_MAC_6_mul_sgnd);
  assign nl_MAC_1_mul_sgnd = $signed((coeffs[63:56])) * $signed(MAC_asn_12_itm);
  assign MAC_1_mul_nl = $unsigned(nl_MAC_1_mul_sgnd);
  assign nl_MAC_2_mul_sgnd = $signed((coeffs[55:48])) * $signed(MAC_asn_14_itm);
  assign MAC_2_mul_nl = $unsigned(nl_MAC_2_mul_sgnd);
  assign nl_MAC_8_acc_1_nl = conv_s2s_16_19(MAC_3_mul_nl) + conv_s2s_16_19(MAC_4_mul_nl)
      + conv_s2s_16_19(MAC_7_mul_nl) + conv_s2s_16_19(MAC_8_mul_nl) + conv_s2s_16_19(MAC_5_mul_nl)
      + conv_s2s_16_19(MAC_6_mul_nl) + conv_s2s_16_19(MAC_1_mul_nl) + conv_s2s_16_19(MAC_2_mul_nl);
  assign MAC_8_acc_1_nl = nl_MAC_8_acc_1_nl[18:0];

  function automatic [7:0] readslicef_19_8_11;
    input [18:0] vector;
    reg [18:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_19_8_11 = tmp[7:0];
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
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
  wire [1:0] fsm_output;
  wire equal_tmp;
  reg reg_dout_rsci_iswt0_cse;
  reg reg_din_rsci_iswt0_cse;
  reg [1:0] count_2_0_sva_1_0;
  wire [2:0] nl_count_2_0_sva_1_0;


  // Interconnect Declarations for Component Instantiations 
  decimator_run_din_rsci decimator_run_din_rsci_inst (
      .clk(clk),
      .rst(rst),
      .din_rsc_dat(din_rsc_dat),
      .din_rsc_vld(din_rsc_vld),
      .din_rsc_rdy(din_rsc_rdy),
      .run_wen(run_wen),
      .din_rsci_oswt(reg_din_rsci_iswt0_cse),
      .din_rsci_wen_comp(din_rsci_wen_comp),
      .din_rsci_idat_mxwt(din_rsci_idat_mxwt)
    );
  decimator_run_dout_rsci decimator_run_dout_rsci_inst (
      .clk(clk),
      .rst(rst),
      .dout_rsc_dat(dout_rsc_dat),
      .dout_rsc_vld(dout_rsc_vld),
      .dout_rsc_rdy(dout_rsc_rdy),
      .run_wen(run_wen),
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
    else if ( run_wen & (~((~ equal_tmp) | (fsm_output[0]))) ) begin
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
      reg_din_rsci_iswt0_cse <= 1'b1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      count_2_0_sva_1_0 <= 2'b00;
    end
    else if ( run_wen & (~ (fsm_output[0])) ) begin
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



