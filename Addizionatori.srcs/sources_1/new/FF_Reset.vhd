----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2018 15:14:52
-- Design Name: 
-- Module Name: FF_Reset - Comportamentale
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

entity FF_Reset is
  Port (d,clk,reset,enable: in std_logic; --_vector (63 downto 0)
  q : out std_logic); --_vector (63 downto 0)
end FF_Reset;

architecture Comportamentale of FF_Reset is

begin
process (clk,reset) -- nel sincrono posso rimuovere reset in quanto anch'esso dipende dal rise del clock
begin

--    if rising_edge(clk) then 
--        if (reset='1')
--        then q<= '0';
--        else
--        q<=d;
--        end if;
--    end if;

if (reset = '1')
then q <= '0'; -- (others =>'0');
    --then q<= x"0000000000000000";  -- ASINCRONO
elsif (rising_edge(clk) and enable='1') then  
    q<= d;
end if;


end process;

end Comportamentale;
