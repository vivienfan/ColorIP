
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ColorDetect, ColorDetect, ColorDetect, ColorDetect

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set COLOR_BLUE [ create_bd_port -dir I -from 1 -to 0 COLOR_BLUE ]
  set COLOR_GREEN [ create_bd_port -dir I -from 1 -to 0 COLOR_GREEN ]
  set COLOR_RED [ create_bd_port -dir I -from 1 -to 0 COLOR_RED ]
  set COLOR_YELLOW [ create_bd_port -dir I -from 1 -to 0 COLOR_YELLOW ]
  set COORD_BLUE [ create_bd_port -dir O -from 31 -to 0 COORD_BLUE ]
  set COORD_GREEN [ create_bd_port -dir O -from 31 -to 0 COORD_GREEN ]
  set COORD_RED [ create_bd_port -dir O -from 31 -to 0 COORD_RED ]
  set COORD_YELLOW [ create_bd_port -dir O -from 31 -to 0 COORD_YELLOW ]
  set EN [ create_bd_port -dir I EN ]
  set READY_BLUE [ create_bd_port -dir O READY_BLUE ]
  set READY_GREEN [ create_bd_port -dir O READY_GREEN ]
  set READY_RED [ create_bd_port -dir O READY_RED ]
  set READY_YELLOW [ create_bd_port -dir O READY_YELLOW ]
  set RESET [ create_bd_port -dir I -type rst RESET ]

  # Create instance: ColorDetect_Blue, and set properties
  set block_name ColorDetect
  set block_cell_name ColorDetect_Blue
  if { [catch {set ColorDetect_Blue [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ColorDetect_Blue eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ColorDetect_Green, and set properties
  set block_name ColorDetect
  set block_cell_name ColorDetect_Green
  if { [catch {set ColorDetect_Green [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ColorDetect_Green eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ColorDetect_Red, and set properties
  set block_name ColorDetect
  set block_cell_name ColorDetect_Red
  if { [catch {set ColorDetect_Red [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ColorDetect_Red eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ColorDetect_Yellow, and set properties
  set block_name ColorDetect
  set block_cell_name ColorDetect_Yellow
  if { [catch {set ColorDetect_Yellow [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ColorDetect_Yellow eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ROM, and set properties
  set ROM [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 ROM ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Coe_File {rom_data.coe} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Load_Init_File {true} \
CONFIG.Memory_Type {Single_Port_ROM} \
CONFIG.Port_A_Write_Rate {0} \
CONFIG.Read_Width_A {24} \
CONFIG.Read_Width_B {24} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {14400} \
CONFIG.Write_Width_A {24} \
CONFIG.Write_Width_B {24} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $ROM

  # Create port connections
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins ColorDetect_Blue/CLK] [get_bd_pins ColorDetect_Green/CLK] [get_bd_pins ColorDetect_Red/CLK] [get_bd_pins ColorDetect_Yellow/CLK] [get_bd_pins ROM/clka]
  connect_bd_net -net COLOR_1 [get_bd_ports COLOR_RED] [get_bd_pins ColorDetect_Red/COLOR]
  connect_bd_net -net COLOR_1_1 [get_bd_ports COLOR_GREEN] [get_bd_pins ColorDetect_Green/COLOR]
  connect_bd_net -net COLOR_2_1 [get_bd_ports COLOR_BLUE] [get_bd_pins ColorDetect_Blue/COLOR]
  connect_bd_net -net COLOR_3_1 [get_bd_ports COLOR_YELLOW] [get_bd_pins ColorDetect_Yellow/COLOR]
  connect_bd_net -net ColorDetect_Blue_COORDINATE [get_bd_ports COORD_BLUE] [get_bd_pins ColorDetect_Blue/COORDINATE]
  connect_bd_net -net ColorDetect_Blue_READY [get_bd_ports READY_BLUE] [get_bd_pins ColorDetect_Blue/READY]
  connect_bd_net -net ColorDetect_Green_COORDINATE [get_bd_ports COORD_GREEN] [get_bd_pins ColorDetect_Green/COORDINATE]
  connect_bd_net -net ColorDetect_Green_READY [get_bd_ports READY_GREEN] [get_bd_pins ColorDetect_Green/READY]
  connect_bd_net -net ColorDetect_Red_ADDR [get_bd_pins ColorDetect_Red/ADDR] [get_bd_pins ROM/addra]
  connect_bd_net -net ColorDetect_Red_COORDINATE [get_bd_ports COORD_RED] [get_bd_pins ColorDetect_Red/COORDINATE]
  connect_bd_net -net ColorDetect_Red_READY [get_bd_ports READY_RED] [get_bd_pins ColorDetect_Red/READY]
  connect_bd_net -net ColorDetect_Yellow_COORDINATE [get_bd_ports COORD_YELLOW] [get_bd_pins ColorDetect_Yellow/COORDINATE]
  connect_bd_net -net ColorDetect_Yellow_READY [get_bd_ports READY_YELLOW] [get_bd_pins ColorDetect_Yellow/READY]
  connect_bd_net -net EN_1 [get_bd_ports EN] [get_bd_pins ColorDetect_Blue/EN] [get_bd_pins ColorDetect_Green/EN] [get_bd_pins ColorDetect_Red/EN] [get_bd_pins ColorDetect_Yellow/EN]
  connect_bd_net -net RESET_1 [get_bd_ports RESET] [get_bd_pins ColorDetect_Blue/RESET] [get_bd_pins ColorDetect_Green/RESET] [get_bd_pins ColorDetect_Red/RESET] [get_bd_pins ColorDetect_Yellow/RESET]
  connect_bd_net -net ROM_douta [get_bd_pins ColorDetect_Blue/DATA_IN] [get_bd_pins ColorDetect_Green/DATA_IN] [get_bd_pins ColorDetect_Red/DATA_IN] [get_bd_pins ColorDetect_Yellow/DATA_IN] [get_bd_pins ROM/douta]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port READY_YELLOW -pg 1 -y 700 -defaultsOSRD
preplace port EN -pg 1 -y 220 -defaultsOSRD
preplace port READY_RED -pg 1 -y 220 -defaultsOSRD
preplace port CLK -pg 1 -y 200 -defaultsOSRD
preplace port RESET -pg 1 -y 180 -defaultsOSRD
preplace port READY_BLUE -pg 1 -y 540 -defaultsOSRD
preplace port READY_GREEN -pg 1 -y 380 -defaultsOSRD
preplace portBus COORD_YELLOW -pg 1 -y 680 -defaultsOSRD
preplace portBus COLOR_RED -pg 1 -y 240 -defaultsOSRD
preplace portBus COORD_GREEN -pg 1 -y 360 -defaultsOSRD
preplace portBus COORD_BLUE -pg 1 -y 520 -defaultsOSRD
preplace portBus COORD_RED -pg 1 -y 200 -defaultsOSRD
preplace portBus COLOR_YELLOW -pg 1 -y 720 -defaultsOSRD
preplace portBus COLOR_GREEN -pg 1 -y 400 -defaultsOSRD
preplace portBus COLOR_BLUE -pg 1 -y 560 -defaultsOSRD
preplace inst ColorDetect_Blue -pg 1 -lvl 1 -y 540 -defaultsOSRD
preplace inst ColorDetect_Green -pg 1 -lvl 1 -y 380 -defaultsOSRD
preplace inst ColorDetect_Yellow -pg 1 -lvl 1 -y 700 -defaultsOSRD
preplace inst ColorDetect_Red -pg 1 -lvl 1 -y 220 -defaultsOSRD
preplace inst ROM -pg 1 -lvl 1 -y 20 -defaultsOSRD
preplace netloc CLK_1 1 0 1 NJ
preplace netloc ColorDetect_Red_READY 1 1 1 NJ
preplace netloc ColorDetect_Red_COORDINATE 1 1 1 NJ
preplace netloc COLOR_2_1 1 0 1 NJ
preplace netloc ColorDetect_Red_ADDR 1 0 2 80 -70 550
preplace netloc COLOR_1 1 0 1 NJ
preplace netloc ColorDetect_Yellow_COORDINATE 1 1 1 NJ
preplace netloc ColorDetect_Yellow_READY 1 1 1 NJ
preplace netloc COLOR_3_1 1 0 1 NJ
preplace netloc EN_1 1 0 1 NJ
preplace netloc RESET_1 1 0 1 NJ
preplace netloc ColorDetect_Green_READY 1 1 1 NJ
preplace netloc COLOR_1_1 1 0 1 NJ
preplace netloc ColorDetect_Blue_COORDINATE 1 1 1 NJ
preplace netloc ROM_douta 1 0 1 80
preplace netloc ColorDetect_Blue_READY 1 1 1 NJ
preplace netloc ColorDetect_Green_COORDINATE 1 1 1 NJ
levelinfo -pg 1 0 400 590 -top -80 -bot 790
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


