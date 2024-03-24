-- SCVerify DUT wrapper used for SystemC > HDL interface bindings

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ccs_wrapper IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din_rsc_dat : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    din_rsc_vld : IN STD_LOGIC;
    din_rsc_rdy : OUT STD_LOGIC;
    coeffs : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    dout_rsc_dat : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    dout_rsc_vld : OUT STD_LOGIC;
    dout_rsc_rdy : IN STD_LOGIC
  );
END ccs_wrapper;

ARCHITECTURE wrap OF ccs_wrapper IS
  COMPONENT top
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      din_rsc_dat : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      din_rsc_vld : IN STD_LOGIC;
      din_rsc_rdy : OUT STD_LOGIC;
      coeffs : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      dout_rsc_dat : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      dout_rsc_vld : OUT STD_LOGIC;
      dout_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;

BEGIN

  dut_inst : top
    PORT MAP (
      clk => clk,
      rst => rst,
      din_rsc_dat => din_rsc_dat,
      din_rsc_vld => din_rsc_vld,
      din_rsc_rdy => din_rsc_rdy,
      coeffs => coeffs,
      dout_rsc_dat => dout_rsc_dat,
      dout_rsc_vld => dout_rsc_vld,
      dout_rsc_rdy => dout_rsc_rdy
    );

END wrap;

