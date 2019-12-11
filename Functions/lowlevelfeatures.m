function [centroid,energy,flux,rollofffreq] = lowlevelfeatures(sig,fs)
%lowlevelfeatures Will return a series of four low level audio features
%   This function returns the spectral centroid, band energy, spectral flux
%   and spectral roll off frequencies of the input sig.
%   Inputs are signal sig and sample rate fs.
% 	Outputs the four audio features, each in an array.
%   
%   E.g. [c,e,f,rf] = lowlevelfeatures(sig,fs)

%% Low Level Feature Function
% Alex Healion - C15399731

%% Frame Signal
N = fs/10;                                            	% Length to look at is 0.1s
frameoverlap = 0;                                       % No overlap
H = N*(1-frameoverlap);
M = floor((length(sig)-N)/H);                           % The total number of frames in x1
xprewin = zeros(N,M);                                   % Pre-allocating array
for m = 1:M
    n = 1:N;
    xprewin(:,m) = (sig((m.*H)+n));                     %#ok<*NASGU>
end
clear sig;

%% Window Signal Frames
win = hamming(N);                                       % Creates a hamming window
x = zeros(N,M);
for m = 1:M
    x(:,m) = xprewin(:,m).*win;                         % Applies window to frames
end

%% Get DFT of Frames (using built-in FFT)
n = n.';
Xposnegfreq = zeros(N,M);
for m = 1:M
    Xposnegfreq(:,m) = abs(fft(x(:,m)));        % Calculates the magnitude frequency
end                                             % spectrum for each windowed frame
X = Xposnegfreq(1:N/2,:);                       % Truncates the negative frequencies

%% Spectral Centroid
centroid = zeros(1,M);
for m = 1:M
    k = (1:(N/2)).';
	centroid(:,m) = sum(k.*X(k,m))/sum(X(k,m));         % The centroid will equal the weighted
end                                                   	% mean of the freq. magnitude spectrum

%% Band Energy
numbands = 10;                                          % Number of energy bands to split into
bandstep = floor(size(X,1)/numbands);
energy = zeros(numbands,M);
for m = 1:M
    for i = 1:numbands
        k = (((i-1)*bandstep+1):(i*bandstep)).';        % Indices for each band
        energy(i,m) = sum((X(k,m).^2));                 % Calculates the energy in each band
    end
end

%% Spectral Flux
Xprev = 0;
flux = zeros(1,M);
Xprev = zeros(size(X,1),1);
for m = 1:M
    X(:,m) = X(:,m)/max(X(:,m));                        % Normalises amplitudes
    flux(m) = sum((X(:,m) - Xprev).^2);                 % The spec. flux is the sum of the squared
    Xprev = X(:,m);                                     % difference between magnitude spectrum values
end                                                   	% Compares current and previous frame of signal

%% Spectral Roll Off
energyperc = 0.85;                                      % Roll off freq when 85% of energy is below
totalenergy = zeros(1,M);
rolloffenergy = zeros(1,M);
currentenergy = zeros(1,M);
rollofffreq = zeros(1,M);
for m = 1:M
    totalenergy(:,m) = sum((X(:,m)).^2);                % Calculates total energy for the spectrum
    rolloffenergy(m) = totalenergy(:,m).*energyperc;   	% Calculates 85% of it
    currentenergy(m) = 0;
    k = 1;
    while(currentenergy(m) <= rolloffenergy(m))        	% Runs until 85% value is reached
        currentenergy(m) = sum((X(1:k,m).^2));        	% Current energy is energy from 0th bin to kth bin
        k = k + 1;
    end
    rollofffreq(m) = k*(fs/N);                        	% Roll off freq is where 70% of the spectrum's
end                                                   	% energy is below that freq


end