class foreach_constraint;
  rand bit[7:0]arr[2][3];
  constraint arr_range{foreach(arr[i])
    arr[i].sum()with (int'(item))==12;}
endclass

module m1;
  foreach_constraint f1;
  initial begin
    f1=new();
    
    for(int i=0;i<5;i++)begin
    if(f1.randomize())
      $display("arr=%0p",f1.arr);
    else
      $display("randomization is failed");
    end
  end
endmodule


class foreach_constraint;
  rand bit [7:0]arr[2][3][4];
  
  constraint arr_range{foreach (arr[i,j])
    arr[i][j].sum() with (int'(item))==12;}
endclass

module m1;
  foreach_constraint f1;
  initial begin
    f1=new();
    
    for(int i=0;i<6;i++)begin
      if(f1.randomize())
        $display("arr=%0p",f1.arr);
      else
        $display("randomization is failed");
    end
  end
endmodule

class foreach_constraint;
  rand bit[3:0][7:0]arr[2][3];
  
  constraint arr_range{
    foreach(arr[i])
      arr[i].sum()with (int'(item));
  }
endclass

module m1;
  foreach_constraint f1;
  initial begin
    f1=new();
    
    for(int i=0;i<4;i++)begin
      if(f1.randomize())
        $display("arr=%0p",f1.arr);
      else
        $display("randomization is failed");
    end
  end
endmodule

// # arr={{187 51 43 27} {163 226 170 101} {160 234 42 140}} {{180 58 218 185} {136 233 154 116} {194 219 138 223}}
// # arr={{128 174 89 52} {146 122 204 132} {236 214 218 84}} {{181 162 228 29} {226 80 85 250} {104 12 197 245}}
// # arr={{215 218 44 134} {156 75 64 189} {139 218 146 201}} {{205 157 223 110} {174 63 97 168} {132 34 190 246}}
// # arr={{54 106 169 63} {208 199 84 247} {248 206 1 214}} {{255 153 95 4} {128 34 221 50} {128 67 195 214}}
