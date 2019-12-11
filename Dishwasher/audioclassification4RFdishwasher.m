%% Audio Classification - 4 Random Forest (Background Noise - Dishwasher)
% Alex Healion - C15399731
                                                         %#ok<*SAGROW,*ASGLU,*NASGU,*NBRAK>
%% Run Data Processing and Compilation
load('dishwasherdata1.mat');                                        % Load in training data without test data

%% Inputting to Random Forest (Bagged Trees)
param_loop_num = 10;                                                % Set the number of parameter testing loops
loop_num = 10;                                                      % Set the number of loops for verifying results
test_1_resultsRFdishwasher = zeros(param_loop_num,loop_num+2);      % Pre-allocating the array for speed
test_2_resultsRFdishwasher = zeros(param_loop_num,loop_num+2);
test_3_resultsRFdishwasher = zeros(param_loop_num,loop_num+2);
test_4_resultsRFdishwasher = zeros(param_loop_num,loop_num+2);
test_1_opRFdishwasher = cell(param_loop_num,loop_num);              % Pre-allocating the array for speed
test_2_opRFdishwasher = cell(param_loop_num,loop_num);
test_3_opRFdishwasher = cell(param_loop_num,loop_num);
test_4_opRFdishwasher = cell(param_loop_num,loop_num);
[bn,fs] = audioread('backgroundnoise2.mp3');                        % Read in background noise

