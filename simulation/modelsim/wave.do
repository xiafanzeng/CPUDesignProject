onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /the_tb/ADDsel_tb
add wave -noupdate /the_tb/PCout_tb
add wave -noupdate /the_tb/MDRout_tb
add wave -noupdate /the_tb/read_tb
add wave -noupdate /the_tb/Zlowout_tb
add wave -noupdate /the_tb/IncPC_tb
add wave -noupdate /the_tb/R2out_tb
add wave -noupdate /the_tb/R3out_tb
add wave -noupdate /the_tb/Yin_tb
add wave -noupdate /the_tb/Zin_tb
add wave -noupdate /the_tb/IRin_tb
add wave -noupdate /the_tb/R0in_tb
add wave -noupdate /the_tb/R1in_tb
add wave -noupdate /the_tb/R2in_tb
add wave -noupdate /the_tb/R3in_tb
add wave -noupdate /the_tb/MDRin_tb
add wave -noupdate /the_tb/MARin_tb
add wave -noupdate /the_tb/PCin_tb
add wave -noupdate /the_tb/Mdatain_tb
add wave -noupdate /the_tb/Clock_tb
add wave -noupdate /the_tb/Present_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {256 ns}