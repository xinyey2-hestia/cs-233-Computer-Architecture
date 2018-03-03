#include "declarations.h"
// A[i], D[i+3]
// Cannot vectorized because A[i] depends on D[i+3] Read after Write
void
t6(float *restrict A, float *restrict D) {
    for (int nl = 0; nl < ntimes; nl ++) {
        A[0] = 0;
        for (int i = 0; i < (LEN6 - 3); i ++) {
            A[i] = D[i] + (float) 1.0;
            D[i + 3] = A[i] + (float) 2.0;
        }
    }
}
