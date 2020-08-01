`timescale 1ns/1ns
 module CRC16_r(
      input     wire              i_clk_r                 , //时钟；
      input     wire              i_rst_n_r               , //同步复位；
      input     wire              i_din_valid_r           , //输入数据有效；
      input     wire    [31:0]    i_din_r                 ,
	   output    wire              o_dout_valid_r          , //输出CRC值有效；
      output    wire    [15:0]    o_dout_r                  //输出CRC,即为0；         
  );
 reg [15:0] r_dout; //用来计算的输出数据
 wire [31:0] d; //用来替代输入数据计算的
 wire [15:0] c; //得到的上一个输出数据值
 assign d = i_din_r; 
 assign c = r_dout; //把上一个输出数据值赋给c
 always @(posedge i_clk_r) begin
     if (~i_rst_n_r) 
         r_dout <= 16'hffff; //输出数据初始值为ffff；
     else if (i_din_valid_r) 
     begin //计算逻辑；
    r_dout[0] = d[28] ^ d[27] ^ d[26] ^ d[22] ^ d[20] ^ d[19] ^ d[12] ^ d[11] ^ d[8] ^ d[4] ^ d[0] ^ c[3] ^ c[4] ^ c[6] ^ c[10] ^ c[11] ^ c[12];
    r_dout[1] = d[29] ^ d[28] ^ d[27] ^ d[23] ^ d[21] ^ d[20] ^ d[13] ^ d[12] ^ d[9] ^ d[5] ^ d[1] ^ c[4] ^ c[5] ^ c[7] ^ c[11] ^ c[12] ^ c[13];
    r_dout[2] = d[30] ^ d[29] ^ d[28] ^ d[24] ^ d[22] ^ d[21] ^ d[14] ^ d[13] ^ d[10] ^ d[6] ^ d[2] ^ c[5] ^ c[6] ^ c[8] ^ c[12] ^ c[13] ^ c[14];
    r_dout[3] = d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[23] ^ d[22] ^ d[15] ^ d[14] ^ d[11] ^ d[7] ^ d[3] ^ c[6] ^ c[7] ^ c[9] ^ c[13] ^ c[14] ^ c[15];
    r_dout[4] = d[31] ^ d[30] ^ d[26] ^ d[24] ^ d[23] ^ d[16] ^ d[15] ^ d[12] ^ d[8] ^ d[4] ^ c[0] ^ c[7] ^ c[8] ^ c[10] ^ c[14] ^ c[15];
    r_dout[5] = d[31] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[19] ^ d[17] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[9] ^ c[10] ^ c[12] ^ c[15];
    r_dout[6] = d[29] ^ d[27] ^ d[26] ^ d[25] ^ d[23] ^ d[21] ^ d[20] ^ d[18] ^ d[17] ^ d[14] ^ d[13] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[7] ^ c[9] ^ c[10] ^ c[11] ^ c[13];
    r_dout[7] = d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[24] ^ d[22] ^ d[21] ^ d[19] ^ d[18] ^ d[15] ^ d[14] ^ d[13] ^ d[11] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[8] ^ c[10] ^ c[11] ^ c[12] ^ c[14];
    r_dout[8] = d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[0] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[15];
    r_dout[9] = d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[0] ^ c[1] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[10] ^ c[12] ^ c[13] ^ c[14];
    r_dout[10] = d[31] ^ d[30] ^ d[29] ^ d[27] ^ d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[0] ^ c[1] ^ c[2] ^ c[5] ^ c[6] ^ c[8] ^ c[9] ^ c[11] ^ c[13] ^ c[14] ^ c[15];
    r_dout[11] = d[31] ^ d[30] ^ d[28] ^ d[26] ^ d[25] ^ d[23] ^ d[22] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[14] ^ d[11] ^ d[10] ^ d[6] ^ c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[7] ^ c[9] ^ c[10] ^ c[12] ^ c[14] ^ c[15];
    r_dout[12] = d[31] ^ d[29] ^ d[28] ^ d[24] ^ d[23] ^ d[22] ^ d[18] ^ d[16] ^ d[15] ^ d[8] ^ d[7] ^ d[4] ^ d[0] ^ c[0] ^ c[2] ^ c[6] ^ c[7] ^ c[8] ^ c[12] ^ c[13] ^ c[15];
    r_dout[13] = d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[19] ^ d[17] ^ d[16] ^ d[9] ^ d[8] ^ d[5] ^ d[1] ^ c[0] ^ c[1] ^ c[3] ^ c[7] ^ c[8] ^ c[9] ^ c[13] ^ c[14];
    r_dout[14] = d[31] ^ d[30] ^ d[26] ^ d[25] ^ d[24] ^ d[20] ^ d[18] ^ d[17] ^ d[10] ^ d[9] ^ d[6] ^ d[2] ^ c[1] ^ c[2] ^ c[4] ^ c[8] ^ c[9] ^ c[10] ^ c[14] ^ c[15];
    r_dout[15] = d[31] ^ d[27] ^ d[26] ^ d[25] ^ d[21] ^ d[19] ^ d[18] ^ d[11] ^ d[10] ^ d[7] ^ d[3] ^ c[2] ^ c[3] ^ c[5] ^ c[9] ^ c[10] ^ c[11] ^ c[15];
     end
 end 
 reg r_dout_valid = 0;  //定义 输出数据有效信号 初始值为0
 always @(posedge i_clk_r) //输入数据在一个时钟内完成CRC计算，下一个时钟输出；
 begin
     r_dout_valid <= i_din_valid_r;   //将输入信号有效的值 赋给 输出数据有校，以便使信号在下一个时钟输出
 end
 
 assign o_dout_valid_r = r_dout_valid;   
 assign o_dout_r = r_dout ;
 
 endmodule 