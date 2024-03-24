// ----------------------------------------------------------------------------
// SystemC Testbench Body
//
//    HLS version: 2023.2/1059873 Production Release
//       HLS date: Mon Aug  7 10:54:31 PDT 2023
//  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
//
//   Generated by: r12016@cad40
// Generated date: Sun Mar 24 15:43:05 CST 2024
//
// ----------------------------------------------------------------------------
// 
// -------------------------------------
// mc_testbench
// SCVerify mc_testbench SC_MODULE
// -------------------------------------
// 
#include "mc_testbench.h"
#include <mc_testbench_util.h>
#include <mc_simulator_extensions.h>

mc_testbench* mc_testbench::that;
bool testbench::enable_idle_sync_mode;
unsigned short testbench::idle_sync_stable_cycles;
void testbench::set_enable_stalls(bool flag) { mc_testbench::set_enable_stalls(flag); }
void testbench::reset_request() { mc_testbench::that->reset_request(); }
void mc_testbench_reset_request() { mc_testbench::that->reset_request(); }
void* testbench::_dut_inst = NULL;
void* testbench::dut_inst() { return _dut_inst; }
void* mc_testbench_dut_inst() { return testbench::dut_inst(); }
void* testbench::set_dut_inst( void* _inst ) { if(_dut_inst==NULL) _dut_inst=_inst; return _dut_inst; }
void* mc_testbench_set_dut_inst( void* _inst ) { return testbench::set_dut_inst(_inst); }
void mc_testbench_wait_for_idle_sync() { mc_testbench::wait_for_idle_sync(); }
bool testbench::input_ignore;
void mc_testbench_input_skip(bool v) { testbench::input_skip = v; }
bool testbench::input_skip;
bool testbench::input_skip_quiet;
bool testbench::input_skip_once;
bool testbench::input_skip_noerr;
int  testbench::input_array_comp_first;
int  testbench::input_array_comp_last;
mc_wait_ctrl testbench::input_wait_ctrl;
bool testbench::coeffs_ignore;
void mc_testbench_coeffs_skip(bool v) { testbench::coeffs_skip = v; }
bool testbench::coeffs_skip;
bool testbench::coeffs_skip_quiet;
bool testbench::coeffs_skip_once;
bool testbench::coeffs_skip_noerr;
int  testbench::coeffs_array_comp_first;
int  testbench::coeffs_array_comp_last;
mc_wait_ctrl testbench::coeffs_wait_ctrl;
bool testbench::output_ignore;
void mc_testbench_output_skip(bool v) { testbench::output_skip = v; }
bool testbench::output_skip;
bool testbench::output_skip_quiet;
bool testbench::output_skip_once;
bool testbench::output_skip_noerr;
int  testbench::output_array_comp_first;
int  testbench::output_array_comp_last;
bool testbench::output_use_mask;
ac_int<8, true > testbench::output_output_mask;
mc_wait_ctrl testbench::output_wait_ctrl;
#ifndef CCS_SCVERIFY_USE_CCS_BLOCK
void testbench::exec_run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output) {
   return mc_testbench::exec_run(input, coeffs, output);
}
#endif

// ============================================
// Function: wait_for_idle_sync
// --------------------------------------------

void mc_testbench::wait_for_idle_sync()
{
   if (testbench::enable_idle_sync_mode) {
      std::cout << "mc_testbench STOPPING   @ " << sc_time_stamp() << std::endl;
      that->cpp_testbench_active.write(false);
      while (that->design_is_idle.read())  that->wait(that->design_is_idle.value_changed_event());
      while (!that->design_is_idle.read()) that->wait(that->design_is_idle.value_changed_event());
      that->cpp_testbench_active.write(true);
      std::cout << "mc_testbench CONTINUING @ " << sc_time_stamp() << std::endl;
   } else {
      that->cpp_testbench_active.write(true);
   }
}
// ============================================
// Function: set_enable_stalls
// --------------------------------------------

void mc_testbench::set_enable_stalls(bool flag)
{
   if (flag) {
     std::cout << "Enabling STALL_FLAG toggling" << std::endl;
     that->enable_stalls.write(sc_dt::Log_1);
   } else {
     std::cout << "Disabling STALL_FLAG toggling" << std::endl;
     that->enable_stalls.write(sc_dt::Log_0);
   }
}
// ============================================
// Function: reset_request
// --------------------------------------------

void mc_testbench::reset_request()
{
   reset_request_event.notify(0,SC_NS);
}
// ============================================
// Function: capture_input
// --------------------------------------------

