----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2025 09:06:46 AM
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is

  component Counter is
    Port (
      Dir : in STD_LOGIC;
      Res : in STD_LOGIC;
      Clk : in STD_LOGIC;
      Q   : out STD_LOGIC_VECTOR (2 downto 0)
    );
  end component;

  signal Q    : STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal Res  : STD_LOGIC := '0';
  signal Dir  : STD_LOGIC := '0';
  signal Clk  : STD_LOGIC := '0';

begin

  -- Instantiate Counter
  UUT: Counter
    port map (
      Dir => Dir,
      Res => Res,
      Clk => Clk,
      Q   => Q
    );

  -- Generate 100 MHz Clock
  Clock_process: process
  begin
    Clk <= not Clk;
    wait for 5 ns;  -- 10ns full period = 100 MHz
  end process;

  -- Simulation Sequence
  Sim_process: process
  begin
    -- Initial delay
--    Dir <='0';
--    wait for 100 ns;

    -- Apply reset
    Res <= '1';
    wait for 100 ns;
    Res <= '0';

    -- Let it count for a while (Dir = 0)
    wait for 500 ns;

    -- Change direction
   Dir <= '1';

    -- Let it count again
  

    -- Finish simulation
    wait;
  end process;

end Behavioral;