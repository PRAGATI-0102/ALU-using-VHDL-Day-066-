library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_BEHAV is
    port (
        A : in std_logic_vector(3 downto 0); 
		  B : in std_logic_vector(3 downto 0);
		  S : in std_logic_vector(1 downto 0);
        Y : out std_logic_vector(7 downto 0)               
    );
end ALU_BEHAV;

architecture behavioral of ALU_BEHAV is

	 --concatenation
	 
    function concat(A, B : std_logic_vector(3 downto 0)) return std_logic_vector is
			  
		begin
	 
			return A & B;
			
	 end function;
	 
	 
	 --subtraction
	 
	 function subtract(A, B : signed(3 downto 0)) return signed is
		
		variable A_EX, B_EX : signed(4 downto 0);
			  
		begin
			
			A_EX := '0' & A;
			B_EX := '0' & B;
	
			return A_EX - B_EX;
			
			
			
	 end function;
	 
	 --XOR Function
	 
	 function XOR_func(A, B : std_logic_vector(3 downto 0)) return std_logic_vector is
			  
		begin
	 
			return A xor B;
			
	 end function;
	 
	 --multiplication
	 
	 function A2(A : std_logic_vector(3 downto 0)) return std_logic_vector is
			  
		begin
	 
			return A(3 downto 0) & "0";
			
	 end function;

      

begin
    process (A, B, S)
	 
		variable temp : signed (4 downto 0);
		
		begin
		
			case S is
			
				when "00" =>
				
						Y <= concat(A,B);
						
				when "01" =>
				
						temp := subtract(signed(A),signed(B));
						
						Y <= std_logic_vector(temp(4) & temp(4) & temp(4) & temp(4 downto 0));
						
				when "10" =>
				
						Y <= "0000" & XOR_func(A,B);
				
				when "11" =>
				
						Y <= "000" & A2(A);
						
				when others =>
				
						Y <= (others => '0');
			
			end case;

    end process;
end behavioral;
