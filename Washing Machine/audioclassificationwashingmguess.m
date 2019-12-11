%% Audio Classification - Washing Machine Guess Script
% Alex Healion - C15399731
                                                         %#ok<*SAGROW,*ASGLU,*NASGU,*NBRAK,*FNDSB>
%% Load Data
audioclassification4NNwashingm                                      % Run both Neural Network (NN) and Random Forest (RF) classification scripts
audioclassification4RFwashingm

clearvars -except resultssummaryNN resultssummaryRF test_1_opNNwashingm test_2_opNNwashingm test_3_opNNwashingm test_4_opNNwashingm test_1_opRFwashingm test_2_opRFwashingm test_3_opRFwashingm test_4_opRFwashingm loop_num param_loop_num
                                                                    % Clear unwanted variables
%% Analysing Results
for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Convert RF output from labels to binary vectors
        test_1_opRFwashingm{param_loop,loop} = [ismember(test_1_opRFwashingm{param_loop,loop},'kettle');ismember(test_1_opRFwashingm{param_loop,loop},'washingmachine');ismember(test_1_opRFwashingm{param_loop,loop},'microwave');ismember(test_1_opRFwashingm{param_loop,loop},'dishwasher')];
        test_2_opRFwashingm{param_loop,loop} = [ismember(test_2_opRFwashingm{param_loop,loop},'kettle');ismember(test_2_opRFwashingm{param_loop,loop},'washingmachine');ismember(test_2_opRFwashingm{param_loop,loop},'microwave');ismember(test_2_opRFwashingm{param_loop,loop},'dishwasher')];
        test_3_opRFwashingm{param_loop,loop} = [ismember(test_3_opRFwashingm{param_loop,loop},'kettle');ismember(test_3_opRFwashingm{param_loop,loop},'washingmachine');ismember(test_3_opRFwashingm{param_loop,loop},'microwave');ismember(test_3_opRFwashingm{param_loop,loop},'dishwasher')];
        test_4_opRFwashingm{param_loop,loop} = [ismember(test_4_opRFwashingm{param_loop,loop},'kettle');ismember(test_4_opRFwashingm{param_loop,loop},'washingmachine');ismember(test_4_opRFwashingm{param_loop,loop},'microwave');ismember(test_4_opRFwashingm{param_loop,loop},'dishwasher')];
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Convert vectors from logical to double
        test_1_opRFwashingm{param_loop,loop} = double(test_1_opRFwashingm{param_loop,loop});
        test_2_opRFwashingm{param_loop,loop} = double(test_2_opRFwashingm{param_loop,loop});
        test_3_opRFwashingm{param_loop,loop} = double(test_3_opRFwashingm{param_loop,loop});
        test_4_opRFwashingm{param_loop,loop} = double(test_4_opRFwashingm{param_loop,loop});
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Change chosen classifications from 1 to 0.95 for merging with NN
        test_1_opRFwashingm{param_loop,loop} = 0.95.*test_1_opRFwashingm{param_loop,loop};  % 0.95 chosen as it gave best results in testing
        test_2_opRFwashingm{param_loop,loop} = 0.95.*test_2_opRFwashingm{param_loop,loop};
        test_3_opRFwashingm{param_loop,loop} = 0.95.*test_3_opRFwashingm{param_loop,loop};
        test_4_opRFwashingm{param_loop,loop} = 0.95.*test_4_opRFwashingm{param_loop,loop};
    end
end

test_1_opcombinedwashingm = cat(3,test_1_opNNwashingm,test_1_opRFwashingm);   % Concatenate NN and RF outputs
test_2_opcombinedwashingm = cat(3,test_2_opNNwashingm,test_2_opRFwashingm);
test_3_opcombinedwashingm = cat(3,test_3_opNNwashingm,test_3_opRFwashingm);
test_4_opcombinedwashingm = cat(3,test_4_opNNwashingm,test_4_opRFwashingm);

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                               % Add these outputs
        test_1_opwashingm{param_loop,loop} = test_1_opcombinedwashingm{param_loop,loop,1} + test_1_opcombinedwashingm{param_loop,loop,2};
        test_2_opwashingm{param_loop,loop} = test_2_opcombinedwashingm{param_loop,loop,1} + test_2_opcombinedwashingm{param_loop,loop,2};
        test_3_opwashingm{param_loop,loop} = test_3_opcombinedwashingm{param_loop,loop,1} + test_3_opcombinedwashingm{param_loop,loop,2};
        test_4_opwashingm{param_loop,loop} = test_4_opcombinedwashingm{param_loop,loop,1} + test_4_opcombinedwashingm{param_loop,loop,2};
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num                                           % Set the highest confidence prediction to 1 for all observations
        for i = 1:length(test_1_opwashingm{param_loop,loop})
            [~,index] = max(test_1_opwashingm{param_loop,loop});
            test_1_opwashingm{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_2_opwashingm{param_loop,loop})
            [~,index] = max(test_2_opwashingm{param_loop,loop});
            test_2_opwashingm{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_3_opwashingm{param_loop,loop})
            [~,index] = max(test_3_opwashingm{param_loop,loop});
            test_3_opwashingm{param_loop,loop}(index(i),i) = 1;
        end
        for i = 1:length(test_4_opwashingm{param_loop,loop})
            [~,index] = max(test_4_opwashingm{param_loop,loop});
            test_4_opwashingm{param_loop,loop}(index(i),i) = 1;
        end
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num           	% Sum the number of 1s for this appliance and divide by the total length. This gives the percentage vote for this appliance for each test
        test_1_resultswashingm(param_loop,loop) = sum(test_1_opwashingm{param_loop,loop}(2,:)==1)/length(test_1_opwashingm{param_loop,loop});
        test_2_resultswashingm(param_loop,loop) = sum(test_2_opwashingm{param_loop,loop}(2,:)==1)/length(test_2_opwashingm{param_loop,loop});
        test_3_resultswashingm(param_loop,loop) = sum(test_3_opwashingm{param_loop,loop}(2,:)==1)/length(test_3_opwashingm{param_loop,loop});
        test_4_resultswashingm(param_loop,loop) = sum(test_4_opwashingm{param_loop,loop}(2,:)==1)/length(test_4_opwashingm{param_loop,loop});
    end
