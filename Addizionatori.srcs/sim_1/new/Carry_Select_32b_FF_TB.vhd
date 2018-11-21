----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 14:07:50
-- Design Name: 
-- Module Name: Carry_Select_32b_FF_TB - Behavioral
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

entity Carry_Select_32b_FF_TB is
--  Port ( );
end Carry_Select_32b_FF_TB;

architecture Behavioral of Carry_Select_32b_FF_TB is

component Carry_Select_32b_FF 
  Port (Input1,Input2:in std_logic_vector (31 downto 0);
        InputCin,clk,reset,enable:in std_logic;
        OutputS:out std_logic_vector (31 downto 0);
        OutputCout:out stD_logic);
end component;

signal Input1,Input2,OutputS: std_logic_vector (31 downto 0);
signal InputCin,clk,reset,enable,OutputCout: std_logic;

begin

DUT:Carry_Select_32b_FF
port map (Input1,Input2,InputCin,clk,reset,enable,OutputS,OutputCout);

process
begin
clk<='1';
wait for 10ns;
clk<='0';
wait for 10ns;
end process;

Input1<=x"FFFFFFFF";
Input2<=x"00000001";
enable<='1';
reset<='0';
InputCin<='0';

--process
--begin
--wait for 300ns;
--Input2<=x"00000000";
--wait for 300ns;

--end process;




end Behavioral;
