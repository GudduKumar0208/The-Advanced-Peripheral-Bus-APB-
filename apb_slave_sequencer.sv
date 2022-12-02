//SEQUENCER APB
class apb_sequencer extends uvm_sequencer #(apb_transcation);

//Fctory Registration
`uvm_component_utils(apb_sequencer)

//Ports for sequencer
uvm_tlm_analysis_fifo #(apb_transcation) seqr_port;
uvm_analysis_export #(apb_transcation) req_seqr_port;

function new (string name = "apb_sequencer", uvm_component parent=null);
	super.new(name,parent);
	seqr_port=new("seq_port",this);
	req_seqr_port=new(" req_seqr_port",this);
endfunction
   
   
 /* task run_phase(uvm_phase phase);
      apb_transcation trans_h;
	  repeat(50)
	   begin
	   seqr_port.get(trans_h);
	// req_seqr_port.get(trans_h);
	   end
endtask  */
	
function void  connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	req_seqr_port.connect(seqr_port.analysis_export); //make connection
endfunction
   
endclass
