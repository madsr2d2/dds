transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+axi_bram_ctrl_0  -L xpm -L axi_bram_ctrl_v4_1_10 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.axi_bram_ctrl_0 xil_defaultlib.glbl

do {axi_bram_ctrl_0.udo}

run

endsim

quit -force
