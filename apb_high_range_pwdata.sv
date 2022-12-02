class apb_high_range_pwdata extends apb_master_sequence;

// FACTORY REGISTRATION FOR OBJECT
`uvm_object_utils(apb_high_range_pwdata);

// DEFAULT NEW CONSTRUCTOR
function new(string name ="apb_high_range_pwdata");
   super.new(name);
endfunction

task body();

repeat(10)           // CREATE 10 RANDOM READ/WRITE TRANSACTION AND SEND TO DRIVER
forever
begin
 /* rw_trans = apb_trans::type_id::create("rw_trans");
 start_item(rw_trans);
 assert(rw_trans.randomize() with {PWDATA > 16;});
 finish_item(rw_trans);  */
 `uvm_do_with(rw_trans,{PWDATA > 16;});
 end
 endtask
 
 
endclass 
 





