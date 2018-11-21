----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 18:15:28
-- Design Name: 
-- Module Name: Carry_Ripple_TB - Behavioral
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

entity Carry_Ripple_TB is
--  Port ( );
end Carry_Ripple_TB;

architecture Behavioral of Carry_Ripple_TB is

component Adder32Bit
       port(A,B: in std_logic_vector (31 downto 0);
       Cin,clk,reset,enable: in std_logic;
       S: out std_logic_vector (31 downto 0);
       Cout: out std_logic);
end component;

signal A,B: std_logic_vector (31 downto 0);
signal Cin,clk,reset,enable: std_logic;
signal S: std_logic_vector (31 downto 0);
signal Cout: std_logic;

begin

LucaMacri: Adder32Bit
port map (A=>A,B=>B,Cin=>Cin,clk=>clk,reset=>reset,enable=>enable,S=>S,Cout=>Cout);

process
begin
wait for 10ns;
clk <= '0';
wait for 10ns;
clk<='1';
end process;


process
begin
reset<='0';
B<=x"00000000";
Cin<='0';
Enable<='1';
A<=(others=>'1');
wait for 100ns;
B<=x"00000001";
wait for 100ns;
end process;

end Behavioral;
