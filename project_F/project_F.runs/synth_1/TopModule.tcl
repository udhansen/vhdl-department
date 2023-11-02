# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-30058-n-62-30-8/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /zhome/d1/3/146501/DSproject/project_F/project_F.cache/wt [current_project]
set_property parent.project_path /zhome/d1/3/146501/DSproject/project_F/project_F.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo /zhome/d1/3/146501/DSproject/project_F/project_F.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/7segdriver.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/ALU.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/D_FF_AsyR_En.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/Datapath.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/Debounce.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/DestinationDecoder.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/DivClk.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/FDEC.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/FULL_ADDER_8BIT.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/FunctionUnit.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/InstructionDecoder.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/InstructionRegister.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/Logic_Circ.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/decoder4x16.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/en_32_to_1.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUX16x8.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUX2x1.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUX3x1.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUX8x2x1.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUXF.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUXM.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUXMR.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MUX_2_1.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/MicroController.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/NegZero.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/PortReg8x8.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/ProgramCounter.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/RAM256x16.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/Register16.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/RegisterFile.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/Shifter.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/SignExtender.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/ZeroFiller.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/ZeroFiller2.vhd
  /zhome/d1/3/146501/DSproject/project_F/project_F.srcs/sources_1/new/TopModule.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /zhome/d1/3/146501/DSproject/Nexys_4_DDR_Master.xdc
set_property used_in_implementation false [get_files /zhome/d1/3/146501/DSproject/Nexys_4_DDR_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top TopModule -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TopModule.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TopModule_utilization_synth.rpt -pb TopModule_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
