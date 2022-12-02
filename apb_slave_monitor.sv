
//Monitor SLAVE

class apb_slave_monitor extends uvm_monitor;

//Factory Registration
`uvm_component_utils(apb_slave_monitor)
//Decalre port for monitor
 uvm_analysis_port#(apb_transcation) slave_mon_port;

virtual APB_slave_inf vif_slave;

function new (string name = "apb_slave_monitor", uvm_component parent=null);
	  super.new(name,parent);
	  slave_mon_port=new("slave_mon_port",this);
endfunction
  
task run_phase(uvm_phase phase);
forever
   //repeat(100)
	 begin
	   monitor();
	 end
endtask
   
task monitor();

   apb_transcation slave_transh; //Handle of transcation class

   @(posedge vif_slave.PCLK);
   #1;
   slave_transh=new();
   slave_transh.PSEL=vif_slave.PSEL;
   
   if(slave_transh.PSEL==1)begin
   
   slave_transh.PWRITE=vif_slave.PWRITE;
   slave_transh.PADDR=vif_slave.PADDR;
   slave_transh.PWDATA=vif_slave.PWDATA;
   slave_mon_port.write(slave_transh);
  
  @(posedge vif_slave.PCLK);
  end
  else begin
  
  slave_transh.PWRITE=vif_slave.PWRITE;
  slave_transh.PADDR=vif_slave.PADDR;
  slave_transh.PWDATA=vif_slave.PWDATA;
  slave_mon_port.write(slave_transh);
  
  end
endtask

endclass