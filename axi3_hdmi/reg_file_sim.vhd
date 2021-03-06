----------------------------------------------------------------------------
--  reg_file_sim.vhd
--	AXI Lite Register File (Simulation)
--	Version 1.1
--
--  Copyright (C) 2013 H.Poetzl
--
--	This program is free software: you can redistribute it and/or
--	modify it under the terms of the GNU General Public License
--	as published by the Free Software Foundation, either version
--	2 of the License, or (at your option) any later version.
--
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

package reg_array_pkg is
    type reg_array is array (natural range <>) of
	std_logic_vector(31 downto 0);
end reg_array_pkg;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;

library unisim;
use unisim.VCOMPONENTS.all;

use work.axi3ml_pkg.all;	-- AXI3 Lite Master
use work.reg_array_pkg.ALL;


entity reg_file is
    generic (
	NAME : string := "RegisterFile";
	REG_MASK : unsigned (31 downto 0) := x"000000F";
	OREG_SIZE : natural := 8;
	IREG_SIZE : natural := 8
    );
    port (
	s_axi_aclk : in std_logic;
	s_axi_areset_n : in std_logic;
	--
	s_axi_ro : out axi3ml_read_in_r;
	s_axi_ri : in axi3ml_read_out_r;
	s_axi_wo : out axi3ml_write_in_r;
	s_axi_wi : in axi3ml_write_out_r;
	--
	oreg : out reg_array(0 to OREG_SIZE - 1);
	ireg : in reg_array(0 to IREG_SIZE - 1)
    );
end entity reg_file;


architecture RTL of reg_file is
begin

    SCANGEN : if NAME = "ScanGen" generate
	oreg <= (
	    std_logic_vector(to_unsigned(	2200, 32)),	--  2200   64
	    std_logic_vector(to_unsigned(	1125, 32)),	--  1125   32
	    std_logic_vector(to_unsigned(	   0, 32)),	--     0    8
	    std_logic_vector(to_unsigned(	1920, 32)),	--  1920   40
	    std_logic_vector(to_unsigned(	  41, 32)),	--    41    8
	    std_logic_vector(to_unsigned(	1121, 32)),	--  1121   24
	    std_logic_vector(to_unsigned(	2000, 32)),	--  2000    0
	    std_logic_vector(to_unsigned(	2044, 32)),	--  2044    4
	
	    std_logic_vector(to_unsigned(	   0, 32)),	--     0    0
	    std_logic_vector(to_unsigned(	   5, 32)),	--     5    2
	    std_logic_vector(to_unsigned(	   0, 32)),	--     0    8
	    std_logic_vector(to_unsigned(	1920, 32)),	--  1920   40
	    std_logic_vector(to_unsigned(	  41, 32)),	--    41    8
	    std_logic_vector(to_unsigned(	1121, 32)),	--  1121   24
	    std_logic_vector(to_unsigned(	  10, 32)),	--    10    4
	    std_logic_vector(to_unsigned(	 128, 32)),	--    20    6

	    std_logic_vector(to_unsigned(	  64, 32)),	--     0    0
	    std_logic_vector(to_unsigned(	 512, 32)),	--     5    2
	    std_logic_vector(to_unsigned(	   0, 32)),	--    30    7
	    std_logic_vector(to_unsigned(	   0, 32)) );	--    30    7
	
    end generate;


    ADDRGEN : if NAME = "AddrGen" generate
	oreg <= (
	    std_logic_vector(to_unsigned( 16#000000#, 32)),
	    std_logic_vector(to_unsigned( 16#000080#, 32)),
	    std_logic_vector(to_unsigned(	  29, 32)),
	    std_logic_vector(to_unsigned( 16#001180#, 32)),
	    std_logic_vector(to_unsigned( 16#FFF000#, 32)),

	    std_logic_vector(to_unsigned( 16#000000#, 32)),
	    std_logic_vector(to_unsigned( 16#000080#, 32)),
	    std_logic_vector(to_unsigned(	  29, 32)),
	    std_logic_vector(to_unsigned( 16#001180#, 32)),
	    std_logic_vector(to_unsigned( 16#FFF000#, 32)),

	    std_logic_vector(to_unsigned( 16#000000#, 32)),
	    std_logic_vector(to_unsigned( 16#000080#, 32)),
	    std_logic_vector(to_unsigned(	  29, 32)),
	    std_logic_vector(to_unsigned( 16#001180#, 32)),
	    std_logic_vector(to_unsigned( 16#FFF000#, 32)),

	    std_logic_vector(to_unsigned( 16#000000#, 32)),
	    std_logic_vector(to_unsigned( 16#000080#, 32)),
	    std_logic_vector(to_unsigned(	  29, 32)),
	    std_logic_vector(to_unsigned( 16#001180#, 32)),
	    std_logic_vector(to_unsigned( 16#FFF000#, 32)) );
    end generate;
	
end RTL;

