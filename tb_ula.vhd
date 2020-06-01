library ieee,work;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture a1 of tb is 

   signal op1, op2, outalu: std_logic_vector(11 downto 0);
   signal z, cout, ov  : std_logic;
   signal opmode : std_logic_vector(3 downto 0);

 begin

    op1 <= x"A03", x"C51" after 500 ns;
    op2 <= x"037", x"E39" after 500 ns;
    opmode <= "0000";
    --opmode <= "0001";
    --opmode <= "0010";
    --opmode <= "0011";
    --opmode <= "0100";
    --opmode <= "0101";
    --opmode <= "0110";
    --opmode <= "0111";
    --opmode <= "1000";

    sb: entity work.alu_fsd
             port map( op1=> op1, op2=> op2, outalu=>outalu, z=>z, cout=>cout, ov=>ov, opmode=>opmode);   
        
end architecture;


