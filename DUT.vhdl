-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
-- ALU_BEHAV.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(9 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component ALU_BEHAV is
port (
        A : in std_logic_vector(3 downto 0); 
		  B : in std_logic_vector(3 downto 0);
		  S : in std_logic_vector(1 downto 0);
        Y : out std_logic_vector(7 downto 0)               
    );
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: ALU_BEHAV 
			port map (
					

					S(1)   => input_vector(9),
					S(0)   => input_vector(8),
					
					A(3)   => input_vector(7),
					A(2)   => input_vector(6),
					A(1)   => input_vector(5),
					A(0)   => input_vector(4),
					
					B(3)   => input_vector(3),
					B(2)   => input_vector(2),
					B(1)   => input_vector(1),
					B(0)   => input_vector(0),
					
					
					Y(7)   => output_vector(7),
					Y(6)   => output_vector(6),
					Y(5)   => output_vector(5),
					Y(4)   => output_vector(4),
					
					Y(3)   => output_vector(3),
					Y(2)   => output_vector(2),
					Y(1)   => output_vector(1),
					Y(0)   => output_vector(0));

end DutWrap;

