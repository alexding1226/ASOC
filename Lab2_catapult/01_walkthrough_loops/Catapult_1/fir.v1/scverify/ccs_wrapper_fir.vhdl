-- SCVerify DUT wrapper used for SystemC > HDL interface bindings

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ccs_wrapper IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END ccs_wrapper;

ARCHITECTURE wrap OF ccs_wrapper IS
  COMPONENT fir
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      coeffs_rsc_dat : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      coeffs_triosy_lz : OUT STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;

BEGIN

  dut_inst : fir
    PORT MAP (
      clk => clk,
      rst => rst,
      input_rsc_dat => input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      coeffs_rsc_dat => coeffs_rsc_dat,
      coeffs_triosy_lz => coeffs_triosy_lz,
      output_rsc_dat => output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy
    );

END wrap;

