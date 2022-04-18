hex2binary

columns_quasi_cycle = 64;
rows_quasi_cycle = 128;

length_of_parity = length(binary_matrix(:,1)); % length_of_parity is the number of blocks (in our implementation: 32*16 = 512 blocks)
B = zeros(rows_quasi_cycle, columns_quasi_cycle, length_of_parity);

for i=1:length_of_parity
    B(1,:,i) = binary_matrix(i,:);
    for j=1:rows_quasi_cycle - 1
        B(j+1,:,i) = circshift(B(j,:,i),1);
    end
end


Parity = zeros(4096, 1024);

for i = 1:32
    for j = 1:16
        Parity(((i-1)*rows_quasi_cycle+1:i*rows_quasi_cycle),((j-1)*columns_quasi_cycle+1:j*columns_quasi_cycle)) = B(:,:,(i-1)*16 + j);
    end
end


Generator_Matrix = [eye(4096), Parity];

Parity_transpose = Parity';

H = [Parity_transpose, eye(1024)];
