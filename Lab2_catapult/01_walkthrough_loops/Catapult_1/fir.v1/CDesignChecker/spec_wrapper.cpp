// ----------------------------------------------------------------------------
// SLEC wrapper around original function
//
//    HLS version: 8.2
//   SLEC version: SLEC 2023.2
//
//   Generated by: r12016
// Generated date: Sun Mar 24 15:39:29 CST 2024
//
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// Original function
//
//
// ----------------------------------------------------------------------------
// spec_wrapper
// SystemC transaction wrapper around original C function
// ----------------------------------------------------------------------------
//
#include "spec_wrapper.h"
#include <mc_typeconv.h>

ac_channel<ac_int<8, true > > spec_wrapper::input;
ac_channel<ac_int<8, true > > spec_wrapper::output;


#ifdef SLEC_CAT2SLEC_TB
#ifdef __SYNTHESIS__
#ifndef _SLEC_QSIM
#warning "Testbenches should not be compiled with -D__SYNTHESIS__ specified"
#endif //_SLEC_QSIM
#endif //__SYNTHESIS__
#endif //SLEC_CAT2SLEC_TB

#ifdef SLEC_CHANNEL_CAT2SLEC_TB
#define STREAM_READ(x,y) x.read(y)
#define STREAM_WRITE(x,y) x.write(y)
#else //SLEC_CHANNEL_CAT2SLEC_TB
#define STREAM_READ(x,y) x.rdy.write(1); y = x.dat.read()
#define STREAM_WRITE(x,y) x.dat.write(y); x.vld.write(1)
#endif //SLEC_CHANNEL_CAT2SLEC_TB


// ============================================
// Function: resetData
// --------------------------------------------

void spec_wrapper::resetData()
{

    Calypto_transaction_done.write(0);

    _Calypto_function_call_counter = 1;

    #ifndef SLEC_CHANNEL_CAT2SLEC_TB
    // Reset function call of channels
    input.reset_read();
    output.reset_write();

    #endif //SLEC_CHANNEL_CAT2SLEC_TB

    #ifdef SLEC_CHANNEL_CAT2SLEC_TB
    input_rdy.initialize(true);
    #endif //SLEC_CHANNEL_CAT2SLEC_TB

    // Reset variables for outputs to 0
}


// ============================================
// Function: readData
// --------------------------------------------

void spec_wrapper::readData()
{

    // ----------------------------------------------------------------------------
    // Translate data read from wrapper input into format of original function interface

#ifdef SLEC_FLAT_CAT2SLEC_TB
    if (!tb_latch_nonstream.read())
        return;
#endif //SLEC_FLAT_CAT2SLEC_TB

    // READ - Create assignment statements for coeffs[*]
    sc_lv<8> temp_lv_coeffs_3_4;
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(7,0));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[0]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(15,8));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[1]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(23,16));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[2]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(31,24));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[3]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(39,32));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[4]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(47,40));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[5]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(55,48));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[6]);
    temp_lv_coeffs_3_4 = (slecIN_coeffs_idx_0.read().range(63,56));
    vector_to_type(temp_lv_coeffs_3_4,1,&coeffs[7]);
}


// ============================================
// Function: writeData
// --------------------------------------------

void spec_wrapper::writeData()
{

    // ----------------------------------------------------------------------------
    // Translate original function interface outputs into format of wrapper output
}

// ---------------------------------------------------------------
// Process: SC_METHOD set_constants
// Static sensitivity: sensitive << clk.pos();

void spec_wrapper::set_constants() {
    net_always_zero.write(0);
    net_always_one.write(1);
}

// ---------------------------------------------------------------
// Process: SC_METHOD generate_clk_rst
// Static sensitivity: sensitive << clk;
// Static sensitivity: sensitive << rst;

void spec_wrapper::generate_clk_rst() {
    clk_neg.write(!clk);
    rst_neg.write(!rst);

}

// ---------------------------------------------------------------
// Process: SC_CTHREAD doit
// Static sensitivity: clk.pos();
// Reset: reset_signal_is(rst,true);

