 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;-- Uncomment the following library declaration if using-- arithmetic functions with Signed or Unsigned values--use IEEE.NUMERIC_STD.ALL;-- Uncomment the following library declaration if instantiating-- any Xilinx leaf cells in this code.--library UNISIM;--use UNISIM.VComponents.all;
entity AU_Sim is--  Port ( );
end AU_Sim;
architecture Behavioral of AU_Sim is
component Au
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
      RegSel : in STD_LOGIC;
      Clk : in STD_LOGIC;
      S : out STD_LOGIC_VECTOR (3 downto 0);
      Zero : out STD_LOGIC;
      Carry : out STD_LOGIC);
end component;
signal A,S : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal RegSel,Clk,Zero,Carry : STD_LOGIC:='0';
begin
UUT : AU
PORT MAP( A =>A,
         S =>S,
         RegSel => RegSel,
         Clk => Clk,
         Zero => Zero,
         Carry => Carry );
process begin
    clk <= (not clk);
    wait for 5ns;
end process;

-- Register No : 230317J
-- Converted Binary Number : 11 1000 0011 1010 1101
process begin
    a <= "1101";
    regsel <= '0';
    wait for 100ns;
    regsel <= '1';
    a <= "1010";
    wait for 100ns;
    a <= "0011";
    regsel <= '0';
    wait for 100ns;
    a <= "1000";
    regsel <= '1';
    wait for 100ns;
    a <= "0011";
    regsel <= '0';
    wait for 100ns;
end process;
end Behavioral;