module enum_type;
  typedef enum{state0,state1,state2,state3}state;
  int i;
  state next_state;
  state ns[4];
  
  
  initial begin
    
    next_state=next_state.first();
    $display("first_name=%s (numeric=%0d)",next_state.name(),next_state);
    
    next_state=next_state.next();
    $display("next_state=%s (numeric=%0d)",next_state.name(),next_state);
    
    next_state=next_state.prev();
    $display("next_state=%s (numeric=%0d)",next_state.name(),next_state);
    
    next_state=next_state.last();
    $display("next_state=%s (numeric=%0d)\n",next_state.name(),next_state);
    
    for(i=0;i<4;i++)begin
      ns[i]=state'(i%4);
      $display("state[%0d]=%s (numeric=%0d)",i,ns[i].name(),ns[i]);
    end
  end
endmodule
