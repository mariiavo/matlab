clc
clear

matrix=[1 48 -8 -10 15; 32 23 16 0 -4; -32 55 -12 8 6; 40 2 -10 2 1]
num_rows = size(matrix, 1);
num_cols=size(matrix, 2)
m=zeros(4, 3);
for i=1:num_rows
    m(i,1)=min(matrix(i,:));
    m(i,3)=max(matrix(i,:));
    m(i,2)=mean(matrix(i,:));
end
%disp(m)
window=3;
matrix_d = zeros(size(matrix, 1), size(matrix, 2));
for i=1:num_rows
    for j=1:num_cols
        value=matrix(i,j);
        minimum=value-(window-1)/2;
        maximum=value+(window-1)/2;
        Ineedit=[minimum, maximum];
        matrix_d(i,j)=mean(Ineedit);
    end
end
disp(matrix_d)

