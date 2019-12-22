import time
import numpy as np

LOOP_COUNT = 100

m = 2000
p = 200
n = 1000

A = np.zeros((m, p))
B = np.zeros((p, n))

for i in np.arange(m):
    for j in np.arange(p):
        A[i, j] = i * p + j + 1
        
for i in np.arange(p):
    for j in np.arange(n):
        B[i, j] = -(i * n + j) - 1

print('Making the first run of matrix product  using numpy.matmul')
print('to get stable run time measurements.\n')
C = np.matmul(A, B)

print('Measuring performance of matrix product using numpy.matmul.\n')
start_time = time.time()
for i in np.arange(LOOP_COUNT):
    C = np.matmul(A, B)
elapsed_time = (time.time() - start_time) / LOOP_COUNT
print(f'Elapsed time: {elapsed_time * 1000:.3f} milliseconds.')
