`timescale 100ps/100fs

module onebit_comp_testbench();

    reg [15:0] str;
    reg [0:0] in_one,in_two;
    integer fd;
    integer fd2;
    integer i;
    wire out;
    onebit_comp uut(in_one,in_two,out);

    initial begin

        fd = $fopen("./comparator/input.txt","r");
        fd2 = $fopen("./comparator/output.txt","w");

        while($fgets(str,fd)) begin

            if(str != 16'h000a) begin
                in_one = str[15:8] == "0" ? 1'b0 : 1'b1;
                in_two = str[7:0] == "0" ? 1'b0 : 1'b1;

                for(i=0;i<10;i=i+1) begin
                    str = { 8'd48 + in_one, 8'd48 + in_two };
                    $fwrite(fd2,"%s\n",str);
                end

            end

        end

        $fclose(fd);
        $fclose(fd2);

        $stop;

    end

endmodule