void mc_testbench::capture_input( ac_channel<ac_int<8, true > > &input)
{
   static ac_int<8, true > input_tmp;
   static int last_j_input_in = 0;
   if (input_iteration_count == wait_cnt)
      wait_on_input_required();
   if (_capture_input && !testbench::input_ignore)
   {
      if (!input_pointer_set) {
         input_pointer = &(input);
         input_pointer_set = true;
      } else if (input_pointer != &(input) && remaining_ccs_input == 0) {
         std::ostringstream msg; msg.str("");
         msg << "Interface input source switched to a different object in testbench with "
             << remaining_ccs_input << " values remaining in input fifo. No data mismatch detected." <<" @ " << sc_time_stamp();
         SC_REPORT_INFO("User testbench", msg.str().c_str());
         input_pointer = &(input);
      } else if (input_pointer != &(input) && remaining_ccs_input > 0 && remaining_ccs_input != input.ac_channel<ac_int<8, true > >::debug_size()) {
         std::ostringstream msg; msg.str("");
         msg << "Interface input source switched to a different object in testbench with "
             << remaining_ccs_input << " values remaining in input fifo. Simulation mismatch likely. Check golden vs DUT comparison values for errors." <<" @ " << sc_time_stamp();
         SC_REPORT_WARNING("User testbench", msg.str().c_str());
         _channel_mismatch = true;
      }
      int cur_iter = input_capture_count;
      ++input_iteration_count;
      unsigned int chan_factor = 1;
      unsigned int ccs_scv_i,ccs_scv_j;
      ccs_scv_i = remaining_ccs_input;
      while (ccs_scv_i < input.ac_channel<ac_int<8, true > >::debug_size()) {
         for (ccs_scv_j = last_j_input_in; ccs_scv_j < chan_factor; ccs_scv_j++,ccs_scv_i++) {
            if (ccs_scv_i < input.ac_channel<ac_int<8, true > >::debug_size()) {
               input_tmp = input.ac_channel<ac_int<8, true > >::chan[ccs_scv_i];
            } else {
               break;
            }
         }
         if (ccs_scv_j == chan_factor) {
            ccs_input->put(input_tmp);
            last_j_input_in = 0;
            input_capture_count += chan_factor;
         } else {
            last_j_input_in = ccs_scv_j;
         }
      }
      mc_testbench_util::process_wait_ctrl("input",testbench::input_wait_ctrl,ccs_wait_ctrl_input.operator->(),cur_iter,input_capture_count,1);
   }
   testbench::input_ignore = false;
}
// ============================================
// Function: capture_coeffs
// --------------------------------------------

void mc_testbench::capture_coeffs( ac_int<8, true > coeffs[8])
{
   if (coeffs_capture_count == wait_cnt)
      wait_on_input_required();
   if (_capture_coeffs && !testbench::coeffs_ignore)
   {
      int cur_iter = coeffs_iteration_count;
      ++coeffs_iteration_count;
      mgc_sysc_ver_array1D<ac_int<8, true >,8> coeffs_tmp;
      int coeffs_linear_idx = 0;
      for (int coeffs_idx_0 = 0; coeffs_idx_0 < 8; ++coeffs_idx_0)
         coeffs_tmp[coeffs_linear_idx++] = coeffs[coeffs_idx_0];
      ccs_coeffs->put(coeffs_tmp);
      ++coeffs_capture_count;
      mc_testbench_util::process_wait_ctrl("coeffs",testbench::coeffs_wait_ctrl,ccs_wait_ctrl_coeffs.operator->(),cur_iter,coeffs_capture_count,0);
   }
   testbench::coeffs_ignore = false;
}
// ============================================
// Function: capture_output
// --------------------------------------------

void mc_testbench::capture_output( ac_channel<ac_int<8, true > > &output)
{
   static mc_golden_info< ac_int<8, true >, MaskPacket<1, 8> > output_tmp(testbench::output_ignore, false, output_iteration_count);
   output_tmp._ignore = testbench::output_ignore;
   output_tmp._iteration = output_iteration_count;
   // BEGIN: testbench output_mask control for field_name output
   if ( testbench::output_use_mask ) {
      sc_lv<8> tmp_mask_lv;
      type_to_vector(testbench::output_output_mask, 8, tmp_mask_lv);
      output_tmp._use_mask = true;
      output_tmp._packet._mask = tmp_mask_lv;
   }
   // END: testbench output_mask control for field_name output
   static int last_j_output_out = 0;
   if (_capture_output)
   {
      int cur_iter = output_capture_count;
      ++output_iteration_count;
      unsigned int chan_factor = 1;
      unsigned int ccs_scv_i,ccs_scv_j;
      ccs_scv_i = remaining_output_golden;
      while (ccs_scv_i < output.ac_channel<ac_int<8, true > >::debug_size()) {
         for (ccs_scv_j = last_j_output_out; ccs_scv_j < chan_factor; ccs_scv_j++,ccs_scv_i++) {
            if (ccs_scv_i < output.ac_channel<ac_int<8, true > >::debug_size()) {
               output_tmp._data = output.ac_channel<ac_int<8, true > >::chan[ccs_scv_i];
            } else {
               break;
            }
         }
         if (ccs_scv_j == chan_factor) {
            output_golden.put(output_tmp);
            last_j_output_out = 0;
            output_capture_count += chan_factor;
         } else {
            last_j_output_out = ccs_scv_j;
         }
      }
      mc_testbench_util::process_wait_ctrl("output",testbench::output_wait_ctrl,ccs_wait_ctrl_output.operator->(),cur_iter,output_capture_count,1);
      testbench::output_use_mask = false;
   }
   testbench::output_ignore = false;
   testbench::output_skip = false;
}
// ============================================
// Function: wait_on_input_required
// --------------------------------------------

