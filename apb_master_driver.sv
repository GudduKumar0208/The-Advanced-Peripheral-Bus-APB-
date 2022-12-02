class apb_driver extends uvm_driver#(apb_trans);

     //FACTORY REGISTRATION
     `uvm_component_utils(apb_driver)
     
     //CONNECT WITH INTERFACE
     virtual  APB_slave_inf vif;
     
     // DEFAULT CONTRUCTOR WITH TWO ARGUMENT
     function new(string name="apb_driver",uvm_component parent=null);
        super.new(name,parent);
     endfunction
     
      function void build_phase(uvm_phase phase);
           super.build_phase(phase);
        endfunction
        
      task run_phase(uvm_phase phase);
            repeat(100) begin
	             seq_item_port.get_next_item(req);
	             drive_write_and_read(req);
	             seq_item_port.item_done();
	             //req.print();
	            // print();
	             end
       endtask

       task drive_write_and_read(apb_trans req);
         @(posedge vif.PCLK);
         vif.PSEL <= req.PSEL;
         
        
         if(req.PSEL) begin
           vif.PWRITE <= req.PWRITE;
           vif.PADDR <= req.PADDR;       
           vif.PENABLE <= 0;
             if(req.PWRITE) begin
               vif.PWDATA <= req.PWDATA;
               end
             else begin
             vif.PWDATA <= 5'bz;
             end
          
          @(posedge vif.PCLK);
          vif.PENABLE <= 1;
         
         // wait(req.PREADY==1);         
         end
         
         if(req.PSEL==0) begin
              vif.PWRITE <= 1'bz;
              vif.PADDR <= 5'bz;
	          vif.PWDATA <= 5'bz;
	          vif.PENABLE <= 0;
   
 
          end
  
      endtask
      
/*        // drive
  task drive_write_and_read(apb_trans req);
    req.print();
      vif.PENABLE <= 0;
      
      @(posedge vif.PCLK);
      vif.PADDR <= req.PADDR;
    if(req.PWRITE) begin
        vif.PWRITE <= req.PWRITE;
        vif.PWDATA <= req.PWDATA;
      $display("\tADDR = %0h \tPWDATA = %0h",req.PADDR,req.PWDATA);
        @(posedge vif.PCLK);
      end
    else begin
        vif.PWRITE <= req.PWRITE;
        @(posedge vif.PCLK);
        vif.PWRITE <= 1'b0;;
        @(posedge vif.PCLK);
        req.PRDATA = vif.PRDATA;
       $display("\tADDR = %0h \tRDATA = %0h",vif.PADDR,vif.PRDATA);
      end
      $display("-----------------------------------------");
  endtask  */
 
endclass