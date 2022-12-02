class apb_trans extends uvm_sequence_item;

// FACTORY REGISTRATION


/* typedef enum logic {READ, WRITE} kind_e;
rand kind_e PWRITE */;

rand logic [4:0] PADDR;  // ADDRESS
rand bit [4:0] PWDATA; // WRITE DATA
logic PENABLE;
rand bit PSEL;
bit [4:0] PRDATA;
rand logic PWRITE;
 

    `uvm_object_utils_begin(apb_trans)
    `uvm_field_int(PADDR, UVM_ALL_ON)  
    `uvm_field_int(PENABLE, UVM_ALL_ON)  
    `uvm_field_int(PSEL, UVM_ALL_ON)  
    `uvm_field_int(PRDATA, UVM_ALL_ON)  
    `uvm_field_int(PWDATA, UVM_ALL_ON) 
    `uvm_field_int(PWRITE, UVM_ALL_ON) 
	`uvm_object_utils_end

function new(string name="apb_trans");
  super.new(name);
endfunction

endclass




  
 