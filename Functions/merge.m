function [mergedsig,sig1,sig2] = merge(sig1,sig2,sig1level,sig2level)
%merge Merges the input signals
%   This function merges the input signals and can vary the perceived loudness levels of the inputs.
%   The merged signal is returned and also the two signals if specified.
%   
%   E.g. [mergedsig,sig1,sig2] = merge(sig1,sig2,sig1level,sig2level)

%% Merge Function
% Alex Healion - C15399731

if length(sig2) >= length(sig1)                         %#ok<*NASGU>
    sig2 = sig2(1:length(sig1));						% Make both signals the same length
else
    sig1 = sig1(1:length(sig2));
end

sig1 = standardize(sig1);								% Standardize both signals
sig2 = standardize(sig2);
sig1 = sig1./sqrt(1000);								% Reduce the volume of both signals
sig2 = sig2./sqrt(1000);

sig1energy = sum(abs(sig1).^2)/length(sig1);			% Get the signal energies for reference
sig2energy = sum(abs(sig2).^2)/length(sig2);

sig1leveldB = 10*log2(sig1level);						% Convert the desired volume level change into dB
sig1levelenergy = 10^(sig1leveldB/10);					% and then into energy
sig2leveldB = 10*log2(sig2level);
sig2levelenergy = 10^(sig2leveldB/10);

sig1 = sig1.*sig1levelenergy;							% Apply the energy level change
sig2 = sig2.*sig2levelenergy;

mergedsig = mean([sig1 sig2],2);						% Merge the two levelled signals
mergedsig = standardize(mergedsig);                     % Standardize again

end
