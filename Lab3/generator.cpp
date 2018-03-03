// a code generator for the ALU chain in the 32-bit ALU
// see example_generator.cpp for inspiration

// make generator
// ./generator
#include <cstdio>
using std::printf;

int
main() {
    int width = 32;

    for (int i = 1 ; i < width ; i ++) {
        printf("    register r%d(data%d, wr_data, clock,a[%d],reset);\n", i,i, i);
    }

    for (int i =1;i<width; i++){
      printf("data[%d],",i);
    }
}
