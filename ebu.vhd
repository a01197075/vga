library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity VGA is
port(clk50_in : in std_logic;         
       red       : out std_logic;         
       green     : out std_logic;
       blue     : out std_logic;
       hs_out   : out std_logic;         
       vs_out   : out std_logic);      
end VGA;
 
architecture Behavioral of VGA is
 
signal clk25             : std_logic;
signal hs : std_logic_vector (9 downto 0);
signal vs : std_logic_vector (9 downto 0);
begin
 
-- generate a 25Mhz clock
process (clk50_in)
begin
if clk50_in'event and clk50_in='1' then
if (clk25 = '0') then              
 
clk25 <= '1';
else
clk25 <= '0';
end if;
end if;
end process;

process (clk25)
begin
if clk25'event and clk25 = '1' then
--Comienza el dibujo, a aprtir de esto es lo que van a cambiar


if hs >= "0010010011" and hs <= "0011100101" and vs >= "0000000001" and vs <= "0111100100" then
red <= '1' ;
blue <= '0';
green <= '0';

elsif hs >= "0101100011" and hs <= "0101101101" and vs >= "0000000001" and vs <= "0111100100" then
red <= '1' ;
blue <= '0';
green <= '0';

elsif hs >= "0010010011" and hs <= "1011010000" and vs >= "0011101011" and vs <= "0011110101" then
red <= '1' ;
blue <= '0';
green <= '0';

elsif hs >= "0011100110" and hs <= "1011010000" and vs >= "0000000001" and vs <= "0001010010" then
red <= '1' ;
blue <= '0';
green <= '0';

elsif hs >= "0011100110" and hs <= "1011010000" and vs >= "0001010011" and vs <= "0110010010" then
red <= '0' ;
blue <= '1' ;
green <= '0' ;
elsif hs >= "0011100110" and hs <= "1011010000" and vs >= "0110010011" and vs <= "0111100100" then
red <= '1' ;
blue <= '0';
green <= '0';
elsif hs >= "1011010001" and hs <= "1100100000" and vs >= "0000000001" and vs <= "0111100100" then
red <= '1' ;
blue <= '0';
green <= '0';
else
red <= '0' ;
blue <= '0';
green <= '0' ;
end if;
--Termina el dibujo (cambiar hasta aqui al otro if pasado)
if (hs > "0000000000" )
and (hs < "0001100001" ) 
then
hs_out <= '0';
else
hs_out <= '1';
end if;

if (vs > "0000000000" )
and (vs < "0000000011" )
then
vs_out <= '0';
else
vs_out <= '1';
end if;
hs <= hs + "0000000001" ;
if (hs= "1100100000") then    
vs <= vs + "0000000001";       
hs <= "0000000000";
end if;
if (vs= "1000001001") then                 
vs <= "0000000000";
end if;
end if;
end process;
end Behavioral;
