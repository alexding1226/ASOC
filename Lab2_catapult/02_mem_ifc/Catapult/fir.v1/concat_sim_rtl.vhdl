
--------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_wait_pkg_v1 IS

COMPONENT ccs_in_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy    : OUT std_logic;
    ivld   : OUT std_logic;
    dat    : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy   : IN  std_logic;
    vld    : IN  std_logic
   );
END COMPONENT;

END ccs_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy   : OUT std_logic;
    ivld  : OUT std_logic;
    dat   : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy  : IN  std_logic;
    vld   : IN  std_logic
  );
END ccs_in_wait_v1;

ARCHITECTURE beh OF ccs_in_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  idat <= dat;
  rdy  <= irdy and not stall_ctrl;
  ivld <= vld and not stall_ctrl;

END beh;


--------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_wait_pkg_v1 IS

COMPONENT ccs_out_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy   : OUT std_logic;
    vld    : OUT std_logic;
    idat   : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy    : IN  std_logic;
    ivld   : IN  std_logic
  );
END COMPONENT;

END ccs_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy  : OUT std_logic;
    vld   : OUT std_logic;
    idat  : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy   : IN  std_logic;
    ivld  : IN  std_logic
  );
END ccs_out_wait_v1;

ARCHITECTURE beh OF ccs_out_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  dat  <= idat;
  irdy <= rdy and not stall_ctrl;
  vld  <= ivld and not stall_ctrl;

END beh;


--------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2023.2/1059873 Production Release
--  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
-- 
--  Generated by:   r12016@cad40
--  Generated date: Sun Mar 24 17:02:16 2024
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen IS
  PORT(
    q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re : OUT STD_LOGIC;
    radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
  );
END fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen;

ARCHITECTURE v1 OF fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen
    IS
  -- Default Constants

BEGIN
  q_d <= q;
  re <= (port_0_r_ram_ir_internal_RMASK_B_d);
  radr <= (radr_d);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_run_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_run_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    SHIFT_C_1_tr0 : IN STD_LOGIC
  );
END fir_run_run_fsm;

ARCHITECTURE v1 OF fir_run_run_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for fir_run_run_fsm_1
  TYPE fir_run_run_fsm_1_ST IS (run_rlp_C_0, main_C_0, SHIFT_C_0, SHIFT_C_1, main_C_1);

  SIGNAL state_var : fir_run_run_fsm_1_ST;
  SIGNAL state_var_NS : fir_run_run_fsm_1_ST;

