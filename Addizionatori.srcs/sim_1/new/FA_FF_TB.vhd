----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 12:50:24
-- Design Name: 
-- Module Name: FA_FF_TB - Behavioral
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

entity FA_FF_TB is
--  Port ( );
end FA_FF_TB;

architecture Behavioral of FA_FF_TB is

component FA_FF 
  Port (zero,uno,due,clk,reset,enable:in std_logic;
        result,carry:out std_logic );
end component;

signal zero,uno,due,clk,reset,enable,result,carry: std_logic;

begin

TB:FA_FF
port map(zero,uno,due,clk,reset,enable,result,carry);

process
begin
clk<='1';
wait for 10ns;
clk<='0';
wait for 10ns;
end process;

uno<='1';
due<='0';
enable<='1';
reset<='0';

process
begin

zero<='1';
wait for 20ns;
zero<='0';
wait for 15ns;
end process;

end Behavioral;
