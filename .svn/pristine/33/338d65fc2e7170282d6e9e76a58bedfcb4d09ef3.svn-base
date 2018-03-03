#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "transpose.h"

// will be useful
// remember that you shouldn't go over SIZE
using std::min;

// modify this function to add tiling
void
transpose_tiled(int **src, int **dest) {


  int B=31;

    for (int i = 0; i < SIZE; i+=B) {

        for (int j = 0; j < SIZE; j +=B) {
          int smalleri =SIZE;
          int smallerj = SIZE;
          if (i+B<=SIZE){
            smalleri =i+B;
          }
          if (j+B<=SIZE){
            smallerj = j+B;
          }
          for (int il =i; il<smalleri; il++){
            for (int jl=j; jl<smallerj; jl++){


                  dest[il][jl] = src[jl][il];
            }
          }


        }
    }



}
