----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 12:41:54
-- Design Name: 
-- Module Name: FA_FF - Behavioral
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

entity FA_FF is
  Port (zero,uno,due,clk,reset,enable:in std_logic;
        result,carry:out std_logic );
end FA_FF;

architecture Behavioral of FA_FF is

component FF_Reset
    Port (  d,clk,reset,enable: in std_logic;
            q : out std_logic); 
end component;

component Full_Adder_Comportamentale  
  Port ( i2,i1,i0 : in std_logic;
         s,c : out std_logic );
end component;

signal int0,int1,int2,intS,intC: std_logic;

begin

Start0:FF_Reset
port map(d=>zero,clk=>clk,reset=>reset,enable=>enable,q=>int0);

Start1:FF_Reset
port map(d=>uno,clk=>clk,reset=>reset,enable=>enable,q=>int1);

Start2:FF_Reset
port map(d=>due,clk=>clk,reset=>reset,enable=>enable,q=>int2);

ADD:Full_Adder_Comportamentale
port map(i2=>int2,i1=>int1,i0=>int0,s=>intS,c=>intC);

EndS:FF_Reset
port map(d=>IntS,clk=>clk,reset=>reset,enable=>enable,q=>result);

EndC:FF_Reset
port map(d=>IntC,clk=>clk,reset=>reset,enable=>enable,q=>carry);

end Behavioral;
