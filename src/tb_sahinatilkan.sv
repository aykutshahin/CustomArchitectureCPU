/*
Hazirlayanlar : Aykut Sahin ve Serhat Atilkan
Problem 2 - Decode Fetch Birlesim Modulu Test Bench(Lab grup7)
*/
`timescale 1ns/1ps
module tb_sahinatilkan();

logic clk,reset;
logic [31:0] pc;
logic [31:0] komut;
logic [31:0] mem [0:63];
logic        hata;
assign komut = mem[pc >> 2];

sahinatilkan inst1(.clk(clk),.reset(reset),.komut(komut),.pc(pc),.hata(hata));

always
begin
clk = 0; #5; clk = 1; #5;
end

initial begin
$readmemb("fib20.mem",mem);
end

initial begin
reset = 0; #10; reset = 1;
end

initial begin
#10000;
$stop;
end

endmodule

