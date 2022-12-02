class apb_agent extends uvm_agent;

     // AGENT WILL HAVE MONITOR, DRIVER, SEQUENCER COMPONENTS 
     apb_seqr master_seqr_h;
     apb_driver drv_h;
     apb_monitor mon_h;
     
     //master_config master_config_h;
     virtual  APB_slave_inf vif;

     //FACTORY OBJECT REGISTRATION
      `uvm_component_utils(apb_agent);
         
       
       
      //DEFAULT CONSTRUCTOR WITH TWO ARGUMENTS
       function new(string name="apb_agent",uvm_component parent=null);
       super.new(name,parent);
      endfunction
 
        //BUILD PHASE OF AGENT CREATNG SEQUENCER, DRIVER, MONITOR IN BUILD PHASE
       function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       master_seqr_h = apb_seqr::type_id::create("master_seqr_h",this);
       drv_h = apb_driver::type_id::create("drv_h",this);
       mon_h = apb_monitor::type_id::create("mon_h",this);
       
       //CONFIG DB DECLERATION IN THE AGENT WITH THE GET METHOD
       if(!uvm_config_db#(virtual APB_slave_inf)::get(this,"*","vif_slave",vif))begin
       `uvm_fatal("master agent build phase","virtual interface got failed");
       //if(master_config_h.is_active==UVM_ACTIVE)
       end
       endfunction
       
       //CONNECT PHASE TO CONNECT DRIVER TO SEQUENCER,DRIVER TO VIRTUAL INTERFACE,MONITOR TO VIRTUAL INTERFACE
       function void connect_phase(uvm_phase phase);
       drv_h.seq_item_port.connect(master_seqr_h.seq_item_export);
       drv_h.vif=vif;
       mon_h.vif=vif;
       endfunction
       
       
endclass



 

 