library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu_fsd is
 port( op1, op2 : in std_logic_vector(11 downto 0);
 opmode : in std_logic_vector(3 downto 0);
 z, cout, ov: out std_logic;
 outalu : out std_logic_vector(11 downto 0)
 );
end alu_fsd;

architecture vinicius_de_borba of alu_fsd is
 signal aa, bb, soma, outalu_interno: std_logic_vector(11 downto 0) ;
 signal mode: std_logic ;
begin
 outalu <= outalu_interno;
 z <= '1' when outalu_interno = x"000" else '0';

 mode <= '0' when opmode=4 or opmode=6 else '1';
 aa <= x"000" when opmode=8 else op1;
 bb <= x"000" when opmode=6 else op2;
 
 sb: entity work.soma_sub
 generic map(12)
 port map( a=> aa, b=> bb, mode=>mode, S=> soma, cout=> cout, ov=>ov);
 
 outalu_interno <=
 op1 and op2 when opmode=0 else
 op1 or op2 when opmode=1 else
 op1 xnor op2 when opmode=2 else
 not op1 when opmode=3 else
 to_StdLogicVector( to_bitvector(op1) sll 1 ) when opmode=7 else
 soma;
end vinicius_de_borba;
