

class apb_test_low_range_pwdata extends apb_test;
 
  `uvm_component_utils(apb_test_low_range_pwdata)
  
   
   
   apb_low_range_pwdata  master_seq_h;
  
function new (string name = "apb_test_low_range_pwdata",uvm_component parent=null);
	super.new(name,parent);
endfunction
  
/* function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	master_seq_h = apb_high_range_pwdata::type_id::create("master_seq_h",this); 
endfunction */
    
  
task run_phase (uvm_phase phase);

     master_seq_h = apb_low_range_pwdata::type_id::create("master_seq_h",this);
	 
     phase.raise_objection(this);
	 fork
	 master_seq_h.start(env_h.master_agnt_h.master_seqr_h);
     seq_h.start(env_h.agnt_h.seqr_h);
	 join
	 phase.drop_objection(this);
endtask  

endclass
