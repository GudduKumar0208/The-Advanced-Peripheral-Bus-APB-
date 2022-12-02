//TEST

class apb_test extends uvm_test;
 
  `uvm_component_utils(apb_test)
  
   slave_env env_h;
   
   apb_slave_sequence seq_h;
   
  apb_master_sequence master_seq_h;
function new (string name = "apb_test", uvm_component parent=null);
	super.new(name,parent);
endfunction
   
function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	 env_h = slave_env::type_id::create("env_h",this);
	 seq_h=apb_slave_sequence::type_id::create("seq_h",this);
endfunction
  
  
  virtual task run_phase (uvm_phase phase); 
     phase.raise_objection(this);
	 fork
	 master_seq_h.start(env_h.master_agnt_h.master_seqr_h);
     
	  seq_h.start(env_h.agnt_h.seqr_h);
    join_any
	 phase.drop_objection(this);
endtask  

endclass
