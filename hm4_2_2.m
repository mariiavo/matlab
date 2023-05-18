clc
clear

n=linspace(-5,1);
exponen=exp(-n);
z=5*exponen.*sin(n);
stem(n,z)