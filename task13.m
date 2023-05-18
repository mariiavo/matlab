clc
clear

vec= [5, 6, 1, 2, 2, 5, 3, 4 -2];
matrix=sparse2matrix(vec)

function matrix=sparse2matrix(vec)
rows=vec(1);
columns=vec(2);
defolt=vec(3);
matrix=ones(rows,columns)*defolt;
times=(length(vec)-3)/3;
for i=1:times
    forrow=(3*i)+1;
    row=vec(forrow);
    forcol=(3*i)+2;
    col=vec(forcol);
    fornum=(3*i)+3;
    num=vec(fornum);
    matrix(row,col)=num;
end

end