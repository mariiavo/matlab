clc
clear

var1 = 37;
var2 = 128;
var3 = 215;
var=[var1, var2, var3]
for i=1:length(var)
    if var(i)>125
        disp('Larger')
    elseif var(i)==125
        disp('Equal')
    else
        disp('Smaller')
    end
end
sortvar=sort(var)
