fileName = 'hex.txt';
FID = fopen(fileName);
data = textscan(FID,'%s');
fclose(FID);
stringData = string(data{:});
size_vector = zeros(512,1);
binary_matrix = zeros(512,64);
for i=1:length(stringData)
    stringData(i) = regexprep(stringData(i),",","");
    a = hexToBinaryVector(stringData(i));
    size_vector(i) = length(a);
    zero_padding = 64-size_vector(i);
    binary_matrix(i,:) = [zeros(1,zero_padding), a];
end
dlmwrite("binary_matrix.txt", binary_matrix)
