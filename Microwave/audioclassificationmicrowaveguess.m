%% Audio Classification - Microwave Guess Script
% Alex Healion - C15399731
                                                         %#ok<*SAGROW,*ASGLU,*NASGU,*NBRAK,*FNDSB>
%% Load Data
audioclassification4NNmicrowave                                     % Run both Neural Network (NN) and Random Forest (RF) classification scripts
audioclassification4RFmicrowave

clearvars -except resultssummaryNN resultssummaryRF test_1_opNNmicrowave test_2_opNNmicrowave test_3_opNNmicrowave test_4_opNNmicrowave test_1_opRFmicrowave test_2_opRFmicrowave test_3_opRFmicrowave test_4_opRFmicrowave loop_num param_loop_num
                                                                    % Clear unwanted variables
%% Analysing Results
for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Convert RF output from labels to binary vectors
        test_1_opRFmicrowave{param_loop,loop} = [ismember(test_1_opRFmicrowave{param_loop,loop},'kettle');ismember(test_1_opRFmicrowave{param_loop,loop},'washingmachine');ismember(test_1_opRFmicrowave{param_loop,loop},'microwave');ismember(test_1_opRFmicrowave{param_loop,loop},'dishwasher')];
        test_2_opRFmicrowave{param_loop,loop} = [ismember(test_2_opRFmicrowave{param_loop,loop},'kettle');ismember(test_2_opRFmicrowave{param_loop,loop},'washingmachine');ismember(test_2_opRFmicrowave{param_loop,loop},'microwave');ismember(test_2_opRFmicrowave{param_loop,loop},'dishwasher')];
        test_3_opRFmicrowave{param_loop,loop} = [ismember(test_3_opRFmicrowave{param_loop,loop},'kettle');ismember(test_3_opRFmicrowave{param_loop,loop},'washingmachine');ismember(test_3_opRFmicrowave{param_loop,loop},'microwave');ismember(test_3_opRFmicrowave{param_loop,loop},'dishwasher')];
        test_4_opRFmicrowave{param_loop,loop} = [ismember(test_4_opRFmicrowave{param_loop,loop},'kettle');ismember(test_4_opRFmicrowave{param_loop,loop},'washingmachine');ismember(test_4_opRFmicrowave{param_loop,loop},'microwave');ismember(test_4_opRFmicrowave{param_loop,loop},'dishwasher')];
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Convert vectors from logical to double
        test_1_opRFmicrowave{param_loop,loop} = double(test_1_opRFmicrowave{param_loop,loop});
        test_2_opRFmicrowave{param_loop,loop} = double(test_2_opRFmicrowave{param_loop,loop});
        test_3_opRFmicrowave{param_loop,loop} = double(test_3_opRFmicrowave{param_loop,loop});
        test_4_opRFmicrowave{param_loop,loop} = double(test_4_opRFmicrowave{param_loop,loop});
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Change chosen classifications from 1 to 0.95 for merging with NN
        test_1_opRFmicrowave{param_loop,loop} = 0.95.*test_1_opRFmicrowave{param_loop,loop};  % 0.95 chosen as it gave best results in testing
        test_2_opRFmicrowave{param_loop,loop} = 0.95.*test_2_opRFmicrowave{param_loop,loop};
        test_3_opRFmicrowave{param_loop,loop} = 0.95.*test_3_opRFmicrowave{param_loop,loop};
        test_4_opRFmicrowave{param_loop,loop} = 0.95.*test_4_opRFmicrowave{param_loop,loop};
    end
end

