module bram11 (clk, we, re, waddr, raddr, wdi, rdo);
    `define RAMinitFile "./init.dat"
    parameter ADDR_WIDTH = 12;
    parameter SIZE = 11;
    parameter BIT_WIDTH = 32;
    input                          clk;
    input                          we, re;
    input [ADDR_WIDTH-1:0]         waddr, raddr;
    input [BIT_WIDTH-1:0]          wdi;
    output reg [BIT_WIDTH-1:0]     rdo;
    reg [BIT_WIDTH-1:0] RAM [SIZE-1:0];
    /////initial $readmemh(`RAMinitFile, RAM);

    wire [BIT_WIDTH-1:0] ram0 = RAM[0];
    wire [BIT_WIDTH-1:0] ram1 = RAM[1];
    wire [BIT_WIDTH-1:0] ram2 = RAM[2];
    wire [BIT_WIDTH-1:0] ram3 = RAM[3];
    wire [BIT_WIDTH-1:0] ram4 = RAM[4];
    wire [BIT_WIDTH-1:0] ram5 = RAM[5];
    wire [BIT_WIDTH-1:0] ram6 = RAM[6];
    wire [BIT_WIDTH-1:0] ram7 = RAM[7];
    wire [BIT_WIDTH-1:0] ram8 = RAM[8];
    wire [BIT_WIDTH-1:0] ram9 = RAM[9];
    wire [BIT_WIDTH-1:0] ram10 = RAM[10];
    
    
    always @(posedge clk)begin
        if(re) rdo <= RAM[raddr];
    end
    
    always @(posedge clk)begin
        if(we) RAM[waddr] <= wdi;
    end
    
endmodule