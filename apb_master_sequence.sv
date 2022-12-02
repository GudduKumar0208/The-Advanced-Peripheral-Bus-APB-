class apb_master_sequence extends uvm_sequence#(apb_trans);

// FACTORY REGISTRATION FOR OBJECT
`uvm_object_utils(apb_master_sequence);

apb_trans rw_trans;

// DEFAULT NEW CONSTRUCTOR
function new(string name ="apb_master_sequence");
   super.new(name);
endfunction

 virtual task body();
apb_trans rw_trans;
// CREATE 10 RANDOM READ/WRITE TRANSACTION AND SEND TO DRIVER
//repeat(50) 
forever
begin
 /* rw_trans = apb_trans::type_id::create("rw_trans",this);
 start_item(rw_trans);
 assert(rw_trans.randomize());
 finish_item(rw_trans); */ 
 `uvm_do(rw_trans);
 end
 endtask
 
 
endclass 
 





