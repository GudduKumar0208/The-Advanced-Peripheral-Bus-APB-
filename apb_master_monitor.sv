class apb_monitor extends uvm_monitor;

// FACTORY REGISTRATION
`uvm_component_utils(apb_monitor);

// Analysis Port for Connection between monitor and scoreboard
  uvm_analysis_port #(apb_trans) an_port;

//CONNECT TO INTERFACE
virtual  APB_slave_inf vif;

// DEFAULT CONTRUCTOR WITH TWO ARGUMENT
function new(string name="apb_monitor",uvm_component parent=null);
   super.new(name,parent);
   an_port = new("an_port",this);
endfunction

task run_phase(uvm_phase phase);
//repeat(100) 
forever
begin

monitor();

end
endtask


task monitor();
//HANDLE CREATION
apb_trans trans_h;
trans_h =new();
trans_h.PADDR = vif.PADDR ;
trans_h.PWDATA=vif.PWDATA ;
//trans_h.PWRITE=vif.master_mon_cb.PWRITE ;
//$cast(trans_h.PWRITE,vif.PWRITE);
trans_h.PSEL=vif.PSEL ;
 @(posedge vif.PCLK);
trans_h.PENABLE=vif.PENABLE;
 @(posedge vif.PCLK);
trans_h.PSEL=vif.PSEL;
trans_h.PENABLE=vif.PENABLE;
$display("Pwrite=%0d",trans_h.PWRITE);
$display("paddr=%0d",trans_h.PADDR);

//an_port.write(trans_h);
endtask

endclass





