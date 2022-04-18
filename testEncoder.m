paritiesForEncoder
GeneratorMatrix

parities = Rows_Parity_bits;
position = position_Rows;
block = 128;
rows = 32;
columns = 8;

initial_word = (rand(4096,1) > 0.5)';

expected_codeword = initial_word*Generator_Matrix;
expected_codeword = mod(expected_codeword,2);
expected_codeword = expected_codeword(4097:end)';

out_word = encoder(initial_word, parities, position, rows, columns, block);

test = out_word == expected_codeword;
disp(sum(test))