module tb_evenodd();
reg clk,w,arstn;
wire q;

parameter clock = 10;

always #(clock/2) clk<=~clk;

evenodd dut(w,clk,arstn,q);

task initialize;
  begin
    arstn<=0;
    clk<=0;
    w<=0;
    #2 arstn<=1;
  end
endtask

integer i;
initial 
    begin
        #5 initialize;
           for(i=0;i<50;i=i+1) 
            begin
                w <= $urandom_range(0,1);
                #6;
            end
        #20 $finish;  
    end
endmodule


