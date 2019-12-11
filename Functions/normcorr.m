function [normcorr] = normcorr(sig1,sig2)
%normcorr Returns the normalised correlation
%   This function returns the absolute normalised correlation of the two
%   inputted signals. This is a standard equation.
%   
%   E.g. [normcorr] = normcorr(sig1,sig2)
%   normcorr = abs((sum(sig1.*sig2))/(sqrt((sum(sig1.*sig1))*(sum(sig2.*sig2)))));

%% Normalised Correlation Function
% Alex Healion - C15399731

normcorr = abs((sum(sig1.*sig2))/(sqrt((sum(sig1.*sig1)).*(sum(sig2.*sig2)))));

end