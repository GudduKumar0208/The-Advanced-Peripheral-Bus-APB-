//CONFIG SLAVE

class slave_config extends uvm_object;

`uvm_object_utils(slave_config);

virtual APB_slave_inf vif_slave;

uvm_active_passive_enum is_active = UVM_ACTIVE;

//bit enb_scoreboard = 1;

function new(string name = "slave_config");
 super.new(name);
endfunction


endclass