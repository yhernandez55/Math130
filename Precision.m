clear all
clc
n=6;

output = dec2bin(2^n-1:-1:0)-'0';

for j = 1:size(output,1)
    nums(j) = bin2dec_6bi(output(j,:)); % translates binary to decimal
end
x_axis = zeros(size(output,1),1);
figure(1)
plot(nums,x_axis,'ro')
grid on

function dec_val = bin2dec_6bi(output)
% sign of number
sign = (-1)^output(1);
% states all 1 and 0's
if ((output(2)==1 && output(3)==1)||(output(2)==0 && output(3)==0))
    dec_val = 0;
else
    % sum for the exponent
    % c=0 easily increment
    c = 0;
    for j = 3:-1:2 % change this for 9 bit 5: 
        c = c + output(j)*2^(3-j);
    end
    % for mentissa
    f = 0;
    for k = 4:6 % change 6 to 9
        f = f + output(k)*(1/2^(k-3)); %k-4
    end
    
    dec_val = sign * 2^(c-1) *(1+f);
end
end
% What can you say about distribution of these numbers on the real line in terms
%of how well they cover the represented interval?
% between the interval (-2,-1) and (1,2) the distribuition of these numbers
% are bunched up and the interval from (-4,-2) are distributed by 0.25 as
% well as from (2,4)


%What is the largest and what is the smallest in absolute value number that can
%be represented with this system?
% The largest in absolute value number that can be represented with this
% system is 3.75, while the smallest is 0.

% Modify your program to increase the bits available to 8 and plot the numbers
% represented with 4 bits for the exponent and 4 bits for the mantissa. What
% changed?
% The distritbuition are more bunched up compared to the six bit. 

% Are the small numbers between 0 and 1 represented well by the 6- and 8-bit
% systems? If yes, which of these systems represents the interval [0,1] better? If
% no, then how can you modify your finite-precision system to get this interval to
% be represented better?
%When we changed the parameters to the 9 bit the small numbers from 0 to 1
%where being represented better than the 6 bit. There was no representation 
%of the small numbers in the 6 bit percision  
