----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2018 19:31:33
-- Design Name: 
-- Module Name: Full_Adder - F_A
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

entity Full_Adder_Comportamentale  is
  Port ( i2,i1,i0 : in std_logic;
         s,c : out std_logic );
end Full_Adder_Comportamentale;


architecture comportamentale of Full_Adder_Comportamentale is

component Half_Adder
Port (a,b : in std_logic;
  S,Carry : out std_logic);
end component;

signal int1,int2,int3 : std_logic; --segnali interni che non escono o entrano

begin

h1:Half_Adder -- label per ogni istanza del componente "h1" è il nome, poi si aggiunge il nome del componente
port map (a => i2, b => i1, S => int1, Carry =>int2);   -- la port map è l'associazione delle porte, nelle parentesi devo riportare il nome delle porte del componente

h2:Half_Adder
port map (a => int2, b=> i0, S=> int3, Carry => s); -- prende il nome di assegnazione esplicita. Il tipo implicito devi invece andare in ordine di assgnazione così come sono dichiarati nella porta.

--c <= int1 or int3; SOSTITUITO DA PROCESS
or_comp:process(int1,int3)
begin

if (int1='1' or int3='1') 
then c<='1';
else
c<='0';
end if;

end process;


end comportamentale;
