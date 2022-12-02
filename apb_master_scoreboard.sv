class apb_sb extends uvm_scoreboard;

//Factory Registration
`uvm_component_utils(apb_sb)

//Analysis Port for Connection between Scoreboard and monitor
uvm_analysis_fifo#(apb_trans, apb_sb) an_fifoh;

// Handle of APB Transaction
 apb_trans trans_h;

//Reference Memory

bit [7:0] ref_mem [0:15];

// Default Constructor with two arguments
   function new(string name="apb_sb", uvm_component parent=null);
     super.new(name,parent);
	 an_fifoh = new("an_fifoh",this);
   endfunction 
   
   task run_phase (uvm_phase phase);
    forever begin
      trans_h = apb_trans::type_id::create::("trans_h",this);
	  an_fifoh.get(trans_h);
	
      ref_logic();
	end 
   endtask
   
   task ref_logic();
   
   if (trans_h.PWRITE==WRITE && trans_h.PSEL==1 && trans_h.PENABLE==1);
   ref_mem[PADDR]=PWDATA;
   
   else if (trans_h.PWRITE==READ && trans_h.PSEL==1 && trans_h.PENABLE==1);
    expected_data = ref_mem[PADDR];      

	
	
	
   
   
	 