test_1_opcombinedmicrowave = cat(3,test_1_opNNmicrowave,test_1_opRFmicrowave);   % Concatenate NN and RF outputs
test_2_opcombinedmicrowave = cat(3,test_2_opNNmicrowave,test_2_opRFmicrowave);
test_3_opcombinedmicrowave = cat(3,test_3_opNNmicrowave,test_3_opRFmicrowave);
test_4_opcombinedmicrowave = cat(3,test_4_opNNmicrowave,test_4_opRFmicrowave);

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                               % Add these outputs
        test_1_opmicrowave{param_loop,loop} = test_1_opcombinedmicrowave{param_loop,loop,1} + test_1_opcombinedmicrowave{param_loop,loop,2};
        test_2_opmicrowave{param_loop,loop} = test_2_opcombinedmicrowave{param_loop,loop,1} + test_2_opcombinedmicrowave{param_loop,loop,2};
        test_3_opmicrowave{param_loop,loop} = test_3_opcombinedmicrowave{param_loop,loop,1} + test_3_opcombinedmicrowave{param_loop,loop,2};
        test_4_opmicrowave{param_loop,loop} = test_4_opcombinedmicrowave{param_loop,loop,1} + test_4_opcombinedmicrowave{param_loop,loop,2};
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Set the highest confidence prediction to 1 for all observations
        for i = 1:length(test_1_opmicrowave{param_loop,loop})
            [~,index] = max(test_1_opmicrowave{param_loop,loop});
            test_1_opmicrowave{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_2_opmicrowave{param_loop,loop})
            [~,index] = max(test_2_opmicrowave{param_loop,loop});
            test_2_opmicrowave{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_3_opmicrowave{param_loop,loop})
            [~,index] = max(test_3_opmicrowave{param_loop,loop});
            test_3_opmicrowave{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_4_opmicrowave{param_loop,loop})
            [~,index] = max(test_4_opmicrowave{param_loop,loop});
            test_4_opmicrowave{param_loop,loop}(index(i),i) = 1;
        end
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num           	% Sum the number of 1s for this appliance and divide by the total length. This gives the percentage vote for this appliance for each test
        test_1_resultsmicrowave(param_loop,loop) = sum(test_1_opmicrowave{param_loop,loop}(3,:)==1)/length(test_1_opmicrowave{param_loop,loop});
        test_2_resultsmicrowave(param_loop,loop) = sum(test_2_opmicrowave{param_loop,loop}(3,:)==1)/length(test_2_opmicrowave{param_loop,loop});
        test_3_resultsmicrowave(param_loop,loop) = sum(test_3_opmicrowave{param_loop,loop}(3,:)==1)/length(test_3_opmicrowave{param_loop,loop});
        test_4_resultsmicrowave(param_loop,loop) = sum(test_4_opmicrowave{param_loop,loop}(3,:)==1)/length(test_4_opmicrowave{param_loop,loop});
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num           	% Do the same for the other appliances
        test_1_resultsotherk(param_loop,loop) = sum(test_1_opmicrowave{param_loop,loop}(1,:)==1)/length(test_1_opmicrowave{param_loop,loop});
        test_2_resultsotherk(param_loop,loop) = sum(test_2_opmicrowave{param_loop,loop}(1,:)==1)/length(test_2_opmicrowave{param_loop,loop});
        test_3_resultsotherk(param_loop,loop) = sum(test_3_opmicrowave{param_loop,loop}(1,:)==1)/length(test_3_opmicrowave{param_loop,loop});
        test_4_resultsotherk(param_loop,loop) = sum(test_4_opmicrowave{param_loop,loop}(1,:)==1)/length(test_4_opmicrowave{param_loop,loop});
        
        test_1_resultsotherwm(param_loop,loop) = sum(test_1_opmicrowave{param_loop,loop}(2,:)==1)/length(test_1_opmicrowave{param_loop,loop});
        test_2_resultsotherwm(param_loop,loop) = sum(test_2_opmicrowave{param_loop,loop}(2,:)==1)/length(test_2_opmicrowave{param_loop,loop});
        test_3_resultsotherwm(param_loop,loop) = sum(test_3_opmicrowave{param_loop,loop}(2,:)==1)/length(test_3_opmicrowave{param_loop,loop});
        test_4_resultsotherwm(param_loop,loop) = sum(test_4_opmicrowave{param_loop,loop}(2,:)==1)/length(test_4_opmicrowave{param_loop,loop});
        
        test_1_resultsotherdw(param_loop,loop) = sum(test_1_opmicrowave{param_loop,loop}(4,:)==1)/length(test_1_opmicrowave{param_loop,loop});
        test_2_resultsotherdw(param_loop,loop) = sum(test_2_opmicrowave{param_loop,loop}(4,:)==1)/length(test_2_opmicrowave{param_loop,loop});
        test_3_resultsotherdw(param_loop,loop) = sum(test_3_opmicrowave{param_loop,loop}(4,:)==1)/length(test_3_opmicrowave{param_loop,loop});
        test_4_resultsotherdw(param_loop,loop) = sum(test_4_opmicrowave{param_loop,loop}(4,:)==1)/length(test_4_opmicrowave{param_loop,loop});
    end
end
                                        % Summarises the results for this appliance
resultssummarymicrowave = [mean(test_1_resultsmicrowave,2) mean(test_2_resultsmicrowave,2) mean(test_3_resultsmicrowave,2) mean(test_4_resultsmicrowave,2)];
resultssummarymicrowave(:,end+2) = mean(resultssummarymicrowave(:,1:4),2);    % And calculates the average

for param_loop = 1:param_loop_num
    for loop = 1:loop_num               % Find the appliance number with the highest vote percentage
        [~,test_1_guess(param_loop,loop)] = max([test_1_resultsotherk(param_loop,loop) test_1_resultsotherwm(param_loop,loop) test_1_resultsmicrowave(param_loop,loop) test_1_resultsotherdw(param_loop,loop)]);
        [~,test_2_guess(param_loop,loop)] = max([test_2_resultsotherk(param_loop,loop) test_2_resultsotherwm(param_loop,loop) test_2_resultsmicrowave(param_loop,loop) test_2_resultsotherdw(param_loop,loop)]);
        [~,test_3_guess(param_loop,loop)] = max([test_3_resultsotherk(param_loop,loop) test_3_resultsotherwm(param_loop,loop) test_3_resultsmicrowave(param_loop,loop) test_3_resultsotherdw(param_loop,loop)]);
        [~,test_4_guess(param_loop,loop)] = max([test_4_resultsotherk(param_loop,loop) test_4_resultsotherwm(param_loop,loop) test_4_resultsmicrowave(param_loop,loop) test_4_resultsotherdw(param_loop,loop)]);
    end
end

resultssummaryguesstemp = [round(mean(test_1_guess,2)) round(mean(test_2_guess,2)) round(mean(test_3_guess,2)) round(mean(test_4_guess,2))];
resultssummaryguess = cell(size(resultssummaryguesstemp));
resultssummaryguess(resultssummaryguesstemp == 1) = {'kettle'};         % Turn the appliance numbers found above into their corresponding appliance labels
resultssummaryguess(resultssummaryguesstemp == 2) = {'washingmachine'};
resultssummaryguess(resultssummaryguesstemp == 3) = {'microwave'};
resultssummaryguess(resultssummaryguesstemp == 4) = {'dishwasher'};


%% Clear Unwanted Variables
clearvars -except resultssummaryguess resultssummarymicrowave resultssummaryNN resultssummaryRF
