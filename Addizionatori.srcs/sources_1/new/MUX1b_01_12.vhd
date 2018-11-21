----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2018 16:54:48
-- Design Name: 
-- Module Name: MUX1b_01_12 - Behavioral
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

entity MUX1b_01_12 is
  Port (    In1,In2,sel: in std_logic;
            SigOut: out std_logic);
end MUX1b_01_12;

architecture Behavioral of MUX1b_01_12 is

begin

SigOut<=In2 when (sel='1') else In1;

end Behavioral;
