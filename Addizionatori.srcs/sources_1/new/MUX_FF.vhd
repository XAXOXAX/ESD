----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 12:01:34
-- Design Name: 
-- Module Name: MUX_FF - Behavioral
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

entity MUX_FF is
  Port (uno,due,selezione,enable,reset,clk: in std_logic;
        uscita:out std_logic );
end MUX_FF;

architecture Behavioral of MUX_FF is

component FF_Reset
    Port (  d,clk,reset,enable: in std_logic; --_vector (63 downto 0)
            q : out std_logic); --_vector (63 downto 0)
end component;

component MUX1b_01_12 
  Port (    In1,In2,sel: in std_logic;
            SigOut: out std_logic);
end component;

signal int1,int2,sigsel,out1: std_logic;

begin
Start1:FF_Reset
port map(d=>uno,clk=>clk,reset=>reset,enable=>enable,q=>int1);

Start2:FF_Reset
port map(d=>due,clk=>clk,reset=>reset,enable=>enable,q=>int2);

Sel:FF_Reset
port map(d=>selezione,clk=>clk,reset=>reset,enable=>enable,q=>sigsel);

MUX:MUX1b_01_12
port map (In1=>int1,In2=>Int2,sel=>sigsel,SigOut=>out1);

End1:FF_Reset
port map(d=>out1,clk=>clk,reset=>reset,enable=>enable,q=>uscita);


end Behavioral;
