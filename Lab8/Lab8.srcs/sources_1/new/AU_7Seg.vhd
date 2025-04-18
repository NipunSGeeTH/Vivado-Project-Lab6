----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 06:52:53 PM
-- Design Name: 
-- Module Name: AU_7Seg - Behavioral
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

entity AU_7Seg is
    Port ( 
        A       : in  STD_LOGIC_VECTOR (3 downto 0);
        RegSel  : in  STD_LOGIC;
        Clk     : in  STD_LOGIC;
        S_7Seg  : out STD_LOGIC_VECTOR (6 downto 0);
        S_LED : out STD_LOGIC_VECTOR (3 downto 0);
        Zero    : out STD_LOGIC;
       
        Carry   : out STD_LOGIC
    );
end AU_7Seg;

architecture Behavioral of AU_7Seg is

    SIGNAL S_AU1, S_AU2 : STD_LOGIC_VECTOR (3 downto 0);
  
    
    component AU
        Port (
            A       : in  STD_LOGIC_VECTOR (3 downto 0);
            RegSel  : in  STD_LOGIC;
            Clk     : in  STD_LOGIC;
            S       : out STD_LOGIC_VECTOR (3 downto 0);
            Zero    : out STD_LOGIC;
            Carry   : out STD_LOGIC
        );
    end component;

    component LUT_16_7
        Port (
            address : in  STD_LOGIC_VECTOR (3 downto 0);
            data    : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

begin

    AU_0 : AU 
        port map (
            A       => A,
            RegSel  => RegSel,
            Clk     => Clk,
            S       => S_AU1,
            Zero    => Zero,
            Carry   => Carry
        ); 

    S_AU2 <= S_AU1;

    LUT_16_7_0 : LUT_16_7 
        port map (
            address => S_AU2,
            data    => S_7Seg
        );      

    S_LED <= S_AU1;

end Behavioral;

