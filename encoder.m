function [encoded_message] = encoder(message, parities, position, rows, columns, block)

encoded_message = zeros(8,1);
for row = 1:rows
    for column = 1:columns
        index = (row-1)*columns + column;
        thisParity = position(index);
        if thisParity~=position(end)
            nextParity = position(index+1);
            parityLength = nextParity - thisParity;
        else
            parityLength = length(parities(thisParity:end));
        end
        for i = 0:parityLength-1
            parity = parities(thisParity + i) - (column-1)*block;
            for j=0:block-1
                temp = parity+j;
                if (temp > block)
                    temp = temp - block;
                end
                encoded_message((column-1)*block + temp) = encoded_message((column-1)*block + temp) + message((row-1)*block + j +1);
            end
        end
    end
end         
%     for i=1:length(parities)
%         thisParity = parities(i);
%         for j=0:block-1
%             temp = thisParity + j;
%             if (temp > block)
%                 temp = temp - block;
%             end
%             encoded_message(temp) = encoded_message(temp) + message(j+1);
%         end
%     end
encoded_message = mod(encoded_message,2);
end

% void encoder(const uint16_t Parity_positions[], const uint16_t position_of_Parities[], int * encoded_message, const int message[], uint16_t Generator_rows, uint16_t Generator_columns, uint16_t size_square_cyclic_matrix){
% 
%     for (int row = 0; row < Generator_rows; row++){
%         for (int column = 0; column < Generator_columns; column++){
%             uint16_t position_of_this_parity = position_of_Parities[row+column];
%             uint16_t position_of_next_parity = position_of_Parities[row+column+1];
%             int length_of_parity_submatrix = position_of_next_parity - position_of_this_parity;
%             for (int i = 0; i<length_of_parity_submatrix; i++){
%                 uint16_t parity = Parity_positions[position_of_this_parity+i];
%                 uint16_t position_in_square_matrix = parity % size_square_cyclic_matrix;
%                 for (int j=0; j<size_square_cyclic_matrix; j++){
%                     if (position_in_square_matrix + j < size_square_cyclic_matrix){
%                         encoded_message[size_square_cyclic_matrix*column + position_in_square_matrix + j] ^= message[parity + j];
%                     } else{
%                         encoded_message[size_square_cyclic_matrix*column + position_in_square_matrix + j - size_square_cyclic_matrix] ^= message[parity + j - size_square_cyclic_matrix]; 
%                     }
%                 }
%             }
%         }
%     }
% 
% }
