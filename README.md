# 8-Bit-CPU

# Program Counter


pc.vhd & pc_tb.vhd


Showing all the signals at 0 and count at 0
![Signals0](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/91becdc6-955c-4e43-a343-66098d07e2c0)

Showing the count vector working
![Counting](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/b7590e5c-d03f-4f64-a2b6-4eacd4f44324)

Showing the reset working, making count 0 again
![reset1](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/f355c811-5702-4307-81e3-26a2dbd7f5ce)

Showing reset signal flipped to 0, and the counting starting again
![reset0,counting](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/a800da23-feb9-41ae-ad16-6ca15bc053e1)


# General Purpose Register

gReg.vhd & gReg_tb.vhd


Showing that when load is 1, output ALU as set the value in input
![gReg_ShowingLoad1OutputALUHasValue](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/13326e7c-c631-4310-9a06-0da85f6974cf)

Showing that when Output_en is 1 the value of input only then gets put into output
![gReg_out_en1outputRegValue](https://github.com/Bizarrespace/8-Bit-CPU/assets/78052960/d8e92bbd-7c82-4f47-8363-47fa1d6a2879)
