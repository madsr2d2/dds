
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
create_project: 2

00:00:062

00:00:062

1473.2772
36.8362
175352
24953Z17-722h px� 
q
Command: %s
53*	vivadotcl2@
>synth_design -top axi_bram_ctrl_0_synth -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7a100tcsg324-1Z21-9227h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
4Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
P
#Helper process launched with PID %s4824*oasys2	
1368910Z8-7075h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2250.781 ; gain = 412.715 ; free physical = 16468 ; free virtual = 23883
h px� 
�
synthesizing module '%s'638*oasys2
axi_bram_ctrl_0_synth2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
938@Z8-638h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
bufg_A2
BUFG2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
2598@Z8-113h px� 
�
synthesizing module '%s'638*oasys2
AXI_CHECKER2I
E/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_checker.vhd2
868@Z8-638h px� 
�
synthesizing module '%s'638*oasys2

DATA_GEN2F
B/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/data_gen.vhd2
908@Z8-638h px� 
R
%s
*synth2:
8	Parameter DATA_GEN_WIDTH bound to: 32 - type: integer 
h p
x
� 
N
%s
*synth26
4	Parameter DOUT_WIDTH bound to: 32 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter DATA_PART_CNT bound to: 1 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter SEED bound to: 2 - type: integer 
h p
x
� 
�
synthesizing module '%s'638*oasys2
RANDOM2D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-638h px� 
H
%s
*synth20
.	Parameter WIDTH bound to: 8 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter SEED bound to: 5 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RANDOM2
02
12D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
RANDOM__parameterized02D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-638h px� 
H
%s
*synth20
.	Parameter WIDTH bound to: 8 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter SEED bound to: 4 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RANDOM__parameterized02
02
12D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
RANDOM__parameterized12D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-638h px� 
H
%s
*synth20
.	Parameter WIDTH bound to: 8 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter SEED bound to: 3 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RANDOM__parameterized12
02
12D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
RANDOM__parameterized22D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-638h px� 
H
%s
*synth20
.	Parameter WIDTH bound to: 8 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter SEED bound to: 2 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RANDOM__parameterized22
02
12D
@/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/random.vhd2
878@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

DATA_GEN2
02
12F
B/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/data_gen.vhd2
908@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
AXI_CHECKER2
02
12I
E/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_checker.vhd2
868@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ABC_STIM_GEN2H
F/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_stim_gen.vhd2
752
ABC_STIM_GEN_INST2
ABC_STIM_GEN2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
3078@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ABC_STIM_GEN2J
F/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_stim_gen.vhd2
1118@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ABC_AXI_FULL_PROTOCOL_CHKR2Q
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_axi_protocol_chkr.vhd2
782
ABC_AXI_FULL_PROT_CHKER_INST2
ABC_AXI_FULL_PROTOCOL_CHKR2J
F/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_stim_gen.vhd2
5868@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ABC_AXI_FULL_PROTOCOL_CHKR2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_axi_protocol_chkr.vhd2
1058@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ABC_AXI_FULL_PROTOCOL_CHKR2
02
12S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_axi_protocol_chkr.vhd2
1058@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ABC_STIM_GEN2
02
12J
F/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/abc_stim_gen.vhd2
1118@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
axi_bram_ctrl_0_exdes2Q
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.vhd2
822

