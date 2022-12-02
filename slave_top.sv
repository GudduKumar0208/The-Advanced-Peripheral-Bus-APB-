//TOP



module slave_top();

    import uvm_pkg::*;
    import apb_pkg::*;
  
 bit PCLK;
  
  APB_slave_inf inf(PCLK);
  
//clock generation 
   always
   #5 PCLK = ~PCLK;
   
  initial 
     begin
	 uvm_config_db #(virtual APB_slave_inf)::set(null,"*","vif_slave",inf);
     run_test("apb_test_high_range_paddr");
	
  end
   
  /*  initial begin
     //WRITE
	repeat(1) begin
	  @(posedge PCLK);
      inf.PWRITE = 1'b1;
	  inf.PSEL = 1'b1;
	  inf.PADDR = 'd45;
	  inf.PWDATA = $urandom;
	  @(posedge PCLK);
	  inf.PENABLE = 1'b1;
	end
	/// @(posedge PCLK);
	// inf.PREADY=1'b1;
	 @(posedge PCLK);
	 inf.PWRITE = 1'bz;
	 inf.PSEL = 1'b0;
	 inf.PENABLE = 1'b0;
	 
	 @(posedge PCLK);
	 
	 //READ
	  @(posedge PCLK);
     inf.PWRITE = 1'b0;
	 inf.PADDR = 'd45;
	 inf.PSEL = 1'b1;
	 @(posedge PCLK);
	 inf.PENABLE = 1'b1;
	/// @(posedge PCLK);
	// inf.PREADY=1'b1;
	 @(posedge PCLK);
	 inf.PWRITE = 1'bz;
	 inf.PSEL = 1'b0;
	 inf.PENABLE = 1'b0;
	 
	
	 
   end */
   
   initial
     #1000 $finish;
endmodule