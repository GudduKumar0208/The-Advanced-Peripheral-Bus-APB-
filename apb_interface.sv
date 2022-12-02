//interface of APB_slave

interface APB_slave_inf(input bit PCLK); 
    
     logic [31:0]PWDATA;    // Master send the Pwdata to the slave
     logic PRESETN;         //Reset signal of apb
     logic PWRITE;          // When PWRITE  signal is high then write operation will perform o.w. read will be executed
     logic PSEL;            // PSEL signal will select slave
     logic PENABLE;         //PENABLE signal for slave
     logic [31:0]PRDATA;    //PRDATA send by slave
     logic PREADY;          //ackn. send by slave
	 logic [31:0] PADDR;    //PADDR signal of apb
     
     
/*      clocking master_drv_cb@(posedge PCLK);
      default input #1 output #1;
      output PADDR,PWDATA;
      output PRESETN,PWRITE,PSEL,PENABLE;
      input PRDATA;
     endclocking
     
     clocking master_mon_cb@(posedge PCLK);
      default input #1 output #1;
      input PADDR,PWDATA;
      input PRESETN,PWRITE,PSEL,PENABLE;
      input PRDATA;
	  input PREADY;
     endclocking
     
     clocking slave_drv_cb@(posedge PCLK);
      default input #1 output #1;
      input PADDR,PWDATA;
      input PRESETN,PWRITE,PSEL,PENABLE;
      output PRDATA;
      output PREADY;
     endclocking
     
     clocking slave_mon_cb@(posedge PCLK);
      default input #1 output #1;
      input PADDR,PWDATA;
      input PRESETN,PWRITE,PSEL,PENABLE;
      input PRDATA;
      input PREADY;
     endclocking
     
     
     //modports of these clocking blocks for the communication purspose one
     modport MASTER_DRV_MP(clocking master_drv_cb);
     modport MASTER_MON_MP(clocking master_mon_cb);
     modport SLAVE_DRV_MP(clocking slave_drv_cb);
     modport SLAVE_MON_MP(clocking slave_mon_cb); */
     
endinterface
