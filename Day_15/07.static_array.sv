//randomization for array element:
/static array:
class static_array;
  rand bit[7:0]arr[5];
endclass

module m1;
  static_array s1;
  initial begin
    s1=new();
    for(int i=0;i<6;i++)begin
    if(s1.randomize())
      $display("arr[%0d]=%0p ",i,s1.arr);
    else
      $display("randomization is failed");
    end
  end
endmodule

// # arr[0]=118 105 199 170 243
// # arr[1]=188 47 112 82 85
// # arr[2]=3 61 84 32 77
// # arr[3]=195 24 146 132 121
// # arr[4]=249 251 69 204 78

two dimensional array:

class static_array;
  rand bit[7:0]arr[3][4];
endclass

module m1;
  static_array s1;
  initial begin
    s1=new();
    
    for(int i=0;i<3;i++)
      for(int j=0;j<4;j++)
        if(s1.randomize())
          $display("arr[%0d][%0d]=%0p",i,j,s1.arr);
    else
      $display("randomization failed");
  end
endmodule

// # arr[0][0]={28 134 4 75} {246 70 99 238} {210 95 183 208}
// # arr[0][1]={245 94 124 4} {185 98 242 35} {223 151 141 249}
// # arr[0][2]={166 58 72 189} {51 61 150 189} {94 169 23 109}
// # arr[0][3]={158 242 110 93} {193 69 248 41} {200 147 244 230}
// # arr[1][0]={100 32 254 129} {48 176 227 205} {67 255 192 121}
// # arr[1][1]={198 36 58 137} {27 175 64 112} {142 30 136 36}
// # arr[1][2]={204 201 153 251} {197 92 203 150} {127 66 135 30}
// # arr[1][3]={207 89 180 162} {161 5 197 12} {71 201 37 138}
// # arr[2][0]={166 181 104 39} {90 211 45 159} {210 233 96 30}
// # arr[2][1]={77 48 15 244} {201 68 34 64} {11 222 150 83}
// # arr[2][2]={216 32 129 234} {211 172 49 183} {50 173 31 42}
// # arr[2][3]={207 183 69 203} {244 102 2 180} {4 65 171 68}

using constraint in static array:

class static_using_constraint;
  rand bit[7:0]arr[3][4];
      int i;
  constraint range{
    foreach(arr[i])
      arr[i].sum() with (int'(item))==12;
}
// arr[i].sum() with ( int'(item) ) == 12;
// So final meaning:
// Convert each element to int → add → result must equal 12
endclass

module m1;
  static_using_constraint s1;
  initial begin
    s1=new();
    for(int i=0;i<5;i++)begin
    if(s1.randomize())
      $display("arr=%0p",s1.arr);
    else
      $display("randomization failed");
    end
  end
endmodule
// # arr={2 6 2 2} {2 2 8 0} {9 0 0 3}
// # arr={4 2 3 3} {1 2 7 2} {6 1 1 4}
// # arr={1 4 5 2} {7 0 0 5} {2 5 1 4}
// # arr={0 6 0 6} {2 4 2 4} {5 6 0 1}
// # arr={0 1 10 1} {1 3 5 3} {1 4 6 1}

//another example:
class multi;
  rand bit[7:0]arr[3][3][4];
  
  constraint range{
    foreach(arr[i,j])
      arr[i][j].sum() with (int'(item))==12;
  }
endclass

module m1;
  multi m2;
  initial begin
    m2=new();
    if(m2.randomize())
      $display("arr=%0p",m2.arr);
    else
      $display("randomization is failed");
    
    repeat(6)begin
      void'(m2.randomize());
      $display("arr=%0p",m2.arr);
    end
  end
endmodule
