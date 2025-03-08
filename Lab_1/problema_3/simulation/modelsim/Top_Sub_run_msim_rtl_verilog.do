transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3 {C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3/Top_Sub.sv}
vlog -sv -work work +incdir+C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3 {C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3/TopDecoder.sv}

vlog -sv -work work +incdir+C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3 {C:/Users/josee/joscCE_JimF04_Sebas36762_digital_design_lab_2025/Lab_1/problema_3/tb_Top_Sub.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_Top_Sub

add wave *
view structure
view signals
run -all
