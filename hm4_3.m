clc
clear

vec = [1 2 3 4 5];
csum = mycumulativesumfunc(vec)

function csum = mycumulativesumfunc(vec)
    len = length(vec);
    csum = zeros(1, len);
    csum(1) = vec(1);
    for i = 2:len
        csum(i) = csum(i-1) + vec(i);
    end
end