ABC_PORT2
axi_bram_ctrl_0_exdes2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
3678@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
axi_bram_ctrl_0_exdes2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.vhd2
1358@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
axi_bram_ctrl_02�
�/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/axi_bram_ctrl_0_ex.runs/synth_1/.Xil/Vivado-1368735-madsr2d2/realtime/axi_bram_ctrl_0_stub.vhdl2
62
ABC02
axi_bram_ctrl_02S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.vhd2
2678@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
axi_bram_ctrl_02�
�/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/axi_bram_ctrl_0_ex.runs/synth_1/.Xil/Vivado-1368735-madsr2d2/realtime/axi_bram_ctrl_0_stub.vhdl2
598@Z8-638h px� 
S
%s
*synth2;
9	Parameter MEMORY_SIZE bound to: 262144 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter MEMORY_PRIMITIVE bound to: block - type: string 
h p
x
� 
Z
%s
*synth2B
@	Parameter CLOCKING_MODE bound to: common_clock - type: string 
h p
x
� 
O
%s
*synth27
5	Parameter ECC_MODE bound to: no_ecc - type: string 
h p
x
� 
U
%s
*synth2=
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
h p
x
� 
X
%s
*synth2@
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
h p
x
� 
O
%s
*synth27
5	Parameter USE_MEM_INIT bound to: 1 - type: integer 
h p
x
� 
Y
%s
*synth2A
?	Parameter WAKEUP_TIME bound to: disable_sleep - type: string 
h p
x
� 
R
%s
*synth2:
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter WRITE_DATA_WIDTH_A bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH_A bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter BYTE_WRITE_WIDTH_A bound to: 8 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter ADDR_WIDTH_A bound to: 13 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
h p
x
� 
Q
%s
*synth29
7	Parameter READ_LATENCY_A bound to: 1 - type: integer 
h p
x
� 
X
%s
*synth2@
>	Parameter WRITE_MODE_A bound to: write_first - type: string 
h p
x
� 
V
%s
*synth2>
<	Parameter WRITE_DATA_WIDTH_B bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH_B bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter BYTE_WRITE_WIDTH_B bound to: 8 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter ADDR_WIDTH_B bound to: 13 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
h p
x
� 
Q
%s
*synth29
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
h p
x
� 
X
%s
*synth2@
>	Parameter WRITE_MODE_B bound to: write_first - type: string 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
xpm_memory_tdpram2F
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
90502
xpm_memory_tdpram_inst2
xpm_memory_tdpram2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.vhd2
3378@Z8-3491h px� 
�
synthesizing module '%s'%s4497*oasys2
xpm_memory_tdpram2
 2H
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
90508@Z8-6157h px� 
S
%s
*synth2;
9	Parameter MEMORY_SIZE bound to: 262144 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter MEMORY_PRIMITIVE bound to: block - type: string 
h p
x
� 
Z
%s
*synth2B
@	Parameter CLOCKING_MODE bound to: common_clock - type: string 
h p
x
� 
O
%s
*synth27
5	Parameter ECC_MODE bound to: no_ecc - type: string 
h p
x
� 
U
%s
*synth2=
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
h p
x
� 
X
%s
*synth2@
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
h p
x
� 
O
%s
*synth27
5	Parameter USE_MEM_INIT bound to: 1 - type: integer 
h p
x
� 
Y
%s
*synth2A
?	Parameter WAKEUP_TIME bound to: disable_sleep - type: string 
h p
x
� 
R
%s
*synth2:
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter WRITE_DATA_WIDTH_A bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH_A bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter BYTE_WRITE_WIDTH_A bound to: 8 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter ADDR_WIDTH_A bound to: 13 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
h p
x
� 
Q
%s
*synth29
7	Parameter READ_LATENCY_A bound to: 1 - type: integer 
h p
x
� 
X
%s
*synth2@
>	Parameter WRITE_MODE_A bound to: write_first - type: string 
h p
x
� 
V
%s
*synth2>
<	Parameter WRITE_DATA_WIDTH_B bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH_B bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter BYTE_WRITE_WIDTH_B bound to: 8 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter ADDR_WIDTH_B bound to: 13 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
h p
x
� 
Q
%s
*synth29
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
h p
x
� 
X
%s
*synth2@
>	Parameter WRITE_MODE_B bound to: write_first - type: string 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2
xpm_memory_base2
 2H
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
548@Z8-6157h px� 
�
Synth Info: %s 4384*oasys2�
�[XPM_MEMORY 20-2] MEMORY_INIT_FILE (none), MEMORY_INIT_PARAM together specify no memory initialization. Initial memory contents will be all 0's. 2H
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
5168@Z8-6059h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
xpm_memory_base2
 2
02
12H
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
548@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
xpm_memory_tdpram2
 2
