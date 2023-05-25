library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity pc_tb is 
    
end entity;
    -- Entity declaration for the testbench
architecture behave of pc_tb is

    -- Declaration of componenet 'pc' used in the testbench
    component pc is 
    port(
            clk : in std_logic;
            reset : in std_logic;
            enable: in std_logic;
            load: in std_logic;
            input: in std_logic_vector(3 downto 0);
            output: out std_logic_vector(3 downto 0)
        );

    end component;

    -- Creating our signals and constant clock period used in testbench
    signal clk_sig : std_logic;
    signal reset_sig : std_logic;
    signal enable_sig : std_logic;
    signal load_sig : std_logic;
    signal input_sig : std_logic_vector(3 downto 0);
    signal output_sig : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;
begin

    -- Instantiate 'pc' entity as 'pc1' and connect its ports to signals
    pc1 : pc port map (
            clk => clk_sig,
            reset => reset_sig,
            enable => enable_sig,
            load => load_sig,
            input => input_sig,
            output => output_sig
        );

    -- Process for making a clock signal with a specific period
    process
    begin

        clk_sig <= '0';
        wait for clk_period/2;
        clk_sig <= not clk_sig;
        wait for clk_period/2;

    end process;


    -- Process for setting/resetting 'reset', 'enable', and 'load' signals
    -- to observe counter behavior
    process
    begin

        reset_sig <= '0';
        enable_sig <= '0';
        load_sig <= '0';
        wait for clk_period*5;
        enable_sig <= '1';
        wait for clk_period*5;
        enable_sig <= '0';
        reset_sig <= '1';
        wait for clk_period;
        enable_sig <= '1';
        reset_sig <= '0';
        wait;
    end process;

end behave;