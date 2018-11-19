----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2018 17:00:53
-- Design Name: 
-- Module Name: Carry_Select_CellaBase - Behavioral
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

entity Carry_Select_CellaBase is
  Port ( A,B: in std_logic_vector (5 downto 0);
       Cin: in std_logic;
       S: out std_logic_vector (5 downto 0);
       Cout: out std_logic);
end Carry_Select_CellaBase;

architecture Behavioral of Carry_Select_CellaBase is

component Full_Adder_Comportamentale
Port ( i2,i1,i0 : in std_logic;
         s,c : out std_logic );
end component;

component MUX1b_01_12
Port (    In1,In2,sel: in std_logic;
            SigOut: out std_logic);
end component;

component MUX32b_01_12
Port (    In1,In2: in std_logic_vector (5 downto 0);
            sel:in std_logic;
            SigOut: out std_logic_vector (5 downto 0));
end component;

signal sigSDOWN,sigSTOP: std_logic_vector (5 downto 0);
signal SigCarryTOP, SigCarryDOWN:std_logic_vector (6 downto 0);
--signal sigCin,sigCout: std_logic;

begin

SigCarryTOP(0)<='1';
SigCarryDOWN(0)<='0';

Carry_Ripple_TOP: for i in 1 to 6 generate
    begin
    
        FA_CR: component Full_Adder_Comportamentale
            port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarryTOP(i-1),s=>SigSTOP(i-1),c=>sigCarryTOP(i));
    
    end generate Carry_Ripple_TOP;

Carry_Ripple_DOWN: for i in 1 to 6 generate
    begin
    
        FA_CR: component Full_Adder_Comportamentale
            port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarryDOWN(i-1),s=>SigSDOWN(i-1),c=>sigCarryDOWN(i));
    
    end generate Carry_Ripple_DOWN;
                
MUX_Carry: MUX1b_01_12
port map(In1=>SigCarryTOP(6),In2=>SigCarryDOWN(6),SigOut=>Cout,sel=>Cin);

MUX_Result:MUX32b_01_12
port map(In1=>SigSTOP,In2=>SigSDOWN,sel=>Cin,SigOut=>S);

end Behavioral;
