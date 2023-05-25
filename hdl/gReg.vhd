library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity reg is 
port(
    clk : in std_logic;
    reset : in std_logic;
    out_en : in std_logic;
    load : in std_logic;
    input : in std_logic_vector(7 downto 0);
    output : out std_logic_vector(7 downto 0);
    output_alu : out std_logic_vector(7 downto 0)
);

end entity;

architecture behave of reg is

    -- Make a signal called 'stored_value', has 8 bits starts at high precedence
    -- Reason for high precedence is to take care of the case of multiple devices driving the same signal
    -- All Z shows that none of the devices are driving a signal
signal stored_value : std_logic_vector(7 downto 0) :=(others => 'Z');

begin


process(clk, reset)
begin
    if reset = '1' then
        stored_value <= (others => 'Z');
    elsif rising_edge(clk) then
        if load = '1' then
            stored_value <= input;
        end if;
    end if;
end process;

-- Difference between output and 'output_alu' is that output only outputs data if 'out_en' is 1
-- 'Output_alu' always reflects the stored value
output <= stored_value when out_en = '1' else (others => 'Z');
output_alu <= stored_value;

end behave;