void mc_testbench::wait_on_input_required()
{
   ++wait_cnt;
   wait(SC_ZERO_TIME); // get fifos a chance to update
   ++period_counter;
   sc_time timeout = sc_time_stamp() - previous_timestamp;
   if (calculate_period && sc_time_stamp() > SC_ZERO_TIME && sc_time_stamp() != previous_timestamp && sc_time_stamp() != timeout) {
      average_period = (average_period + timeout) / 2;
   }
   previous_timestamp = sc_time_stamp();
   while (atleast_one_active_input) {
      if (_capture_input && ccs_input->used() == 0) return;
      if (_capture_coeffs && ccs_coeffs->used() == 0) return;
      that->cpp_testbench_active.write(false);
      if (average_period > SC_ZERO_TIME && sc_time_stamp() != timeout)
         wait(average_period * 10, ccs_input->ok_to_put() | ccs_coeffs->ok_to_put());
      else
         wait(ccs_input->ok_to_put() | ccs_coeffs->ok_to_put());
      that->cpp_testbench_active.write(true);
      if (timed_out()) {
         calculate_period = false;
         return;
      }
   }
}
// ============================================
// Function: capture_IN
// --------------------------------------------

void mc_testbench::capture_IN(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output)
{
   that->capture_input(input);
   that->capture_coeffs(coeffs);
   that->remaining_output_golden =  output.ac_channel<ac_int<8, true > >::debug_size();
}
// ============================================
// Function: capture_OUT
// --------------------------------------------

void mc_testbench::capture_OUT(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output)
{
   that->remaining_ccs_input =  input.ac_channel<ac_int<8, true > >::debug_size();
   if (testbench::enable_idle_sync_mode && that->remaining_ccs_input != 0) {
      cout << "Warning: Testbench input channel 'input' not empty. Remaining size: " << that->remaining_ccs_input << endl;
   }
   that->capture_output(output);
   static bool default_idle_sync_mode = ac_env::read_bool("SCVerify_IDLE_SYNCHRONIZATION_MODE",false);
   testbench::enable_idle_sync_mode = default_idle_sync_mode;
}
// ============================================
// Function: exec_run
// --------------------------------------------

void mc_testbench::exec_run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output)
{
   #ifndef CCS_SCVERIFY_USE_CCS_BLOCK
   wait_for_idle_sync();
   capture_IN(input, coeffs, output);
   fir::run(input, coeffs, output);
   // throttle ac_channel based on number of calls to chan::size() or chan::empty() or chan::nb_read() (but not chan::available()) 
   if (1) {
      int cnt=0;
      if (cnt) std::cout << "mc_testbench.cpp: CONTINUES @ " << sc_time_stamp() << std::endl;
      if (cnt) that->cpp_testbench_active.write(true);
   }
   capture_OUT(input, coeffs, output);
   #else
   #endif
}
// ============================================
// Function: start_of_simulation
// --------------------------------------------

void mc_testbench::start_of_simulation()
{
   set_enable_stalls(false);
   if (ac_env::read_int("SCVerify_AUTOWAIT", 0) != 0) { //explicitly 0 means off
      SC_REPORT_INFO(name(), "SCVerify AUTOWAIT is enabled for this simulation.");
   }
}
// ============================================
// Function: end_of_simulation
// --------------------------------------------

void mc_testbench::end_of_simulation()
{
   if (!_checked_results) {
      SC_REPORT_INFO(name(), "Testbench exited early or ran into deadlock");
      check_results();
   }
}
// ============================================
// Function: check_results
// --------------------------------------------

