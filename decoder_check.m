function [continue_decoding] = decoder_check(decoded_message, parity_rows, position_rows)

total_sum = 0;
for i = 1:length(position_rows)
    if position_rows(i) ~= position_rows(end)
        position_of_parities = parity_rows(position_rows(i):position_rows(i+1)-1);
    else
        position_of_parities = parity_rows(position_rows(i):end);
    end
    total_sum = total_sum + mod(sum(decoded_message(position_of_parities)),2);
end
if total_sum ~= 0
    continue_decoding = true;
else 
    continue_decoding = false;
end
end