BEGIN
  fir_run_run_fsm_1 : PROCESS (SHIFT_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010");
        state_var_NS <= SHIFT_C_0;
      WHEN SHIFT_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100");
        state_var_NS <= SHIFT_C_1;
      WHEN SHIFT_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000");
        IF ( SHIFT_C_1_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= SHIFT_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000");
        state_var_NS <= main_C_0;
      -- run_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS fir_run_run_fsm_1;

  fir_run_run_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= run_rlp_C_0;
      ELSE
        IF ( run_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS fir_run_run_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : OUT STD_LOGIC;
    run_wten : OUT STD_LOGIC;
    input_rsci_wen_comp : IN STD_LOGIC;
    coeff_addr_rsci_wen_comp : IN STD_LOGIC;
    output_rsci_wen_comp : IN STD_LOGIC
  );
END fir_run_staller;

ARCHITECTURE v1 OF fir_run_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL run_wen_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL run_wten_reg : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  run_wen <= run_wen_drv;

  run_wen_drv <= input_rsci_wen_comp AND coeff_addr_rsci_wen_comp AND output_rsci_wen_comp;
  run_wten <= run_wten_reg;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_wten_reg <= '0';
      ELSE
        run_wten_reg <= NOT run_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  PORT(
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
    coeffs_triosy_obj_biwt : OUT STD_LOGIC
  );
END fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl;

ARCHITECTURE v1 OF fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_triosy_obj_biwt <= (NOT run_wten) AND coeffs_triosy_obj_iswt0;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci_output_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_output_rsci_output_wait_ctrl IS
  PORT(
    output_rsci_iswt0 : IN STD_LOGIC;
    output_rsci_biwt : OUT STD_LOGIC;
    output_rsci_irdy : IN STD_LOGIC
  );
END fir_run_output_rsci_output_wait_ctrl;

ARCHITECTURE v1 OF fir_run_output_rsci_output_wait_ctrl IS
  -- Default Constants

BEGIN
  output_rsci_biwt <= output_rsci_iswt0 AND output_rsci_irdy;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl IS
  PORT(
    coeff_addr_rsci_iswt0 : IN STD_LOGIC;
    coeff_addr_rsci_biwt : OUT STD_LOGIC;
    coeff_addr_rsci_ivld : IN STD_LOGIC
  );
END fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl;

ARCHITECTURE v1 OF fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl IS
  -- Default Constants

BEGIN
  coeff_addr_rsci_biwt <= coeff_addr_rsci_iswt0 AND coeff_addr_rsci_ivld;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsci_biwt : IN STD_LOGIC;
    coeffs_rsci_bdwt : IN STD_LOGIC
  );
END fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp;

ARCHITECTURE v1 OF fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsci_bcwt : STD_LOGIC;
  SIGNAL coeffs_rsci_q_d_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);

  FUNCTION MUX_v_8_2_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  coeffs_rsci_q_d_mxwt <= MUX_v_8_2_2(coeffs_rsci_q_d, coeffs_rsci_q_d_bfwt, coeffs_rsci_bcwt);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsci_bcwt <= '0';
      ELSE
        coeffs_rsci_bcwt <= NOT((NOT(coeffs_rsci_bcwt OR coeffs_rsci_biwt)) OR coeffs_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        coeffs_rsci_q_d_bfwt <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( coeffs_rsci_biwt = '1' ) THEN
        coeffs_rsci_q_d_bfwt <= coeffs_rsci_q_d;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl IS
  PORT(
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    coeffs_rsci_oswt : IN STD_LOGIC;
    coeffs_rsci_biwt : OUT STD_LOGIC;
    coeffs_rsci_bdwt : OUT STD_LOGIC;
    coeffs_rsci_biwt_pff : OUT STD_LOGIC;
    coeffs_rsci_oswt_pff : IN STD_LOGIC
  );
END fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl;

ARCHITECTURE v1 OF fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_rsci_bdwt <= coeffs_rsci_oswt AND run_wen;
  coeffs_rsci_biwt <= (NOT run_wten) AND coeffs_rsci_oswt;
  coeffs_rsci_biwt_pff <= run_wen AND coeffs_rsci_oswt_pff;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci_input_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_input_rsci_input_wait_ctrl IS
  PORT(
    input_rsci_iswt0 : IN STD_LOGIC;
    input_rsci_biwt : OUT STD_LOGIC;
    input_rsci_ivld : IN STD_LOGIC
  );
END fir_run_input_rsci_input_wait_ctrl;

ARCHITECTURE v1 OF fir_run_input_rsci_input_wait_ctrl IS
  -- Default Constants

BEGIN
  input_rsci_biwt <= input_rsci_iswt0 AND input_rsci_ivld;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeffs_triosy_obj IS
  PORT(
    coeffs_triosy_lz : OUT STD_LOGIC;
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC
  );
END fir_run_coeffs_triosy_obj;

ARCHITECTURE v1 OF fir_run_coeffs_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_triosy_obj_biwt : STD_LOGIC;

  COMPONENT fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT(
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
      coeffs_triosy_obj_biwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_triosy_obj_biwt,
      lz => coeffs_triosy_lz
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst : fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT MAP(
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => coeffs_triosy_obj_iswt0,
      coeffs_triosy_obj_biwt => coeffs_triosy_obj_biwt
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_output_rsci IS
  PORT(
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC;
    output_rsci_oswt : IN STD_LOGIC;
    output_rsci_wen_comp : OUT STD_LOGIC;
    output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_output_rsci;

ARCHITECTURE v1 OF fir_run_output_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL output_rsci_biwt : STD_LOGIC;
  SIGNAL output_rsci_irdy : STD_LOGIC;

  SIGNAL output_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL output_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_output_rsci_output_wait_ctrl
    PORT(
      output_rsci_iswt0 : IN STD_LOGIC;
      output_rsci_biwt : OUT STD_LOGIC;
      output_rsci_irdy : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  output_rsci : work.ccs_out_wait_pkg_v1.ccs_out_wait_v1
    GENERIC MAP(
      rscid => 4,
      width => 8
      )
    PORT MAP(
      irdy => output_rsci_irdy,
      ivld => output_rsci_oswt,
      idat => output_rsci_idat_1,
      rdy => output_rsc_rdy,
      vld => output_rsc_vld,
      dat => output_rsci_dat
    );
  output_rsci_idat_1 <= output_rsci_idat;
  output_rsc_dat <= output_rsci_dat;

  fir_run_output_rsci_output_wait_ctrl_inst : fir_run_output_rsci_output_wait_ctrl
    PORT MAP(
      output_rsci_iswt0 => output_rsci_oswt,
      output_rsci_biwt => output_rsci_biwt,
      output_rsci_irdy => output_rsci_irdy
    );
  output_rsci_wen_comp <= (NOT output_rsci_oswt) OR output_rsci_biwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeff_addr_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeff_addr_rsci IS
  PORT(
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    coeff_addr_rsci_oswt : IN STD_LOGIC;
    coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
    coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END fir_run_coeff_addr_rsci;

ARCHITECTURE v1 OF fir_run_coeff_addr_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeff_addr_rsci_biwt : STD_LOGIC;
  SIGNAL coeff_addr_rsci_ivld : STD_LOGIC;
  SIGNAL coeff_addr_rsci_idat : STD_LOGIC_VECTOR (4 DOWNTO 0);

  SIGNAL coeff_addr_rsci_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL coeff_addr_rsci_idat_1 : STD_LOGIC_VECTOR (4 DOWNTO 0);

  COMPONENT fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl
    PORT(
      coeff_addr_rsci_iswt0 : IN STD_LOGIC;
      coeff_addr_rsci_biwt : OUT STD_LOGIC;
      coeff_addr_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeff_addr_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 3,
      width => 5
      )
    PORT MAP(
      rdy => coeff_addr_rsc_rdy,
      vld => coeff_addr_rsc_vld,
      dat => coeff_addr_rsci_dat,
      irdy => coeff_addr_rsci_oswt,
      ivld => coeff_addr_rsci_ivld,
      idat => coeff_addr_rsci_idat_1
    );
  coeff_addr_rsci_dat <= coeff_addr_rsc_dat;
  coeff_addr_rsci_idat <= coeff_addr_rsci_idat_1;

  fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl_inst : fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl
    PORT MAP(
      coeff_addr_rsci_iswt0 => coeff_addr_rsci_oswt,
      coeff_addr_rsci_biwt => coeff_addr_rsci_biwt,
      coeff_addr_rsci_ivld => coeff_addr_rsci_ivld
    );
  coeff_addr_rsci_idat_mxwt <= coeff_addr_rsci_idat;
  coeff_addr_rsci_wen_comp <= (NOT coeff_addr_rsci_oswt) OR coeff_addr_rsci_biwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_rsci_1
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_coeffs_rsci_1 IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    run_wen : IN STD_LOGIC;
    run_wten : IN STD_LOGIC;
    coeffs_rsci_oswt : IN STD_LOGIC;
    coeffs_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsci_re_d_pff : OUT STD_LOGIC;
    coeffs_rsci_oswt_pff : IN STD_LOGIC
  );
END fir_run_coeffs_rsci_1;

ARCHITECTURE v1 OF fir_run_coeffs_rsci_1 IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsci_biwt : STD_LOGIC;
  SIGNAL coeffs_rsci_bdwt : STD_LOGIC;
  SIGNAL coeffs_rsci_biwt_iff : STD_LOGIC;

  COMPONENT fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl
    PORT(
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      coeffs_rsci_oswt : IN STD_LOGIC;
      coeffs_rsci_biwt : OUT STD_LOGIC;
      coeffs_rsci_bdwt : OUT STD_LOGIC;
      coeffs_rsci_biwt_pff : OUT STD_LOGIC;
      coeffs_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      coeffs_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      coeffs_rsci_biwt : IN STD_LOGIC;
      coeffs_rsci_bdwt : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d_mxwt : STD_LOGIC_VECTOR
      (7 DOWNTO 0);

BEGIN
  fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl_inst : fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl
    PORT MAP(
      run_wen => run_wen,
      run_wten => run_wten,
      coeffs_rsci_oswt => coeffs_rsci_oswt,
      coeffs_rsci_biwt => coeffs_rsci_biwt,
      coeffs_rsci_bdwt => coeffs_rsci_bdwt,
      coeffs_rsci_biwt_pff => coeffs_rsci_biwt_iff,
      coeffs_rsci_oswt_pff => coeffs_rsci_oswt_pff
    );
  fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst : fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsci_q_d => fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d,
      coeffs_rsci_q_d_mxwt => fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d_mxwt,
      coeffs_rsci_biwt => coeffs_rsci_biwt,
      coeffs_rsci_bdwt => coeffs_rsci_bdwt
    );
  fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d <= coeffs_rsci_q_d;
  coeffs_rsci_q_d_mxwt <= fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst_coeffs_rsci_q_d_mxwt;

  coeffs_rsci_re_d_pff <= coeffs_rsci_biwt_iff;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run_input_rsci IS
  PORT(
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    input_rsci_oswt : IN STD_LOGIC;
    input_rsci_wen_comp : OUT STD_LOGIC;
    input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_input_rsci;

ARCHITECTURE v1 OF fir_run_input_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_biwt : STD_LOGIC;
  SIGNAL input_rsci_ivld : STD_LOGIC;
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_input_rsci_input_wait_ctrl
    PORT(
      input_rsci_iswt0 : IN STD_LOGIC;
      input_rsci_biwt : OUT STD_LOGIC;
      input_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  input_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 1,
      width => 8
      )
    PORT MAP(
      rdy => input_rsc_rdy,
      vld => input_rsc_vld,
      dat => input_rsci_dat,
      irdy => input_rsci_oswt,
      ivld => input_rsci_ivld,
      idat => input_rsci_idat_1
    );
  input_rsci_dat <= input_rsc_dat;
  input_rsci_idat <= input_rsci_idat_1;

  fir_run_input_rsci_input_wait_ctrl_inst : fir_run_input_rsci_input_wait_ctrl
    PORT MAP(
      input_rsci_iswt0 => input_rsci_oswt,
      input_rsci_biwt => input_rsci_biwt,
      input_rsci_ivld => input_rsci_ivld
    );
  input_rsci_idat_mxwt <= input_rsci_idat;
  input_rsci_wen_comp <= (NOT input_rsci_oswt) OR input_rsci_biwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir_run IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_triosy_lz : OUT STD_LOGIC;
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC;
    coeffs_rsci_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsci_re_d_pff : OUT STD_LOGIC
  );
END fir_run;

ARCHITECTURE v1 OF fir_run IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_wen : STD_LOGIC;
  SIGNAL run_wten : STD_LOGIC;
  SIGNAL input_rsci_wen_comp : STD_LOGIC;
  SIGNAL input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_q_d_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeff_addr_rsci_wen_comp : STD_LOGIC;
  SIGNAL coeff_addr_rsci_idat_mxwt : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL output_rsci_wen_comp : STD_LOGIC;
  SIGNAL output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL SHIFT_and_tmp : STD_LOGIC;
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL or_dcpl_13 : STD_LOGIC;
  SIGNAL SHIFT_i_3_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL SHIFT_i_3_0_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL reg_coeffs_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_coeff_addr_rsci_iswt0_cse : STD_LOGIC;
  SIGNAL reg_coeffs_rsci_iswt0_cse : STD_LOGIC;
  SIGNAL reg_input_rsci_iswt0_cse : STD_LOGIC;
  SIGNAL temp_and_cse : STD_LOGIC;
  SIGNAL coeffs_rsci_re_d_iff : STD_LOGIC;
  SIGNAL addr_sva : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL MAC_i_3_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL regs_0_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_3_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_4_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_2_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_5_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_1_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_6_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_7_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL temp_sva : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL MAC_i_3_0_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL temp_sva_2 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 : STD_LOGIC_VECTOR (7
      DOWNTO 0);

  SIGNAL not_37_nl : STD_LOGIC;
  SIGNAL temp_not_1_nl : STD_LOGIC;
  SIGNAL not_38_nl : STD_LOGIC;
  SIGNAL MAC_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_mux_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  COMPONENT fir_run_input_rsci
    PORT(
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      input_rsci_oswt : IN STD_LOGIC;
      input_rsci_wen_comp : OUT STD_LOGIC;
      input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_input_rsci_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_input_rsci_inst_input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO
      0);

  COMPONENT fir_run_coeffs_rsci_1
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      run_wen : IN STD_LOGIC;
      run_wten : IN STD_LOGIC;
      coeffs_rsci_oswt : IN STD_LOGIC;
      coeffs_rsci_q_d_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      coeffs_rsci_re_d_pff : OUT STD_LOGIC;
      coeffs_rsci_oswt_pff : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d_mxwt : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff : STD_LOGIC;

  COMPONENT fir_run_coeff_addr_rsci
    PORT(
      coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      coeff_addr_rsc_vld : IN STD_LOGIC;
      coeff_addr_rsc_rdy : OUT STD_LOGIC;
      coeff_addr_rsci_oswt : IN STD_LOGIC;
      coeff_addr_rsci_wen_comp : OUT STD_LOGIC;
      coeff_addr_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_coeff_addr_rsci_inst_coeff_addr_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO
      0);
  SIGNAL fir_run_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (4 DOWNTO 0);

  COMPONENT fir_run_output_rsci
    PORT(
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC;
      output_rsci_oswt : IN STD_LOGIC;
      output_rsci_wen_comp : OUT STD_LOGIC;
      output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_output_rsci_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_output_rsci_inst_output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_coeffs_triosy_obj
    PORT(
      coeffs_triosy_lz : OUT STD_LOGIC;
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : OUT STD_LOGIC;
      run_wten : OUT STD_LOGIC;
      input_rsci_wen_comp : IN STD_LOGIC;
      coeff_addr_rsci_wen_comp : IN STD_LOGIC;
      output_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_run_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      SHIFT_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_run_fsm_inst_fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX_v_19_2_2(input_0 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(18 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_2_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_8_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "000" =>
          result := input_0;
        WHEN "001" =>
          result := input_1;
        WHEN "010" =>
          result := input_2;
        WHEN "011" =>
          result := input_3;
        WHEN "100" =>
          result := input_4;
        WHEN "101" =>
          result := input_5;
        WHEN "110" =>
          result := input_6;
        WHEN others =>
          result := input_7;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_8_2x0(input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "001" =>
          result := input_1;
        WHEN "010" =>
          result := input_2;
        WHEN "011" =>
          result := input_3;
        WHEN "100" =>
          result := input_4;
        WHEN "101" =>
          result := input_5;
        WHEN "110" =>
          result := input_6;
        WHEN others =>
          result := input_7;
      END CASE;
    RETURN result;
  END;

BEGIN
  fir_run_input_rsci_inst : fir_run_input_rsci
    PORT MAP(
      input_rsc_dat => fir_run_input_rsci_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      input_rsci_oswt => reg_input_rsci_iswt0_cse,
      input_rsci_wen_comp => input_rsci_wen_comp,
      input_rsci_idat_mxwt => fir_run_input_rsci_inst_input_rsci_idat_mxwt
    );
  fir_run_input_rsci_inst_input_rsc_dat <= input_rsc_dat;
  input_rsci_idat_mxwt <= fir_run_input_rsci_inst_input_rsci_idat_mxwt;

  fir_run_coeffs_rsci_1_inst : fir_run_coeffs_rsci_1
    PORT MAP(
      clk => clk,
      rst => rst,
      coeffs_rsci_q_d => fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d,
      run_wen => run_wen,
      run_wten => run_wten,
      coeffs_rsci_oswt => reg_coeffs_rsci_iswt0_cse,
      coeffs_rsci_q_d_mxwt => fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d_mxwt,
      coeffs_rsci_re_d_pff => coeffs_rsci_re_d_iff,
      coeffs_rsci_oswt_pff => fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff
    );
  fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d <= coeffs_rsci_q_d;
  coeffs_rsci_q_d_mxwt <= fir_run_coeffs_rsci_1_inst_coeffs_rsci_q_d_mxwt;
  fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff <= fsm_output(2);

  fir_run_coeff_addr_rsci_inst : fir_run_coeff_addr_rsci
    PORT MAP(
      coeff_addr_rsc_dat => fir_run_coeff_addr_rsci_inst_coeff_addr_rsc_dat,
      coeff_addr_rsc_vld => coeff_addr_rsc_vld,
      coeff_addr_rsc_rdy => coeff_addr_rsc_rdy,
      coeff_addr_rsci_oswt => reg_coeff_addr_rsci_iswt0_cse,
      coeff_addr_rsci_wen_comp => coeff_addr_rsci_wen_comp,
      coeff_addr_rsci_idat_mxwt => fir_run_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt
    );
  fir_run_coeff_addr_rsci_inst_coeff_addr_rsc_dat <= coeff_addr_rsc_dat;
  coeff_addr_rsci_idat_mxwt <= fir_run_coeff_addr_rsci_inst_coeff_addr_rsci_idat_mxwt;

  fir_run_output_rsci_inst : fir_run_output_rsci
    PORT MAP(
      output_rsc_dat => fir_run_output_rsci_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy,
      output_rsci_oswt => reg_coeffs_triosy_obj_iswt0_cse,
      output_rsci_wen_comp => output_rsci_wen_comp,
      output_rsci_idat => fir_run_output_rsci_inst_output_rsci_idat
    );
  output_rsc_dat <= fir_run_output_rsci_inst_output_rsc_dat;
  fir_run_output_rsci_inst_output_rsci_idat <= output_rsci_idat;

  fir_run_coeffs_triosy_obj_inst : fir_run_coeffs_triosy_obj
    PORT MAP(
      coeffs_triosy_lz => coeffs_triosy_lz,
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => reg_coeffs_triosy_obj_iswt0_cse
    );
  fir_run_staller_inst : fir_run_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      run_wten => run_wten,
      input_rsci_wen_comp => input_rsci_wen_comp,
      coeff_addr_rsci_wen_comp => coeff_addr_rsci_wen_comp,
      output_rsci_wen_comp => output_rsci_wen_comp
    );
  fir_run_run_fsm_inst : fir_run_run_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      fsm_output => fir_run_run_fsm_inst_fsm_output,
      SHIFT_C_1_tr0 => SHIFT_and_tmp
    );
  fsm_output <= fir_run_run_fsm_inst_fsm_output;

  temp_and_cse <= run_wen AND ((fsm_output(3)) OR (fsm_output(1)));
  MAC_mux_nl <= MUX_v_8_8_2(regs_0_lpi_2, regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2,
      regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2, regs_7_lpi_2, MAC_i_3_0_sva_2_0);
  MAC_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_q_d_mxwt)
      * SIGNED(MAC_mux_nl)), 16));
  temp_sva_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_sva) + CONV_SIGNED(SIGNED(MAC_mul_nl),
      19), 19));
  SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 <= MUX_v_8_8_2x0(regs_0_lpi_2,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      SHIFT_i_3_0_sva_2_0);
  SHIFT_and_tmp <= (SHIFT_i_3_0_sva_1(3)) AND (MAC_i_3_0_sva_1(3));
  or_dcpl_5 <= (SHIFT_i_3_0_sva_2_0(2)) OR (SHIFT_i_3_0_sva_2_0(0));
  or_dcpl_7 <= (SHIFT_i_3_0_sva_2_0(2)) OR (NOT (SHIFT_i_3_0_sva_2_0(0)));
  or_dcpl_11 <= (NOT (SHIFT_i_3_0_sva_2_0(2))) OR (SHIFT_i_3_0_sva_2_0(0));
  or_dcpl_13 <= NOT((SHIFT_i_3_0_sva_2_0(2)) AND (SHIFT_i_3_0_sva_2_0(0)));
  coeffs_rsci_radr_d <= addr_sva & MAC_i_3_0_sva_2_0;
  coeffs_rsci_re_d_pff <= coeffs_rsci_re_d_iff;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_coeffs_triosy_obj_iswt0_cse <= '0';
        reg_coeff_addr_rsci_iswt0_cse <= '0';
        reg_coeffs_rsci_iswt0_cse <= '0';
        reg_input_rsci_iswt0_cse <= '0';
        SHIFT_i_3_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        SHIFT_i_3_0_sva_1 <= STD_LOGIC_VECTOR'( "0000");
        MAC_i_3_0_sva_1 <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( run_wen = '1' ) THEN
        reg_coeffs_triosy_obj_iswt0_cse <= SHIFT_and_tmp AND (fsm_output(3));
        reg_coeff_addr_rsci_iswt0_cse <= (fsm_output(4)) OR (fsm_output(0));
        reg_coeffs_rsci_iswt0_cse <= fsm_output(2);
        reg_input_rsci_iswt0_cse <= (NOT((SHIFT_i_3_0_sva_1(0)) OR SHIFT_and_tmp))
            AND CONV_SL_1_1(SHIFT_i_3_0_sva_1(2 DOWNTO 1)=STD_LOGIC_VECTOR'("00"))
            AND (fsm_output(3));
        SHIFT_i_3_0_sva_2_0 <= MUX_v_3_2_2((SHIFT_i_3_0_sva_1(2 DOWNTO 0)), STD_LOGIC_VECTOR'("111"),
            not_37_nl);
        SHIFT_i_3_0_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(SHIFT_i_3_0_sva_2_0),
            3), 4) + SIGNED'( "1111"), 4));
        MAC_i_3_0_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(MAC_i_3_0_sva_2_0),
            3), 4) + SIGNED'( "1111"), 4));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_idat <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND SHIFT_and_tmp AND (fsm_output(3))) = '1' ) THEN
        output_rsci_idat <= temp_sva_2(18 DOWNTO 11);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_0_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_5 OR (SHIFT_i_3_0_sva_2_0(1)))))
          = '1' ) THEN
        regs_0_lpi_2 <= input_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_1_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_7 OR (SHIFT_i_3_0_sva_2_0(1)))))
          = '1' ) THEN
        regs_1_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_2_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_5 OR (NOT (SHIFT_i_3_0_sva_2_0(1))))))
          = '1' ) THEN
        regs_2_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_3_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_7 OR (NOT (SHIFT_i_3_0_sva_2_0(1))))))
          = '1' ) THEN
        regs_3_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_4_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_11 OR (SHIFT_i_3_0_sva_2_0(1)))))
          = '1' ) THEN
        regs_4_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_5_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_13 OR (SHIFT_i_3_0_sva_2_0(1)))))
          = '1' ) THEN
        regs_5_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_6_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((NOT (fsm_output(2))) OR or_dcpl_11 OR (NOT (SHIFT_i_3_0_sva_2_0(1))))))
          = '1' ) THEN
        regs_6_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_7_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((fsm_output(3)) OR ((or_dcpl_13 OR (NOT (SHIFT_i_3_0_sva_2_0(1))))
          AND (fsm_output(2)))))) = '1' ) THEN
        regs_7_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        temp_sva <= STD_LOGIC_VECTOR'( "0000000000000000000");
        MAC_i_3_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( temp_and_cse = '1' ) THEN
        temp_sva <= MUX_v_19_2_2(STD_LOGIC_VECTOR'("0000000000000000000"), temp_sva_2,
            temp_not_1_nl);
        MAC_i_3_0_sva_2_0 <= MUX_v_3_2_2((MAC_i_3_0_sva_1(2 DOWNTO 0)), STD_LOGIC_VECTOR'("111"),
            not_38_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        addr_sva <= STD_LOGIC_VECTOR'( "00000");
      ELSIF ( (run_wen AND CONV_SL_1_1(fsm_output(3 DOWNTO 2)=STD_LOGIC_VECTOR'("00")))
          = '1' ) THEN
        addr_sva <= coeff_addr_rsci_idat_mxwt;
      END IF;
    END IF;
  END PROCESS;
  not_37_nl <= NOT (fsm_output(3));
  temp_not_1_nl <= NOT (fsm_output(1));
  not_38_nl <= NOT (fsm_output(3));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY fir IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_rsc_re : OUT STD_LOGIC;
    coeffs_rsc_q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    coeff_addr_rsc_vld : IN STD_LOGIC;
    coeff_addr_rsc_rdy : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END fir;

ARCHITECTURE v1 OF fir IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_rsci_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_re_d_iff : STD_LOGIC;

  COMPONENT fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen
    PORT(
      q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re : OUT STD_LOGIC;
      radr : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      port_0_r_ram_ir_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL coeffs_rsci_q : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_radr : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_radr_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_q_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      coeffs_triosy_lz : OUT STD_LOGIC;
      coeff_addr_rsc_dat : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      coeff_addr_rsc_vld : IN STD_LOGIC;
      coeff_addr_rsc_rdy : OUT STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC;
      coeffs_rsci_radr_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      coeffs_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      coeffs_rsci_re_d_pff : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_inst_coeff_addr_rsc_dat : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL fir_run_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_inst_coeffs_rsci_radr_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_inst_coeffs_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
  coeffs_rsci : fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen
    PORT MAP(
      q => coeffs_rsci_q,
      re => coeffs_rsc_re,
      radr => coeffs_rsci_radr,
      radr_d => coeffs_rsci_radr_d_1,
      re_d => coeffs_rsci_re_d_iff,
      q_d => coeffs_rsci_q_d_1,
      port_0_r_ram_ir_internal_RMASK_B_d => coeffs_rsci_re_d_iff
    );
  coeffs_rsci_q <= coeffs_rsc_q;
  coeffs_rsc_radr <= coeffs_rsci_radr;
  coeffs_rsci_radr_d_1 <= coeffs_rsci_radr_d;
  coeffs_rsci_q_d <= coeffs_rsci_q_d_1;

  fir_run_inst : fir_run
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => fir_run_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      coeffs_triosy_lz => coeffs_triosy_lz,
      coeff_addr_rsc_dat => fir_run_inst_coeff_addr_rsc_dat,
      coeff_addr_rsc_vld => coeff_addr_rsc_vld,
      coeff_addr_rsc_rdy => coeff_addr_rsc_rdy,
      output_rsc_dat => fir_run_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy,
      coeffs_rsci_radr_d => fir_run_inst_coeffs_rsci_radr_d,
      coeffs_rsci_q_d => fir_run_inst_coeffs_rsci_q_d,
      coeffs_rsci_re_d_pff => coeffs_rsci_re_d_iff
    );
  fir_run_inst_input_rsc_dat <= input_rsc_dat;
  fir_run_inst_coeff_addr_rsc_dat <= coeff_addr_rsc_dat;
  output_rsc_dat <= fir_run_inst_output_rsc_dat;
  coeffs_rsci_radr_d <= fir_run_inst_coeffs_rsci_radr_d;
  fir_run_inst_coeffs_rsci_q_d <= coeffs_rsci_q_d;

END v1;