void mc_testbench::check_results()
{
   if (_checked_results) return;
   _checked_results = true;
   cout<<endl;
   cout<<"Checking results"<<endl;
   if (main_exit_code) _failed = true;
   int _num_outputs_checked = 0;
   bool _has_capture_counts = false;
   std::ostringstream mctb_msg;
   
   if (!_capture_output) {
      cout<<"'output' - warning, output was optimized away"<<endl;
   } else {
      _num_outputs_checked++;
      _failed |= output_comp->check_results(output_capture_count,testbench::output_skip_noerr);
      _has_capture_counts |= !!(output_capture_count);
   }
   cout<<endl;
   if (_num_outputs_checked == 0) {
      cout<<"Error: All outputs were optimized away. No output values were compared."<<endl;
      _failed = _failed || (_num_outputs_checked == 0);
   }
   if (!_has_capture_counts) {
      cout<<"Error: Nothing to compare, all output capture counts are zero."<<endl;
      _failed = true;
   }
   if (main_exit_code) cout << "Error: C++ Testbench 'main()' returned a non-zero exit code ("<<main_exit_code<<"). Check your testbench." <<endl;
   mctb_msg.clear();
   if (_failed) mctb_msg << "Simulation FAILED";
   else         mctb_msg << "Simulation PASSED";
   mctb_msg << " @ " << sc_time_stamp();
   if (_channel_mismatch && _failed)
      mctb_msg << endl << "An input channel was switched before the input fifo was fully empty. Check your testbench.";
   SC_REPORT_INFO(this->name(), mctb_msg.str().c_str());
}
// ============================================
// Function: failed
// --------------------------------------------

bool mc_testbench::failed()
{
   return _failed;
}
// ============================================
// Function: set_failed
// --------------------------------------------

void mc_testbench::set_failed(bool fail)
{
   _failed = fail;
}
// ---------------------------------------------------------------
// Process: SC_METHOD wait_for_end
// Static sensitivity: sensitive << clk.pos() << testbench_end_event;

void mc_testbench::wait_for_end() {
   // If run() has not finished, we do nothing here
   if (!testbench_ended) return;
   // check for completed outputs
   if (output_comp->get_compare_count() < output_capture_count) {testbench_end_event.notify(1,SC_NS); return;}
   // If we made it here, all outputs have flushed. Check the results
   testbench_aw_event.notify(SC_ZERO_TIME);
   SC_REPORT_INFO(name(), "Simulation completed");
   check_results();
   sc_stop();
}
// ---------------------------------------------------------------
// Process: SC_THREAD run
// Static sensitivity: 

void mc_testbench::run() {
   testbench::enable_idle_sync_mode = false;
   testbench::idle_sync_stable_cycles = 1;
   _channel_mismatch = false;
   testbench::input_ignore = false;
   testbench::input_skip = false;
   testbench::input_skip_quiet = false;
   testbench::input_skip_once = false;
   testbench::input_skip_noerr = false;
   testbench::input_array_comp_first = -1;
   testbench::input_array_comp_last = -1;
   testbench::input_wait_ctrl.clear();
   input_capture_count = 0;
   input_iteration_count = 0;
   input_pointer_set = false;
   testbench::coeffs_ignore = false;
   testbench::coeffs_skip = false;
   testbench::coeffs_skip_quiet = false;
   testbench::coeffs_skip_once = false;
   testbench::coeffs_skip_noerr = false;
   testbench::coeffs_array_comp_first = -1;
   testbench::coeffs_array_comp_last = -1;
   testbench::coeffs_wait_ctrl.clear();
   coeffs_capture_count = 0;
   coeffs_iteration_count = 0;
   testbench::output_ignore = false;
   testbench::output_skip = false;
   testbench::output_skip_quiet = false;
   testbench::output_skip_once = false;
   testbench::output_skip_noerr = false;
   testbench::output_array_comp_first = -1;
   testbench::output_array_comp_last = -1;
   testbench::output_use_mask = false;
   testbench::output_output_mask = (ac_int<8, true >) ~0;
   testbench::output_wait_ctrl.clear();
   output_capture_count = 0;
   output_iteration_count = 0;
   output_pointer_set = false;
   testbench testbench_inst(sc_argc(), sc_argv());
   main_exit_code = testbench_inst.main();
   cout<<"Info: Execution of user-supplied C++ testbench 'main()' has completed with exit code = " << main_exit_code << endl;
   cout<<endl;
   cout<<"Info: Collecting data completed"<<endl;
   cout<<"   captured "<<input_capture_count<<" values of input"<<endl;
   cout<<"   captured "<<coeffs_capture_count<<" values of coeffs"<<endl;
   cout<<"   captured "<<output_capture_count<<" values of output"<<endl;
   testbench_ended = true;
   testbench_end_event.notify(SC_ZERO_TIME);
}
#ifdef CCS_SCVERIFY_USE_CCS_BLOCK
#include "ccs_block_macros.cpp"
#endif
