function [initial_word] = decoder(received_message, parity_rows, parity_columns, position_rows,...
    position_columns, noise_var)


size_message = length(received_message);
size_parity = length(parity_columns);

initial_word = zeros(size_message,1);
initial_decoded_message = zeros(size_message,1);
for i=1:size_message
    initial_decoded_message(i) = 1/(1 + exp(-2*received_message(i)/noise_var));
end

q0 = zeros(size_parity,1);
q1 = zeros(size_parity,1);
Q0 = zeros(size_message,1);
Q1 = zeros(size_message,1);
r0 = zeros(size_parity,1);
r1 = zeros(size_parity,1);

for i=1:size_parity
    temp = parity_rows(i);
    q1(i) = initial_decoded_message(temp);
    q0(i) = 1 - q1(i);
end
a = 5;
while a >0
    
    row_nodes = ones(length(position_rows),1);
    column_nodes = ones(length(position_columns),1);
    
    for i=1:size_parity
        position_of_parity = parity_columns(i);
        this_parity = position_rows(position_of_parity);
        if this_parity ~= position_rows(end)
            next_parity = position_rows(position_of_parity + 1);
            length_of_parity = next_parity - this_parity;
        else
            length_of_parity = length(parity_rows(this_parity:end));
        end
        vector_with_q1 = zeros(length_of_parity,1);
        for j=0:length_of_parity-1
            vector_with_q1(j+1) = q1(this_parity + j);
        end
        temp = 1;
        for k=1:length_of_parity
            if k~=row_nodes(position_of_parity)
                pos = 1 - 2*vector_with_q1(k);
                temp = temp*pos;
            end
        end
        row_nodes(position_of_parity) = row_nodes(position_of_parity) + 1; 
        r0(i) = 0.5 + 0.5*temp;
        r1(i) = 1 - r0(i);
    end
    for i=1:size_parity
        position_of_parity = parity_rows(i);
        possibility_1 = initial_decoded_message(position_of_parity);
        this_parity = position_columns(position_of_parity);
        if this_parity ~= position_columns(end)
            next_parity = position_columns(position_of_parity + 1);
            length_of_parity = next_parity - this_parity;
        else
            length_of_parity = length(parity_columns(this_parity:end));
        end
        vector_with_r1 = zeros(length_of_parity,1);
        vector_with_r0 = zeros(length_of_parity,1);
        for j=0:length_of_parity-1
            vector_with_r1(j+1) = r1(this_parity + j);
            vector_with_r0(j+1) = r0(this_parity + j);
        end
%         vector_with_r1 = vector_with_r1/min(vector_with_r1);
%         vector_with_r0 = vector_with_r0/min(vector_with_r0);
        temp0 = 1; temp1 = 1; temp = 1; b = 0;
        for k=1:length_of_parity
            if (k ~= column_nodes(position_of_parity))
                temp0 = temp0 * vector_with_r0(k);
                temp1 = temp1 * vector_with_r1(k);
%                 if temp1 < 1e-03
%                     b = b +1;
%                 end
%                 if b > 10
%                     aa = 0;
%                 end
                temp = temp*temp1/temp0;
            end
        end
        column_nodes(position_of_parity) = column_nodes(position_of_parity) + 1;
        q0(i) = (1 - possibility_1)*temp0;
        q1(i) = possibility_1*temp1;
        K = 1/(q0(i) + q1(i));
        q0(i) = q0(i)*K;
        q1(i) = q1(i)*K;  
    end
    for i=1:size_message
        position_of_parity = parity_rows(i);
        this_parity = position_columns(i);
        possibility_1 = initial_decoded_message(position_of_parity);
        if this_parity~= position_columns(end)
            next_parity = position_columns(i+1);
            length_of_parity = next_parity - this_parity;
        else
            length_of_parity = length(parity_columns(this_parity:end));
        end
        vector_with_r0 = zeros(length_of_parity,1);
        vector_with_r1 = zeros(length_of_parity,1);
        for j=0:length_of_parity -1 
            vector_with_r0(j+1) = r0(this_parity + j);
            vector_with_r1(j+1) = r1(this_parity + j);
        end
        temp0 = 1; temp1 = 1;
        for k=1:length_of_parity
            temp0 = temp0*vector_with_r0(k);
            temp1 = temp1*vector_with_r1(k);
        end
        Q0(i) = (1 - possibility_1)*temp0;
        Q1(i) = possibility_1*temp1;
        K = 1/(Q0(i) + Q1(i));
        Q0(i) = Q0(i)*K;
        Q1(i) = Q1(i)*K;
    end
    for i = 1:length(Q0)
        if Q1(i) > Q0(i)
            initial_word(i) = 1;
        else
            initial_word(i) = 0;
        end
    end
a = a -1;
disp(sum(initial_word))
end
end

