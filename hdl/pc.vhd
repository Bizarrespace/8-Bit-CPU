-- Specify the libraries that you want to use
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Define 'pc' entity, represetning the high-level abstraction of the program counter
entity pc is 
    port(
        clk : in std_logic;
        reset : in std_logic;
        enable: in std_logic;
        load: in std_logic;
        input: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(3 downto 0)
    );
end entity;

-- Implement the behavior of the 'pc' entity
architecture behave of pc is
    -- Define a sgnal 'count' as a 4bit vector, starting with 0000
    signal count : std_logic_vector(3 downto 0) := "0000";
begin

    -- Process to handle clock and reset signal
    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0'); -- If reset is 1 then count becomes 0000
        elsif rising_edge(clk) then
            if load = '1' then -- If 'load' is '1', update 'count' with 'input'
                count <= input;
            elsif enable = '1' then -- If 'reset' is not 1, and 'enable' is 1, then count++
                count <= count + 1;
            end if;
        end if;
    end process;

    -- Assign the value of 'count' to the 'output' port
    output <= count;

end behave;
