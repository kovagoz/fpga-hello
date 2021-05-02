module hello(i_Switch_1, o_LED_1, o_LED_2, o_LED_3, o_LED_4);
	input wire i_Switch_1;

	output wire o_LED_1;
	output wire o_LED_2;
	output wire o_LED_3;
	output wire o_LED_4;

	assign o_LED_1 = !i_Switch_1;
	assign o_LED_2 = i_Switch_1;
	assign o_LED_3 = !i_Switch_1;
	assign o_LED_4 = i_Switch_1;
endmodule
