//SEQUENCE APB
class apb_slave_sequence extends uvm_sequence #(apb_transcation);

//factory registration
   `uvm_object_utils(apb_slave_sequence)
//p_sequencer declaration 
   `uvm_declare_p_sequencer(apb_sequencer)
//trancation handle
	apb_transcation trans_h, trans_collected;
	

function new (string name = "apb_slave_sequence");
       super.new(name);
endfunction
  
//MEMORY CREATION  
 logic [4:0] memory [int];
 logic [4:0] out_data;
 
   
task body();
  forever
   // repeat(100)
    begin
	     if(!$cast(p_sequencer , m_sequencer))
        `uvm_fatal("ERROR","CASTING NOT MATCHED")
		
		  p_sequencer.seqr_port.get(trans_collected);
		 // trans_collected.print();
		  mem_logic(); //calling memory logic here
		  trans_collected.PRDATA = out_data;
		   $display("PRDATA=%0d",trans_collected.PRDATA);
		  `uvm_send(trans_collected) //, {PWRITE == trans_collected.PWRITE;PRDATA == out_data ;});
	end
endtask

//Memory logic	
task mem_logic();
 
 //write logic
  if(trans_collected.PWRITE)
     memory[trans_collected.PADDR] = trans_collected.PWDATA;
	// $display("PWDATA=%0d",trans_collected.PWDATA);
	//$display("memory=%0p",memory);
//read logic
  
  // if(memory.exists(trans_collected.PADDR))
  if(!trans_collected.PWRITE)
  //  begin
     //if(memory.exists(trans_collected.PADDR))
	 
      out_data = memory[trans_collected.PADDR]; 
	 // $display("out_data=%0d",out_data);
	 //$display("address=%0d",trans_collected.PADDR);
	 
	 
	 // else
	 //$display($time," :  \n out_data = %h \n",out_data);
	 // end
	 
     
	
endtask

endclass