/**
 * @file
 * Contains the implementation of the countOnes function.
 */

unsigned countOnes(unsigned input) {
	// TODO: write your code here

	input = ((input&0xAAAAAAAA)>>1)+(input&0x55555555);
	input = ((input&0xCCCCCCCC)>>2) + (input&0x33333333);
	input= ((input&0xf0f0f0f0)>>4)+(input&0x0f0f0f0f);
	input = ((input&0xff00ff00)>>8)+(input&0x00ff00ff);
	input = ((input&0xffff0000)>>16)+(input&0x0000ffff);



	return input;
}
