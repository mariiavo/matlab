-clc
clear

data=importdata('data.mat');
%import file with data
start_signal=[1 -1 1 -1 1 1 -1 -1 1 1 ];
occure=strfind(data, start_signal);
nr_of_sequences = numel(occure)
%calculates how many times start signal occures

seq_lengths = diff([0 occure numel(data)+1]);
max_length = max(seq_lengths);
max_nr_of_temperature_values = max_length - numel(start_signal) - 8
%calculates the maximum number of temperature values from all the sequences

data_struc = zeros(nr_of_sequences, 10+8+max_nr_of_temperature_values);
%create a matrix 
for i = 1:nr_of_sequences
    seq_start = occure(i);
    if i == nr_of_sequences
        seq_end = numel(data);
    else
        seq_end = occure(i+1)-1;
    end

    temperature = data(seq_start+18:seq_end);
    %defines the temperature values
    data_struc(i, 1:10) = data(seq_start:seq_start+9);
    %stores start sequence in the beginning of each row
    data_struc(i, 11:18) = data(seq_start+10:seq_start+17);
    data_struc(i, 19:18+length(temperature)) = temperature;
    %stores day count code and temperature values
end

disp(data_struc)

data_clean=zeros(nr_of_sequences, 2);
for i= 1:nr_of_sequences
    moment_seq=data_struc(i, 11:18);
    data_clean(i,1)=bi2de(data_struc(i,11:18),2,'left-msb');
    data_clean(i,2)=mean(data_struc(i,19:end));
    %converts binary code to day number
end
data_clean=sortrows(data_clean);
disp(data_clean)

stem(data_clean(:,1), data_clean(:,2))
%displays the graph
xlabel('Days')
ylabel('Temperature')
title('Temperature on newly discovered planet')

%The temperature amplitude on this planet is big: -60 to +96. Unfortunately, any creature from Earth can not live in such conditions.  The temperature on the planet changed significantly after day 115. That probably means that the season has changed and taking into account that the temperature has risen - the summer started :)
