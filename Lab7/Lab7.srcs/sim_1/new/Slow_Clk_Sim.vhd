----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2025 12:22:26 AM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

-- Component Declaration
  component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
  end component;

  -- Testbench Signals
  
  signal Clk_in : STD_LOGIC:= '0' ;
  signal Clk_out : STD_LOGIC;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: Slow_Clk
    Port map (
      Clk_in => Clk_in,
      Clk_out => Clk_out
    );

  -- Generate 5 rising edges (5 clock cycles)
  Clock_process: process
    begin
      Clk_in <= not Clk_in;
      wait for 5 ns;  -- 10ns full period = 100 MHz
    end process;

end Behavioral;
