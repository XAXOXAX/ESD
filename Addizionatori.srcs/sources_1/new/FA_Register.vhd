----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 17:01:07
-- Design Name: 
-- Module Name: FA_Register - Portmap
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

entity FA_Register is
  Port (A,B,Cin,clk,reset,enable: in std_logic;
        Sout,Cout : out std_logic );
end FA_Register;

architecture Portmap of FA_Register is

component FF_Input_64
Port (d,clk,reset,enable: in std_logic; --_vector (63 downto 0)
  q : out std_logic); --_vector (63 downto 0)
end component;

component FF_Output_65
Port (d,clk,reset,enable: in std_logic; --_vector (63 downto 0)
  q : out std_logic); --_vector (63 downto 0)
end component;

component Full_Adder_Comportamentale
Port ( i2,i1,i0: in std_logic;
         s,c: out std_logic );
end component;

signal sigA,sigB,sigC,sigS,sigCout : std_logic;

begin

InputA:FF_Input_64
port map (d=>A,clk=>clk,reset=>reset,enable=>enable,q=>sigA);

InputB:FF_Input_64
port map (d=>B,clk=>clk,reset=>reset,enable=>enable,q=>sigB);

InputCin:FF_Input_64
port map (d=>Cin,clk=>clk,reset=>reset,enable=>enable,q=>sigC);

OutputS:FF_Output_65
port map (d=>sigCout,clk=>clk,reset=>reset,enable=>enable,q=>Cout);

OutputCout:FF_Output_65
port map (d=>sigS,clk=>clk,reset=>reset,enable=>enable,q=>Sout);


end Portmap;
