void mc_testbench_capture_IN( ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout ) {
  mc_testbench::capture_IN(din, coeffs, dout);
}
void mc_testbench_capture_OUT( ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout ) {
  mc_testbench::capture_OUT(din, coeffs, dout);
}

class ccs_intercept
{
  public:
  void capture_THIS( void* _this ) {
    cur_inst = _this;
    if ( !dut_inst_set() ) dut = mc_testbench_set_dut_inst(cur_inst);
    if ( capture_msg && dut != NULL && dut == cur_inst ) {
      std::cout << "SCVerify intercepting C++ function 'top::run' for RTL block 'top'" << std::endl;
      std::cout << "                      DUT instance '" << dut << "'" << std::endl;
      capture_msg = false;
    }
  }
  void capture_IN( ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_IN(din, coeffs, dout);
  }
  void capture_OUT( ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout ) {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_capture_OUT(din, coeffs, dout);
  }
  void wait_for_idle_sync() {
    if ( dut != NULL && dut == cur_inst )
      mc_testbench_wait_for_idle_sync();
  }
  ccs_intercept(): dut(NULL), cur_inst(NULL), capture_msg(true){}
  ~ccs_intercept() {
    if ( capture_msg )
      std::cout << "Error: The CCS_BLOCK intercept did not occur for DUT instance '" << dut << "'" << std::endl
                << "       Make sure the applied pointer is for class 'top'" << std::endl;
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


void top::run(ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout) {
  static ccs_intercept ccs_intercept_inst;
  ccs_intercept_inst.capture_THIS(this);
  ccs_intercept_inst.wait_for_idle_sync();
  ccs_intercept_inst.capture_IN(din, coeffs, dout);
  ccs_real_run(din, coeffs, dout);
  ccs_intercept_inst.capture_OUT(din, coeffs, dout);
}

