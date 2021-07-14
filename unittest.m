%  parities = [1, 3, 4, 6, 8 1 2 7];
%   position = [1 4 6 8];
% % %hex2binary
%   rows = 2;
%   columns = 2;
%   word = (rand(8,1) > 0.5)';
%   G = [1 0 1 1 0 1 0 1; 1 1 0 1 1 0 1 0; 1 1 1 0 0 1 0 1; 0 1 1 1 1 0 1 0; 1 1 0 0 0 0 1 0; 0 1 1 0 0 0 0 1; 0 0 1 1 1 0 0 0; 1 0 0 1 0 1 0 0];
% %G = Generator_Matrix;
% %parities = Rows_Parity_bits;
% %position = position_Rows;
  block = 4;
  expectedCodeword = word*G;
  expectedCodeword = mod(expectedCodeword, 2)';
%  expectedCodeword = expectedCodeword(4097:end);
  outCodeword = encoder(word, parities,position, rows, columns, block);
% 
  test = outCodeword == expectedCodeword;
  disp(sum(test))
% % %disp(test)
% % if (sum(test)~= length(test))
% %     disp('ERROR in Encoder')
% %     return
% % end
% % % position_rows = [1 7 13 19 25 29 33 37];
% % % parities_rows = [1 2 3 5 8 9 2 3 4 5 6 10 1 3 4 6 7 11 1 2 4 7 8 12 2 4 7 13 1 3 8 14 2 4 5 15 1 3 6 16];
% % % parities_columns = [1, 3, 4,6,8,1,2,5,5,7,1,2,3,6,8,2,3,4,5,7,1,2,7,2,3,8,3,4,5,1,4,6,1,2,3,4,5,6,7,8];
% % % position_columns = [1,6,11,16,21,24,27,30,33,34,35,36,37,38,39,40];
% % % 
% % % message = [word outCodeword']; 
% % %received_word = [0.3 0.8 -0.1 0.1 0.15 0.7 0.9 1 -0.1 0.87 0.65 0.72 0.2 0.8 0.7 0.3];
% % 
% % received_word =  message + normrnd(0,0.1,1,length(message));
% parities_rows = [2 3 1 2 4 1 5 2 6];
% position_rows = [1 3 6 8];
% parities_columns = [2 3 1 2 4 1 2 3 4];
% position_columns = [1 3 6 7 8 9];
% %received_word = [0.7 -1.2 0.3 1.1 -0.1 -0.8];
% codeword = [1 0 0 1 1 0];
% bpsk = ones(size(codeword));
% for i = 1:length(codeword)
%     if codeword(i) == 0
%         bpsk(i) = -1;
%     end
% end
% received_word = bpsk + normrnd(0,0.1,1,length(bpsk));
% initial_word = decoder(received_word, parities_rows, parities_columns, position_rows, position_columns, 0.1);
% test = initial_word == codeword';
% disp(test)
% return
% H = [1 1 1 0; 0 1 0 1];
% parities_rows = [1 2 3 2 4];
% position_rows = [1 4];
% parities_columns = [1 1 2 1 2];
% position_columns = [1 2 4 5];
% 
% G = [1 0 1 0; 0 1 1 1];
% w = [1 0];
% codeword = w*G;
% bpsk = ones(size(codeword));
% for i = 1:length(codeword)
%     if codeword(i) == 0
%         bpsk(i) = -1;
%     end
% end
% received_word = bpsk + normrnd(0,0.1,1,length(bpsk));
% initial_word = decoder(received_word, parities_rows, parities_columns, position_rows, position_columns, 0.1);
% test = initial_word == codeword';
% disp(test)
% disp(a)
% paritiesForDecoder
% 
% parities_rows = Rows_Parity_bits;
% position_rows = position_Rows;
% position_columns = position_Columns;
% parities_columns = Columns_Parity_bits;
% 
% codeword = (rand(1,4096) > 0.5);
% encoded_message = codeword*Generator_Matrix;
% encoded_message = mod(encoded_message,2);
% bpsk = ones(size(encoded_message));
% for i = 1:length(codeword)
%     if codeword(i) == 0
%         bpsk(i) = -1;
%     end
% end
% 
% received_word = bpsk + normrnd(0,0.1,1,length(bpsk));
% initial_word = decoder(received_word, parities_rows, parities_columns, position_rows, position_columns, 0.1);
% test = initial_word == codeword';
% disp(test)


% initial_word = rand(1,4096) > 0.5;
% GeneratorMatrix
% 
% encoded_word = initial_word*Generator_Matrix;
% encoded_word = mod(encoded_word,2);
 
% paritiesForEncoder
% 
% encoded = encoder(initial_word, Rows_Parity_bits, position_Rows, 32, 8, 128);
% 
% test1 = sum(encoded_word==encoded');
% paritiesForDecoder
% 
% bpsk = ones(size(encoded_word));
% for i = 1:length(encoded_word)
%     if encoded_word(i) == 0
%         bpsk(i) = -1;
%     end
% end
% 
% parities_rows = Rows_Parity_bits;
% position_rows = position_Rows;
% position_columns = position_Columns;
% parities_columns = Columns_Parity_bits;
% received_word = bpsk + normrnd(0,0.2,1,length(bpsk));
% initial_message = decoder(received_word, parities_rows, parities_columns, position_rows, position_columns, 0.2);
% test = initial_word == initial_message(1:4096)';
% disp(sum(test))
% disp(a)
