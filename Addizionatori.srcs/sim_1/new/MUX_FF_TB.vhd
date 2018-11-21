----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 12:12:15
-- Design Name: 
-- Module Name: MUX_FF_TB - Behavioral
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

entity MUX_FF_TB is
--  Port ( );
end MUX_FF_TB;

architecture Behavioral of MUX_FF_TB is

component MUX_FF
  Port (uno,due,selezione,enable,reset,clk: in std_logic;
        uscita:out std_logic );
end component;

signal uno,due,selezione,enable,reset,clk:std_logic;

begin

TB:MUX_FF
port map(uno,due,selezione,enable,reset,clk);

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
selezione<='0';
wait for 50ns;
selezione<='1';
wait for 35ns;
end process;

end Behavioral;
