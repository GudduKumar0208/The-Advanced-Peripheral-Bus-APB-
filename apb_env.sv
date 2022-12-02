//ENVIRONMENT

class slave_env extends uvm_env;

    `uvm_component_utils(slave_env)             //Factory registration
  
    apb_agent    master_agnt_h;                   //Declare master agent handle
    slave_agent  agnt_h;                          //Declare slave agent handle
  
    function new(string name="slave_env",uvm_component parent=null);   //Default constructor of slave environment
      super.new(name,parent);
    endfunction
 
	
    function void build_phase (uvm_phase phase);       //Build phase of environment
       super.build_phase(phase);
       master_agnt_h = apb_agent::type_id::create("master_agnt_h",this);
       agnt_h = slave_agent::type_id::create("agnt_h",this);
    endfunction
  
  
  endclass