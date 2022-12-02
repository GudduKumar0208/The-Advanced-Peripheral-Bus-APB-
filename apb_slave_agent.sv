//SLAVE AGENT

class slave_agent extends uvm_agent;

   //FACTORY OBJECT REGISTRATION
  `uvm_component_utils(slave_agent);
  
	//Virtual interface 
    virtual APB_slave_inf vif_slave;
	
	 // AGENT WILL HAVE MONITOR, DRIVER, SEQUENCER COMPONENTS
	apb_slave_monitor  mon_h;
	apb_slave_driver   dr_h;
	apb_sequencer seqr_h;
	slave_config slave_confg_h;
   
   function new (string name = "slave_agent", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
   function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 mon_h = apb_slave_monitor::type_id::create("mon_h",this);
	 dr_h = apb_slave_driver::type_id::create("dr_h",this);
	 seqr_h = apb_sequencer::type_id::create("seqr_h",this);
	 if (!uvm_config_db#(virtual APB_slave_inf)::get(this,"*","vif_slave", vif_slave)) begin
        `uvm_fatal("SLAVE AGENT", "The virtual interface get failed");
		end
		
	//if(slave_confg_h.is_active==UVM_ACTIVE)begin
	 // `uvm_fatal("SLAVE AGENT", "The virtual interface get failed");
	  //end
	   
   endfunction
   
   function void connect_phase (uvm_phase phase);
   	   
      dr_h.seq_item_port.connect(seqr_h.seq_item_export);
	  dr_h.vif_slave = vif_slave;
	  mon_h.vif_slave = vif_slave;
	  
	  mon_h.slave_mon_port.connect(seqr_h.seqr_port.analysis_export);
   endfunction
   
 
   
endclass