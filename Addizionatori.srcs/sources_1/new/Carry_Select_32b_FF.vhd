----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 13:13:29
-- Design Name: 
-- Module Name: Carry_Select_32b_FF - Behavioral
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

entity Carry_Select_32b_FF is
  Port (Input1,Input2:in std_logic_vector (31 downto 0);
        InputCin,clk,reset,enable:in std_logic;
        OutputS:out std_logic_vector (31 downto 0);
        OutputCout:out stD_logic);
end Carry_Select_32b_FF;

architecture Behavioral of Carry_Select_32b_FF is

component FF_Reset
    Port (  d,clk,reset,enable: in std_logic;
            q : out std_logic);
end component;

component FF_Reset_32
    Port (  d: in std_logic_vector (31 downto 0);
            clk,reset,enable: in std_logic;
            q : out std_logic_vector (31 downto 0));
end component;

component Carry_Select_CellaBase
  Port ( A,B: in std_logic_vector (7 downto 0);
       Cin: in std_logic;
       S: out std_logic_vector (7 downto 0);
       Cout: out std_logic);
end component;

component Carry_Ripple_8 is
 Port ( A,B: in std_logic_vector (7 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector (7 downto 0);
        Cout: out std_logic);
end component;

signal Int1,int2,OutS: std_logic_vector (31 downto 0);
signal IntC:std_logic;
signal SigC:std_logic_vector (3 downto 0);

begin

FFIn1: FF_Reset_32
port map (d=>Input1,clk=>clk,reset=>reset,enable=>enable,q=>Int1);

FFIn2: FF_Reset_32
port map (d=>Input2,clk=>clk,reset=>reset,enable=>enable,q=>Int2);

FFInC:FF_Reset
port map (d=>InputCin,clk=>clk,reset=>reset,enable=>enable,q=>IntC);

CarryRipple1: Carry_Ripple_8
port map(A=>Input1 (31 downto 24),B=>Input2 (31 downto 24),Cin=>IntC,S=>OutS(31 downto 24),Cout=>SigC(0));

GliAltri: for i in 1 to 3 generate
    begin
        CarryRipplei: component Carry_Select_CellaBase
        port map (A=>Input1((i*8-1) downto (i-1)*8),B=>Input2((i*8-1) downto (i-1)*8),Cin=>SigC(i-1),S=>OutS((i*8-1) downto (i-1)*8),Cout=>SigC(i));    
end generate GliAltri;

FFOutS:FF_Reset_32
port map (d=>OutS,clk=>clk,reset=>reset,enable=>enable,q=>OutputS);

FFOutC:FF_Reset
port map (d=>SigC(3),clk=>clk,reset=>reset,enable=>enable,q=>OutputCout);

end Behavioral;
