void mc_testbench_capture_IN( ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output ) {
  mc_testbench::capture_IN(input, coeffs, output);
}
void mc_testbench_capture_OUT( ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output ) {
  mc_testbench::capture_OUT(input, coeffs, output);
}

class ccs_intercept
{
  public:
  void capture_THIS( void* _this ) {
    cur_inst = _this;
    if ( !dut_inst_set() ) dut = mc_testbench_set_dut_inst(cur_inst);
    if ( capture_msg && dut != NULL && dut == cur_inst ) {
      std::cout << "SCVerify intercepting C++ function 'fir::run' for RTL block 'fir'" << std::endl;
      std::cout << "                      DUT instance '" << dut << "'" << std::endl;
      capture_msg = false;
    }
  }
  void capture_IN( ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_IN(input, coeffs, output);
  }
  void capture_OUT( ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_OUT(input, coeffs, output);
  }
  void wait_for_idle_sync() {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_wait_for_idle_sync();
  }
  ccs_intercept(): dut(NULL), cur_inst(NULL), capture_msg(true){}
  ~ccs_intercept() {
    if ( capture_msg )
      std::cout << "Error: The CCS_BLOCK intercept did not occur for DUT instance '" << dut << "'" << std::endl
                << "       Make sure the applied pointer is for class 'fir'" << std::endl;
  }
  private:
  bool dut_inst_set() {
    if ( dut == NULL && !!mc_testbench_dut_inst() )
      dut = mc_testbench_dut_inst();
    return dut != NULL;
  }
  void *dut, *cur_inst;
  bool capture_msg;
};


void fir::run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output) {
  static ccs_intercept ccs_intercept_inst;
  ccs_intercept_inst.capture_THIS(this);
  ccs_intercept_inst.wait_for_idle_sync();
  ccs_intercept_inst.capture_IN(input, coeffs, output);
  ccs_real_run(input, coeffs, output);
  ccs_intercept_inst.capture_OUT(input, coeffs, output);
}