02
12H
D/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2
90508@Z8-6155h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
axi_bram_ctrl_0_exdes2
02
12S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.vhd2
1358@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
axi_bram_ctrl_0_synth2
02
12S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
938@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
STIMULUS_FLOW_reg2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_synth.vhd2
3568@Z8-6014h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
sleep2
xpm_memory_baseZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
regcea2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectsbiterra2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectdbiterra2
xpm_memory_baseZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
clkb2
xpm_memory_baseZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
regceb2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectsbiterrb2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectdbiterrb2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[14]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[13]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[12]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[11]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[10]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[9]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[8]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[7]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[6]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[5]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[4]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[3]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[2]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[7]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[6]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[5]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[4]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[3]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[2]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWLEN[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WLAST2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[7]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[6]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[5]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[4]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[3]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[2]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARLEN[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RLAST2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_BRESP[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_BRESP[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_BVALID2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_BREADY2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[14]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[13]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[12]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[11]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[10]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[9]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[8]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[7]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[6]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[5]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[4]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[3]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[2]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RRESP[1]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RRESP[0]2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RVALID2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RREADY2
ABC_AXI_FULL_PROTOCOL_CHKRZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[31]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[30]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[29]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[28]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[27]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[26]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[25]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[24]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[23]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[22]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[21]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[20]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[19]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[18]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[17]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[16]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[15]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[14]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[13]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[12]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[11]2
ABC_STIM_GENZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[10]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[9]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[8]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[7]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[6]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[5]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[4]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[3]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[2]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[1]2
ABC_STIM_GENZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_RDATA[0]2
ABC_STIM_GENZ8-7129h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2353.719 ; gain = 515.652 ; free physical = 16355 ; free virtual = 23771
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2368.562 ; gain = 530.496 ; free physical = 16354 ; free virtual = 23770
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2368.562 ; gain = 530.496 ; free physical = 16354 ; free virtual = 23770
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012
00:00:00.012

2374.5002
0.0002
163502
23766Z17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/axi_bram_ctrl_0_ex.gen/sources_1/ip/axi_bram_ctrl_0/axi_bram_ctrl_0/axi_bram_ctrl_0_in_context.xdc2
ABC_PORT/ABC0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/axi_bram_ctrl_0_ex.gen/sources_1/ip/axi_bram_ctrl_0/axi_bram_ctrl_0/axi_bram_ctrl_0_in_context.xdc2
ABC_PORT/ABC0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2S
O/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/imports/axi_bram_ctrl_0_exdes.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2K
I/tools/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2)
'.Xil/axi_bram_ctrl_0_synth_propImpl.xdcZ1-236h px� 
Z
2%s XPM XDC files have been applied to the design.
665*project2
1Z1-1714h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2511.3122
0.0002
163412
23757Z17-722h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
 Constraint Validation Runtime : 2

00:00:002

00:00:002

2511.3122
0.0002
163412
23757Z17-722h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2511.312 ; gain = 673.246 ; free physical = 16342 ; free virtual = 23750
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16342 ; free virtual = 23750
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16342 ; free virtual = 23750
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
x
3inferred FSM for state register '%s' in module '%s'802*oasys2
CURRENT_STATE_reg2
ABC_STIM_GENZ8-802h px� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
RD_CURRENT_STATE_reg2
ABC_STIM_GENZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_          rd_wait_enable |                               00 |                               01
h p
x
� 
y
%s
*synth2a
_        rd_send_addr_cmd |                               01 |                               10
h p
x
� 
y
%s
*synth2a
_          rd_wait_rvalid |                               10 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
RD_CURRENT_STATE_reg2

sequential2
ABC_STIM_GENZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_             wait_enable |                               00 |                               01
h p
x
� 
y
%s
*synth2a
_           send_addr_cmd |                               01 |                               10
h p
x
� 
y
%s
*synth2a
_             wait_bvalid |                               10 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
CURRENT_STATE_reg2

sequential2
ABC_STIM_GENZ8-3354h px� 
�
�Block RAM (%s) originally specified as a Byte Wide Write Enable RAM cannot take advantage of ByteWide feature and is implemented with single write enable per RAM due to following reason.
(%s)4698*oasys22
0gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg2�
�address width (13) is more than optimal threshold of 12. Implementing using BWWE will require more logic and timing would be suboptimal. Please use attribute ram_decomp = power if BWWE is desired.Z8-6841h px� 
�
?The signal %s was recognized as a true dual port RAM template.
3473*oasys2E
C"xpm_memory_base:/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg"Z8-3971h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16342 ; free virtual = 23750
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 8     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 17    
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 17    
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
Y
%s
*synth2A
?	             256K Bit	(8192 X 32 bit)          RAMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 15    
h p
x
� 
F
%s
*synth2.
,	   2 Input   15 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 11    
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 17    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
regcea2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectsbiterra2
xpm_memory_baseZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
injectdbiterra2
xpm_memory_baseZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
clkb2
xpm_memory_baseZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16245 ; free virtual = 23743
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
R
%s*synth2:
8
Block RAM: Preliminary Mapping Report (see note below)
h px� 
�
%s*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|Module Name      | RTL Object                                       | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h px� 
�
%s*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|xpm_memory_base: | gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg | 8 K x 32(WRITE_FIRST)  | W | R | 8 K x 32(WRITE_FIRST)  | W | R | Port A and B     | 0      | 8      | 
h px� 
�
%s*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16285 ; free virtual = 23754
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16305 ; free virtual = 23731
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!
Block RAM: Final Mapping Report
h p
x
� 
�
%s
*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|Module Name      | RTL Object                                       | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h p
x
� 
�
%s
*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|xpm_memory_base: | gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg | 8 K x 32(WRITE_FIRST)  | W | R | 8 K x 32(WRITE_FIRST)  | W | R | Port A and B     | 0      | 8      | 
h p
x
� 
�
%s
*synth2�
�+-----------------+--------------------------------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_0_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_1_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_2_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_02
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_12
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2k
iABC_PORT/xpm_memory_tdpram_inst/xpm_memory_base_inst/gen_wr_b.gen_byte_narrow.for_mem_cols[1].mem_reg_3_12
BlockZ8-7052h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16305 ; free virtual = 23731
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!

Static Shift Register Report:
h p
x
� 
�
%s
*synth2�
�+----------------------+---------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|Module Name           | RTL Name                                          | Length | Width | Reset Signal | Pull out first Reg | Pull out last Reg | SRL16E | SRLC32E | 
h p
x
� 
�
%s
*synth2�
�+----------------------+---------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|axi_bram_ctrl_0_synth | SHIFT_GENERATE[15].iter_complete_indicate_reg[15] | 15     | 1     | NO           | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�+----------------------+---------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
?
%s
*synth2'
%+------+----------------+----------+
h p
x
� 
?
%s
*synth2'
%|      |BlackBox name   |Instances |
h p
x
� 
?
%s
*synth2'
%+------+----------------+----------+
h p
x
� 
?
%s
*synth2'
%|1     |axi_bram_ctrl_0 |         1|
h p
x
� 
?
%s
*synth2'
%+------+----------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
@
%s*synth2(
&+------+---------------------+------+
h px� 
@
%s*synth2(
&|      |Cell                 |Count |
h px� 
@
%s*synth2(
&+------+---------------------+------+
h px� 
@
%s*synth2(
&|1     |axi_bram_ctrl_0_bbox |     1|
h px� 
@
%s*synth2(
&|2     |BUFG                 |     1|
h px� 
@
%s*synth2(
&|3     |CARRY4               |    55|
h px� 
@
%s*synth2(
&|4     |LUT1                 |    11|
h px� 
@
%s*synth2(
&|5     |LUT2                 |   104|
h px� 
@
%s*synth2(
&|6     |LUT3                 |    18|
h px� 
@
%s*synth2(
&|7     |LUT4                 |    15|
h px� 
@
%s*synth2(
&|8     |LUT5                 |     9|
h px� 
@
%s*synth2(
&|9     |LUT6                 |    46|
h px� 
@
%s*synth2(
&|10    |RAMB36E1             |     8|
h px� 
@
%s*synth2(
&|11    |SRL16E               |     1|
h px� 
@
%s*synth2(
&|12    |FDRE                 |   329|
h px� 
@
%s*synth2(
&|13    |FDSE                 |    13|
h px� 
@
%s*synth2(
&|14    |IBUF                 |     2|
h px� 
@
%s*synth2(
&|15    |OBUF                 |     7|
h px� 
@
%s*synth2(
&+------+---------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.316 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 9 warnings.
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 2519.316 ; gain = 538.500 ; free physical = 16278 ; free virtual = 23727
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 2519.324 ; gain = 681.250 ; free physical = 16278 ; free virtual = 23727
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012

00:00:002

2519.3242
0.0002
165302
23979Z17-722h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
63Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
2Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2575.3442
0.0002
165662
24015Z17-722h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

a8f7a7beZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
712
1032
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
synth_design: 2

00:00:212

00:00:192

2575.3442

1087.2232
165712
24021Z17-722h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2

Physical2
PSS2=
;(MB): overall = 1950.247; main = 1606.983; forked = 368.825Z17-2834h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2	
Virtual2
VSS2>
<(MB): overall = 3551.570; main = 2575.348; forked = 1032.250Z17-2834h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write ShapeDB Complete: 2

00:00:002

00:00:002

2599.3552
0.0002
165682
24017Z17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
g/home/madsr2d2/DTU/dds/as2/axi_bram_ctrl_0_ex/axi_bram_ctrl_0_ex.runs/synth_1/axi_bram_ctrl_0_synth.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2u
sreport_utilization -file axi_bram_ctrl_0_synth_utilization_synth.rpt -pb axi_bram_ctrl_0_synth_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Oct 22 23:33:17 2024Z17-206h px� 


End Record