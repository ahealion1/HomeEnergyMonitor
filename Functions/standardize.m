function [standardize] = standardize(sig)
%standardize Standardizes the input signal
%   This function standardizes the input signal by zero meaning it and
%   giving it unit variance. Standard standardization equation.
%   
%   E.g. [standardize] = standardize(sig)
%   standardize = (sig-mean(sig))/std(sig);

%% Standardize Function
% Alex Healion - C15399731

standardize = (sig-mean(sig))/std(sig);

end