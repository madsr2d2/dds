
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
create_project: 2

00:00:052

00:00:052

1473.7112
77.8362
220542
29075Z17-722h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental /home/madsr2d2/DTU/dds/as2/as2_task_0/as2_task_0.srcs/utils_1/imports/synth_1/clock.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2Y
W/home/madsr2d2/DTU/dds/as2/as2_task_0/as2_task_0.srcs/utils_1/imports/synth_1/clock.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
e
Command: %s
53*	vivadotcl24
2synth_design -top testbench -part xc7a100tcsg324-1Z4-113h px� 
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
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
4Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
P
#Helper process launched with PID %s4824*oasys2	
1301804Z8-7075h px� 
�
%s*synth2�
�Starting Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1909.207 ; gain = 421.590 ; free physical = 21312 ; free virtual = 28334
h px� 
�
,shared variables must be of a protected type3878*oasys2P
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
278@Z8-4747h px� 
�
synthesizing module '%s'638*oasys2
	testbench2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
298@Z8-638h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2
extra waveform elements2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
828@Z8-312h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
clock2:
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/clock.vhd2
212
SysClk2
clock2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
1148@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
clock2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/clock.vhd2
318@Z8-638h px� 
|
%s
*synth2d
b	Parameter period bound to: 64'b0000000000000000000000000000000000000100110001001011010000000000 
h p
x
� 
�
&ignoring unsynthesizable construct: %s312*oasys2 
all but final waveform element2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/clock.vhd2
368@Z8-312h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
clock2
02
12<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/clock.vhd2
318@Z8-256h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
	base_addr2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
558@Z8-5640h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
acc2K
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
62
Accelerator2
acc2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
1208@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
acc2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
218@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sobel_filter_8bit2Y
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
62
sobel_filter_inst2
sobel_filter_8bit2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
968@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
sobel_filter_8bit2[
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
sobel_filter_8bit2
02
12[
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
138@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sobel_filter_8bit2Y
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
62
sobel_filter_inst2
sobel_filter_8bit2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
968@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sobel_filter_8bit2Y
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
62
sobel_filter_inst2
sobel_filter_8bit2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
968@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sobel_filter_8bit2Y
W/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/sobel_filter_8bit.vhd2
62
sobel_filter_inst2
sobel_filter_8bit2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
968@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ram_dp2N
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
52
line_buffer_inst2
ram_dp2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
1058@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ram_dp2P
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
238@Z8-638h px� 
N
%s
*synth26
4	Parameter DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
M
%s
*synth25
3	Parameter ADDR_WIDTH bound to: 7 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ram_dp2
02
12P
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
238@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ram_dp2N
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
52
line_buffer_inst2
ram_dp2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
1058@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ram_dp2N
L/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/ram_dp.vhd2
52
line_buffer_inst2
ram_dp2M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
1058@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
acc2
02
12M
I/home/madsr2d2/DTU/dds/as2/as2_task1/as2_task1.srcs/sources_1/new/acc.vhd2
218@Z8-256h px� 
}
%s
*synth2e
c	Parameter load_file_name bound to: /home/madsr2d2/DTU/dds/as2/as2_task_0/pic1.pgm - type: string 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
memory22<
:/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/memory2.vhd2
252
Memory2	
memory22<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
1338@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
memory22>
:/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/memory2.vhd2
448@Z8-638h px� 
}
%s
*synth2e
c	Parameter load_file_name bound to: /home/madsr2d2/DTU/dds/as2/as2_task_0/pic1.pgm - type: string 
h p
x
� 
�
(size mismatch in assignment; read failed4160*oasys2>
:/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/memory2.vhd2
678@Z8-5765h px� 
�
3mismatched array sizes in rhs and lhs of assignment421*oasys2>
:/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/memory2.vhd2
1068@Z8-421h px� 
�
failed synthesizing module '%s'285*oasys2	
memory22>
:/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/memory2.vhd2
448@Z8-285h px� 
�
failed synthesizing module '%s'285*oasys2
	testbench2<
8/home/madsr2d2/DTU/dds/as2/02203_A2_code/task2/test2.vhd2
298@Z8-285h px� 
�
%s*synth2�
�Finished Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 2068.176 ; gain = 580.559 ; free physical = 21143 ; free virtual = 28163
h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272
42
02
5Z4-41h px� 
<

%s failed
30*	vivadotcl2
synth_designZ4-43h px� 
N
Command failed: %s
69*common2
Vivado Synthesis failedZ17-69h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Fri Oct 25 15:07:43 2024Z17-206h px� 


End Record