bnlevel = 1.5;                                                      % Set level of background noise
noTrees = 50;                                                       % Set number of decision trees to grow
noPredictors = 7;                                                   % Set number of features to train with
for param_loop = 1:param_loop_num                                   % Parameter testing for loop
    for loop = 1:loop_num                                           % Verification for loop
        
        if param_loop == 1                                          % Testing different back. noise levels with param loop
            bnlevel = 0;
        elseif param_loop == 2
            bnlevel = 0.5;
        elseif param_loop == 3
            bnlevel = 0.8;
        elseif param_loop == 4
            bnlevel = 1;
        elseif param_loop == 5
            bnlevel = 1.1;
        elseif param_loop == 6
            bnlevel = 1.2;
        elseif param_loop == 7
            bnlevel = 1.3;
        elseif param_loop == 8
            bnlevel = 1.5;
        elseif param_loop == 9
            bnlevel = 1.8;
        elseif param_loop == 10
            bnlevel = 2;
        end
        
        baggedtree = TreeBagger(noTrees,inputs.',targets.','NumPredictorsToSample',noPredictors,'Options',statset('UseParallel',true));
                                                    % Growing random forest from noTrees, noPredictors, inputs and targets
        % Test 1
        [testaudio1,fs] = audioread('dishwasher_10cm_2.mp3');      % Read in test audio
        test = merge(testaudio1,bn,1,bnlevel);                      % Use merge function to add background noise
        [test_cent,test_benergy,test_flux,test_rollofffreq] = lowlevelfeatures(test,fs);    % Create low level features using function
        test_MFCCoeffs = mymfcc(test,fs);                           % Create MFCC features using function
        test_comp = [test_cent;test_benergy;test_flux;test_rollofffreq;test_MFCCoeffs(:,1:length(test_cent))];  % Compile all features

        test_1_opRFdishwasher{param_loop,loop} = (predict(baggedtree,test_comp.')).';    % Input test features into random forest to get outputs
        test_1_resultsRFdishwasher(param_loop,loop) = sum(count(test_1_opRFdishwasher{param_loop,loop},'dishwasher'))/length(test_1_opRFdishwasher{param_loop,loop});    % Get output results
        test_1_resultsRFdishwasher(param_loop,loop_num+2) = (sum(test_1_resultsRFdishwasher(param_loop,1:loop_num))/loop_num);  % Get average of results
        clear test test_cent test_benergy test_flux test_rollofffreq test_MFCCoeffs test_comp;  % Clear unwanted variables
                                                                    % Same for other tests
        % Test 2
        [testaudio2,fs] = audioread('f_dishwasher_1.mp3');
        test = standardize(testaudio2);
        [test_cent,test_benergy,test_flux,test_rollofffreq] = lowlevelfeatures(test,fs);
        test_MFCCoeffs = mymfcc(test,fs);
        test_comp = [test_cent;test_benergy;test_flux;test_rollofffreq;test_MFCCoeffs(:,1:length(test_cent))];

        test_2_opRFdishwasher{param_loop,loop} = (predict(baggedtree,test_comp.')).';
        test_2_resultsRFdishwasher(param_loop,loop) = sum(count(test_2_opRFdishwasher{param_loop,loop},'dishwasher'))/length(test_2_opRFdishwasher{param_loop,loop});
        test_2_resultsRFdishwasher(param_loop,loop_num+2) = (sum(test_2_resultsRFdishwasher(param_loop,1:loop_num))/loop_num);
        clear test test_cent test_benergy test_flux test_rollofffreq test_MFCCoeffs test_comp;

        % Test 3
        [phonetestaudio3,phonefs] = audioread('phone_dishwasher5.wav');
        phonetest_stereo = resample(phonetestaudio3,fs,phonefs);    % Resample from 48kHz to 44.1kHz
        phonetest = mean(phonetest_stereo,2);                       % Stereo to mono
        phonetest = merge(phonetest,bn,1,bnlevel);
        [phonetest_cent,phonetest_benergy,phonetest_flux,phonetest_rollofffreq] = lowlevelfeatures(phonetest,fs);
        phonetest_MFCCoeffs = mymfcc(phonetest,fs);
        phonetest_comp = [phonetest_cent;phonetest_benergy;phonetest_flux;phonetest_rollofffreq;phonetest_MFCCoeffs(:,1:length(phonetest_cent))];

        test_3_opRFdishwasher{param_loop,loop} = (predict(baggedtree,phonetest_comp.')).';
        test_3_resultsRFdishwasher(param_loop,loop) = sum(count(test_3_opRFdishwasher{param_loop,loop},'dishwasher'))/length(test_3_opRFdishwasher{param_loop,loop});
        test_3_resultsRFdishwasher(param_loop,loop_num+2) = (sum(test_3_resultsRFdishwasher(param_loop,1:loop_num))/loop_num);
        clear phonetest_stereo phonetest phonetest_cent phonetest_benergy phonetest_flux phonetest_rollofffreq phonetest_MFCCoeffs phonetest_comp;
        
        % Test 4
        [phonetestaudio4,phonefs] = audioread('f_phone_dishwasher1.wav');
        phonetest_stereo = resample(phonetestaudio4,fs,phonefs);
        phonetest = mean(phonetest_stereo,2);
        phonetest = standardize(phonetest);
        [phonetest_cent,phonetest_benergy,phonetest_flux,phonetest_rollofffreq] = lowlevelfeatures(phonetest,fs);
        phonetest_MFCCoeffs = mymfcc(phonetest,fs);
        phonetest_comp = [phonetest_cent;phonetest_benergy;phonetest_flux;phonetest_rollofffreq;phonetest_MFCCoeffs(:,1:length(phonetest_cent))];

        test_4_opRFdishwasher{param_loop,loop} = (predict(baggedtree,phonetest_comp.')).';
        test_4_resultsRFdishwasher(param_loop,loop) = sum(count(test_4_opRFdishwasher{param_loop,loop},'dishwasher'))/length(test_4_opRFdishwasher{param_loop,loop});
        test_4_resultsRFdishwasher(param_loop,loop_num+2) = (sum(test_4_resultsRFdishwasher(param_loop,1:loop_num))/loop_num);
        clear phonetest_stereo phonetest phonetest_cent phonetest_benergy phonetest_flux phonetest_rollofffreq phonetest_MFCCoeffs phonetest_comp;

        fprintf('ParamLoop: %d Loop: %d     ',param_loop,loop);     % Print current param_loop and loop for progress indication
    end
end

clear testaudio1 testaudio2 phonetestaudio3 phonetestaudio4 bn trainratio valratio fs phonefs;  % Clear unwanted audio and variables

resultssummaryRF = [test_1_resultsRFdishwasher(:,end) test_2_resultsRFdishwasher(:,end) test_3_resultsRFdishwasher(:,end) test_4_resultsRFdishwasher(:,end)];
resultssummaryRF(:,end+2) = mean(resultssummaryRF(:,1:4),2);        % Compile and summarise test results with average
