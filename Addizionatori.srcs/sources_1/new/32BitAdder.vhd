----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 17:29:34
-- Design Name: 
-- Module Name: Carry_Ripple - Comportamentale
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

entity Adder32Bit is
 Port ( A,B: in std_logic_vector (31 downto 0);
        Cin,clk,reset,enable: in std_logic;
        S: out std_logic_vector (31 downto 0);
        Cout: out std_logic);
end Adder32Bit;

architecture Comportamentale of Adder32Bit is

component Full_Adder_Comportamentale
Port ( i2,i1,i0 : in std_logic;
         s,c : out std_logic );
end component;

component FF_Reset
    Port (  d,clk,reset,enable: in std_logic; --_vector (63 downto 0)
            q : out std_logic); --_vector (63 downto 0)
end component;

component FF_Reset_32
    Port (  d: in std_logic_vector (31 downto 0);
            clk,reset,enable: in std_logic;
            q : out std_logic_vector (31 downto 0));
end component;

signal sigA,sigB,sigS: std_logic_vector (31 downto 0);
signal SigCarry:std_logic_vector (32 downto 0);
signal sigCin,sigCout: std_logic;

begin

FFA:FF_Reset_32
port map (d=>A,clk=>clk,reset=>reset,enable=>enable,q=>SigA);

FFB:FF_Reset_32
port map (d=>B,clk=>clk,reset=>reset,enable=>enable,q=>SigB);

FFCin:FF_Reset
port map (d=>Cin,clk=>clk,reset=>reset,enable=>enable,q=>SigCin);
SigCin<=SigCarry(0);
Carry_Ripple: for i in 1 to 32 generate
    begin
        FA_CR: component Full_Adder_Comportamentale
        port map (i2=>sigA(i-1),i1=>sigB(i-1),i0=>sigCarry(i-1),s=>SigS(i-1),c=>sigCarry(i));    
end generate Carry_Ripple;
    
sigCout<=sigCarry(32);

FFS:FF_Reset_32
port map (d=>SigS,clk=>clk,enable=>enable,reset=>reset,q=>S);

FFCout:FF_Reset
port map (d=>sigCout,clk=>clk,enable=>enable,reset=>reset,q=>Cout);

end Comportamentale;
