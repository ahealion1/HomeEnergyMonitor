function Xfinal = mymfcc(sig,fs)
%mymfcc Will return a series of 26 MFCC coefficients
%   This function returns 26 MFCC coefficients found using my own MFCC
%   function.
%   
%   E.g. coeffs = mymfcc(sig,fs)

%% MFCC Function
% Alex Healion - C15399731

%% Frame Signal
T = 8192/fs;                                            % Shows the length of a frame in secs
N = 8192;                                               % Frame length in samples
frameoverlap = 0.5;                                     % Percentage frame overlap (50%)
H = N*(1-frameoverlap);                                 % Sets the step size accordingly
M = floor((length(sig)-N)/H);                           % Sets the max number of frames
xprewin = zeros(N,M);                                   % Pre-allocating array
for m = 1:M
    n = 1:N;
    xprewin(:,m) = sig((m.*H)+n);                      	% Splits signal into described frames
end                                                     %#ok<*NASGU>
clear sig;

%% Window Signal Frames
win = hamming(N);                                       % Creates a hamming window
x = zeros(N,M);
for m = 1:M
    x(:,m) = (xprewin(:,m).*win);                    	% Applies window to frames
end

%% Find Power Spectrum
Xamp = abs(fft(x));                                     % Calculates the DFT
Xposfreq = Xamp(1:(end/2),:);                           % Truncates neg frequencies
X = Xposfreq.^2;                                        % Gets the power spectrum by squaring the
                                                        % amplitude (for energy)
%% Implement Mel Filterbank
filterbanknum = 26;                                             % Total number of desired coefficients
minfreq = 0;                                                    % Lowest frequency in filterbank
maxfreq = fs/2;                                                 % Highest frequency in filterbank
minfreqmel = 1125*log(1+(minfreq/700));                         % Lowest freq converted to mel scale
maxfreqmel = 1125*log(1+(maxfreq/700));                         % Highest freq converted to mel scale
melgap = (maxfreqmel-minfreqmel)/(filterbanknum+1);             % Gap between each mel value
melpoints = minfreqmel:melgap:maxfreqmel;                       % Mel points for filters
freqfilterpoints = 700*(exp(melpoints/1125)-1);                 % Filter points converted back to freq (now log scale)
binfilterpoints = floor(freqfilterpoints*(N/fs));               % Freq scale to bin values
for l = 2:length(melpoints)-1
    filtwidth = (binfilterpoints(l+1)-binfilterpoints(l-1));    % Width of each filter (used to normalise)
    for k = 0:(maxfreq.*N/fs)-1                                 % Loop will create triangular bandpass filters
        if (k < binfilterpoints(l-1))                           % width of filters will increase logarithmically
            H(k+1,l-1) = 0;
        elseif (k >= binfilterpoints(l-1)) && (k <= binfilterpoints(l))
            H(k+1,l-1) = (((k-binfilterpoints(l-1))/(binfilterpoints(l)-binfilterpoints(l-1))));    %/filtwidth removed
        elseif (k >= binfilterpoints(l)) && (k <= binfilterpoints(l+1))
            H(k+1,l-1) = (((binfilterpoints(l+1)-k)/(binfilterpoints(l+1)-binfilterpoints(l))));
        elseif (k > binfilterpoints(l+1))
            H(k+1,l-1) = 0;
        end
    end
end

%% Apply Filterbank
Xfiltenergy = zeros(filterbanknum,M);
for m = 1:M
    for l = 1:filterbanknum
        Xfiltenergy(l,m) = sum(X(:,m).*H(:,l));       	% Filterbank is applied to each periodogram
    end                                                	% and energy is summed for each filter
end

%% Take Log of Summed Energy (for dB)
Xfiltpower = 20.*log10(Xfiltenergy);                    % Summed energy is converted to dB scale

%% Apply Discrete Cosine Transform
XDCT = dct(Xfiltpower);                               	% DCT is applied to each dB value

%% Final Value
Xfinal = XDCT;                                  % Final mel-frequency cepstral coefficients


end