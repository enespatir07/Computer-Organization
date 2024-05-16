transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/adder_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/sub_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/and_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/or_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/xor_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/mux_8x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/nor_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/mod_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/slt_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/alu_32.v}

vlog -vlog01compat -work work +incdir+C:/Users/abdul/OneDrive/HW2/files {C:/Users/abdul/OneDrive/HW2/files/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
