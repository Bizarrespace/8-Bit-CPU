library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity reg_tb is 
    
end entity;
    -- Entity declaration for the testbench
architecture behave of reg_tb is

    -- Declaration of component 'reg' used in the testbench
    component reg is 
    port(
        clk : in std_logic;
        reset : in std_logic;
        out_en : in std_logic;
        load : in std_logic;
        input : in std_logic_vector(7 downto 0);
        output : out std_logic_vector(7 downto 0);
        output_alu : out std_logic_vector(7 downto 0)
    );

    end component;

    -- Creating our signals and constant clock period used in testbench
    signal clk_sig : std_logic;
    signal reset_sig : std_logic;
    signal out_en_sig : std_logic;
    signal load_sig : std_logic;
    signal input_sig : std_logic_vector(7 downto 0);
    signal output_sig : std_logic_vector(7 downto 0);
    signal output_alu_sig : std_logic_vector(7 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instantiate 'reg' entity as 'reg1' and connect its ports to signals
    reg1 : reg port map (
            clk => clk_sig,
            reset => reset_sig,
            out_en => out_en_sig,
            load => load_sig,
            input => input_sig,
            output => output_sig,
            output_alu => output_alu_sig
        );

    -- Process for making a clock signal with a specific period, starting at 0 waiting for half a period then 1
    process
    begin

        clk_sig <= '0';
        wait for clk_period/2;
        clk_sig <= not clk_sig;
        wait for clk_period/2;

    end process;


    -- Process for setting/resetting signals to observe register behavior
    process
    begin

        reset_sig <= '0';
        out_en_sig <= '0';
        load_sig <= '0';
        wait for clk_period*5;
        input_sig <= "00100010";
        load_sig <= '1';
        wait for clk_period;
        load_sig <= '0';
        wait for clk_period;
        out_en_sig <= '1';
        wait for clk_period;
        out_en_sig <= '0';
        wait;
    
    end process;

end behave;