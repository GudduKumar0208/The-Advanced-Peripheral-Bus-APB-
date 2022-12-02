//TRANSCATION CLASS
class apb_transcation extends uvm_sequence_item;

 logic[4:0] PADDR;
 bit[4:0] PWDATA;
 logic[4:0] PRDATA;
 logic PWRITE;
 logic PSEL;
 bit PREADY;
 `uvm_object_utils_begin(apb_transcation)
 `uvm_field_int(PADDR,UVM_ALL_ON)
 `uvm_field_int(PWDATA,UVM_ALL_ON)
 `uvm_field_int(PRDATA,UVM_ALL_ON)
 `uvm_field_int(PWRITE,UVM_ALL_ON)
 `uvm_field_int(PSEL,UVM_ALL_ON)
 `uvm_field_int(PREADY,UVM_ALL_ON)
 `uvm_object_utils_end
 

function new(string name="apb_transcation");
  super.new(name);
endfunction
 
endclass