void spec_wrapper::doit() {
    resetData();
    wait();
    while(1) {
        Calypto_transaction_done.write(0);
        readData();
        #ifdef SLEC_FLAT_CAT2SLEC_TB
        if (tb_run_dut.read())
        {
            try {
            _TB_SHOW("Design is running");
            p_this.fir::run(input,coeffs,output);
            _TB_SHOW("Design is done");
            }
            catch(ac_exception const& e) {
               std::cout << sc_time_stamp() << " : CALYPTO_TESTBENCH_WARNING: Encountered an exception (" << e.msg << ") at (" << e.file << ":" << e.line << "). Simulation will terminate." << std::endl;
            }
            catch(...) {
               std::cout << sc_time_stamp() << " : CALYPTO_TESTBENCH_WARNING: Encountered an unknown exception. Simulation will terminate." << std::endl;
            }
            input.reset();
            _TB_SHOW("output.size()=" << output.size());
        }
        #else //SLEC_FLAT_CAT2SLEC_TB
        p_this.fir::run(input,coeffs,output);
        #endif //SLEC_FLAT_CAT2SLEC_TB
        writeData();
        Calypto_transaction_done.write(1);
        _Calypto_function_call_counter++;
        wait();
    }
}

// ---------------------------------------------------------------
// Process: SC_METHOD process_input
// Static sensitivity: sensitive << net_dout_input;
// Static sensitivity: sensitive << clk;

void spec_wrapper::process_input() {

#ifdef SLEC_FLAT_CAT2SLEC_TB
    if (sc_time_stamp()<=sc_time(52,SC_NS))
        return;
    if (!input_rdy.read())
        return;
#endif //SLEC_FLAT_CAT2SLEC_TB
    ac_int<8, true > temp_input;

    sc_lv<8> temp_lv_input_1_2;
    temp_lv_input_1_2 = (net_dout_input.read());
    vector_to_type(temp_lv_input_1_2,1,&temp_input);

    STREAM_WRITE(input,temp_input);
}

// ---------------------------------------------------------------
// Process: SC_METHOD process_output
// Static sensitivity: sensitive << output.dat;
// Static sensitivity: sensitive << clk;

void spec_wrapper::process_output() {

    ac_int<8, true > temp_output;

#ifdef SLEC_FLAT_CAT2SLEC_TB
    if (!output.available(1))
        return;
#endif //SLEC_FLAT_CAT2SLEC_TB


    STREAM_READ(output,temp_output);

    sc_lv<8> temp_lv_output_5_6;
    sc_lv<8> temp_lv_output_5_6_slice;
    type_to_vector(temp_output,1,temp_lv_output_5_6_slice);
    temp_lv_output_5_6 = temp_lv_output_5_6_slice;
    slecOUT_output_idx_0 = temp_lv_output_5_6;
}

#ifndef SLEC_CHANNEL_CAT2SLEC_TB
#else //SLEC_CHANNEL_CAT2SLEC_TB
// ---------------------------------------------------------------
// Process: SC_METHOD counter_reset
// Static sensitivity: sensitive << clk.pos();

void spec_wrapper::counter_reset() {
    static int cycle_in_trans=SPEC_THROUGHPUT-1;

    _TB_SHOW("Cycle in transaction: " << cycle_in_trans);

    tb_reset_istream_counters.write((cycle_in_trans==SPEC_THROUGHPUT-1));
    if (cycle_in_trans==SPEC_THROUGHPUT-1)
    {
        _TB_SHOW(" input channels reset");
    }
    tb_reset_ostream_counters.write((cycle_in_trans==SPEC_THROUGHPUT-1));
    if (cycle_in_trans==SPEC_THROUGHPUT-1)
    {
        _TB_SHOW(" output channels reset");
    }

    cycle_in_trans=(cycle_in_trans+1)%SPEC_THROUGHPUT;
}

#endif //SLEC_CHANNEL_CAT2SLEC_TB