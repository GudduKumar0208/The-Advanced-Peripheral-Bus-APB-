//APB SLAVE DRIVER
class apb_slave_driver extends uvm_driver #(apb_transcation);

//Factory Registration
`uvm_component_utils(apb_slave_driver);

//apb_transcation slave_transh; //Transcation handle

virtual APB_slave_inf vif_slave;

function new (string name = "apb_slave_driver", uvm_component parent=null);
	super.new(name,parent);
endfunction
   
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	if (!uvm_config_db#(virtual APB_slave_inf)::get(this,"*","vif_slave",vif_slave)) 
	  begin
        `uvm_fatal("SLAVE AGENT", "The virtual interface get failed");
	  end
endfunction
   
task run_phase(uvm_phase phase);
    repeat(100)
	   begin
	   seq_item_port.get_next_item(req);
	   //req.print();
	   driver_logic(req);
       seq_item_port.item_done();
	   //req.print();
	  end
endtask
   
 
   
 task driver_logic(apb_transcation req);
 
 
 if(req.PSEL==1)begin
  @(posedge vif_slave.PCLK);
    vif_slave.PREADY<=1'b1;
	if (!req.PWRITE) 
    begin
       vif_slave.PRDATA<=req.PRDATA;
    end
  @(posedge vif_slave.PCLK);
    vif_slave.PREADY<=1'b0;  
  end
   
   
  
 endtask
 
endclass