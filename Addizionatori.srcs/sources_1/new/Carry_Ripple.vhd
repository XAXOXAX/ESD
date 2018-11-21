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

entity Carry_Ripple_8 is
 Port ( A,B: in std_logic_vector (7 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector (7 downto 0);
        Cout: out std_logic);
end Carry_Ripple_8;

architecture Comportamentale of Carry_Ripple_8 is

component Full_Adder_Comportamentale
Port ( i2,i1,i0 : in std_logic;
         s,c : out std_logic );
end component;

signal sigA,sigB,sigS: std_logic_vector (7 downto 0);
signal SigCarry:std_logic_vector (8 downto 0);
signal sigCin,sigCout: std_logic;

begin

SigCarry(0)<=Cin;

Carry_Ripple: for i in 1 to 8 generate
    begin
    
        FA_CR: component Full_Adder_Comportamentale
            port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarry(i-1),s=>S(i-1),c=>sigCarry(i));
    
--    First: if i=1 generate 
--    begin
--        FA_CR: component Full_Adder_Comportamentale
--        port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarry(i-1),s=>S(i-1),c=>sigCarry(i));    
--    end generate First;
    
--    Middle: if ((i>1) and (i<32)) generate 
--        begin
--            FA_CR: component Full_Adder_Comportamentale
--            port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarry(i-1),s=>S(i-1),c=>sigCarry(i));    
--    end generate Middle;
     
--    Last: if i=32 generate 
--        begin
--            FA_CR: component Full_Adder_Comportamentale
--            port map (i2=>A(i-1),i1=>B(i-1),i0=>sigCarry(i-1),s=>S(i-1),c=>sigCarry(i));    
--    end generate Last;
    
end generate Carry_Ripple;
    
Cout<=sigCarry(8);

end Comportamentale;