end

for param_loop = 1:param_loop_num
    for loop = 1:loop_num           	% Do the same for the other appliances
        test_1_resultsotherk(param_loop,loop) = sum(test_1_opwashingm{param_loop,loop}(1,:)==1)/length(test_1_opwashingm{param_loop,loop});
        test_2_resultsotherk(param_loop,loop) = sum(test_2_opwashingm{param_loop,loop}(1,:)==1)/length(test_2_opwashingm{param_loop,loop});
        test_3_resultsotherk(param_loop,loop) = sum(test_3_opwashingm{param_loop,loop}(1,:)==1)/length(test_3_opwashingm{param_loop,loop});
        test_4_resultsotherk(param_loop,loop) = sum(test_4_opwashingm{param_loop,loop}(1,:)==1)/length(test_4_opwashingm{param_loop,loop});
        
        test_1_resultsothermw(param_loop,loop) = sum(test_1_opwashingm{param_loop,loop}(3,:)==1)/length(test_1_opwashingm{param_loop,loop});
        test_2_resultsothermw(param_loop,loop) = sum(test_2_opwashingm{param_loop,loop}(3,:)==1)/length(test_2_opwashingm{param_loop,loop});
        test_3_resultsothermw(param_loop,loop) = sum(test_3_opwashingm{param_loop,loop}(3,:)==1)/length(test_3_opwashingm{param_loop,loop});
        test_4_resultsothermw(param_loop,loop) = sum(test_4_opwashingm{param_loop,loop}(3,:)==1)/length(test_4_opwashingm{param_loop,loop});
        
        test_1_resultsotherdw(param_loop,loop) = sum(test_1_opwashingm{param_loop,loop}(4,:)==1)/length(test_1_opwashingm{param_loop,loop});
        test_2_resultsotherdw(param_loop,loop) = sum(test_2_opwashingm{param_loop,loop}(4,:)==1)/length(test_2_opwashingm{param_loop,loop});
        test_3_resultsotherdw(param_loop,loop) = sum(test_3_opwashingm{param_loop,loop}(4,:)==1)/length(test_3_opwashingm{param_loop,loop});
        test_4_resultsotherdw(param_loop,loop) = sum(test_4_opwashingm{param_loop,loop}(4,:)==1)/length(test_4_opwashingm{param_loop,loop});
    end
end
                                        % Summarises the results for this appliance
resultssummarywashingm = [mean(test_1_resultswashingm,2) mean(test_2_resultswashingm,2) mean(test_3_resultswashingm,2) mean(test_4_resultswashingm,2)];
resultssummarywashingm(:,end+2) = mean(resultssummarywashingm(:,1:4),2);    % And calculates the average

for param_loop = 1:param_loop_num
    for loop = 1:loop_num               % Find the appliance number with the highest vote percentage
        [~,test_1_guess(param_loop,loop)] = max([test_1_resultsotherk(param_loop,loop) test_1_resultswashingm(param_loop,loop) test_1_resultsothermw(param_loop,loop) test_1_resultsotherdw(param_loop,loop)]);
        [~,test_2_guess(param_loop,loop)] = max([test_2_resultsotherk(param_loop,loop) test_2_resultswashingm(param_loop,loop) test_2_resultsothermw(param_loop,loop) test_2_resultsotherdw(param_loop,loop)]);
        [~,test_3_guess(param_loop,loop)] = max([test_3_resultsotherk(param_loop,loop) test_3_resultswashingm(param_loop,loop) test_3_resultsothermw(param_loop,loop) test_3_resultsotherdw(param_loop,loop)]);
        [~,test_4_guess(param_loop,loop)] = max([test_4_resultsotherk(param_loop,loop) test_4_resultswashingm(param_loop,loop) test_4_resultsothermw(param_loop,loop) test_4_resultsotherdw(param_loop,loop)]);
    end
end

resultssummaryguesstemp = [round(mean(test_1_guess,2)) round(mean(test_2_guess,2)) round(mean(test_3_guess,2)) round(mean(test_4_guess,2))];
resultssummaryguess = cell(size(resultssummaryguesstemp));
resultssummaryguess(resultssummaryguesstemp == 1) = {'kettle'};         % Turn the appliance numbers found above into their corresponding appliance labels
resultssummaryguess(resultssummaryguesstemp == 2) = {'washingmachine'};
resultssummaryguess(resultssummaryguesstemp == 3) = {'microwave'};
resultssummaryguess(resultssummaryguesstemp == 4) = {'dishwasher'};


%% Clear Unwanted Variables
clearvars -except resultssummaryguess resultssummarywashingm resultssummaryNN resultssummaryRF
