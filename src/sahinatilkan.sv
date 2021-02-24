/*
Hazirlayanlar : Aykut Sahin ve Serhat Atilkan
Problem 2 - Decode Fetch Birlesim Modulu(Lab grup7)
*/
module sahinatilkan
(
input logic clk,reset,
input logic [31:0] komut,
output logic [31:0] pc,
output logic hata
);


logic [31:0]    rs1_data,rs2_data,imm;
logic [3:0]     aluop;
logic [6:0]     opcode;
logic           we,hataDecoder,hataExecute;
logic           pc_update;
logic [31:0]    pc_new;




lab7_g7_p3 Decoder(.clk(clk),.reset(reset),.komut(komut),.hata(hataDecoder),.rs1_data(rs1_data),
.rs2_data(rs2_data),.imm(imm),.aluop(aluop),.opcode(opcode),.rd_data(pc_new),.we(we));


lab8_g7_p3 Execute(.rs1_data(rs1_data),.rs2_data(rs2_data),.imm(imm),.func(aluop),.opcode(opcode),
.pc_update(pc_update),.sonuc(pc_new),.we(we),.hata(hataExecute));


lab8_g7_p1 Fetc(.clk(clk),.reset(reset),.pc(pc),.pc_update(pc_update),.pc_new(pc_new));


assign hata = hataDecoder | hataExecute;
endmodule