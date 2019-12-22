LOOP_COUNT = 100;

m = 2000;
p = 200; 
n = 1000;

A = zeros(m, p);
B = zeros(p, n);

for i=1:m
    for j=1:p
        A(i,j) = i*p+j;
    end
end

for i=1:p
    for j=1:n
        B(i,j) = -(i*n+j);
    end
end

fprintf('Making the first run of matrix product using the * operator\n');
fprintf('to get stable run time measurements.\n\n');
C = A * B;

fprintf('Measuring performance of matrix product using the * operator.\n\n');
tic
for i=1:LOOP_COUNT
    C = A * B;
end
elapsed_time = toc / LOOP_COUNT;
fprintf('Elapsed time: %d milliseconds.\n', elapsed_time * 1000);
