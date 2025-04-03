`timescale 1ns / 1ps

module tb_processor();
    // Clock & reset
    reg clk, rst;
    wire [31:0] tb_Result;

    // Instantiate the processor
    processor processor_inst (
        .clk(clk),
        .reset(rst),
        .Result(tb_Result)
    );

    // Clock generation
    always begin
        #10 clk = ~clk;
    end

    // Reset logic
    initial begin
        clk = 0;
        @(posedge clk);
         rst = 1;
        @(posedge clk); 
        rst = 0;
    end

    // Testbench result dump
    initial begin
        $dumpfile("test.vcd");
        $dumpvars;
    end

    // Test points
    integer point = 0;
    always @(*) begin
        
        #20;
        if (tb_Result == 32'h00000000) point = point + 1;  // and
        
        #20;
        if (tb_Result == 32'h00000001) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000002) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000004) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000005) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000007) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000008) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h0000000b) point = point + 1;  // addi
        
        #20;
        if (tb_Result == 32'h00000003) point = point + 1;  // add
        
        #20;
        if (tb_Result == 32'hfffffffe) point = point + 1;  // sub
        
        #20;
        if (tb_Result == 32'h00000000) point = point + 1;  // and
        
        #20;
        if (tb_Result == 32'h00000005) point = point + 1;  // or
        
        #20;
        if (tb_Result == 32'h00000001) point = point + 1;  // SLT
        
        #20;
        if (tb_Result == 32'hfffffff4) point = point + 1;  // NOR
        
        #20;
        if (tb_Result == 32'h000004D2) point = point + 1;  // andi
        
        #20;
        if (tb_Result == 32'hfffff8d7) point = point + 1;  // ori
        
        #20;
        if (tb_Result == 32'h00000001) point = point + 1;  // SLT
        
        #20;
        if (tb_Result == 32'hfffffb2c) point = point + 1;  // nori
        
        #20;
        if (tb_Result == 32'h00000030) point = point + 1;  // sw
        
        #20;
        if (tb_Result == 32'h00000030) point = point + 1;  // lw

        $display("%s%d", "The number of correct test cases is:", point);
    end

    // Finish simulation
    initial begin
        #430;
        $finish;
    end
endmodule