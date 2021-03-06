function [ TestingTime,TY] = elm_predict_new( input_file,out_file,model_file )
%ELM_PREDICT_PIXEL Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%% Load testing dataset
input=load(input_file);
load(model_file);


TV.P=input';

NumberofTestingData=size(TV.P,2);


%%%%%%%%%%% Calculate the output of testing input
start_time_test=cputime;
tempH_test=InputWeight*TV.P;
clear TV.P;             %   Release input of testing data   

ind=ones(1,NumberofTestingData);
BiasMatrix=BiasofHiddenNeurons(:,ind);              %   Extend the bias matrix BiasofHiddenNeurons to match the demention of H
tempH_test=tempH_test + BiasMatrix;
switch lower(ActivationFunction)
    case {'sig','sigmoid'}
        %%%%%%%% Sigmoid 
        H_test = 1 ./ (1 + exp(-tempH_test));
    case {'sin','sine'}
        %%%%%%%% Sine
        H_test = sin(tempH_test);        
    case {'hardlim'}
        %%%%%%%% Hard Limit
        H_test = hardlim(tempH_test);        
        %%%%%%%% More activation functions can be added here        
end
TY=(H_test' * OutputWeight)';                       %   Label: the actual output of the testing data
end_time_test=cputime;

TestingTime=end_time_test-start_time_test           %   Calculate CPU time (seconds) spent by ELM predicting the whole testing data


out=fopen(out_file,'w');
for k=1:size(input,1)
    [x, label_index_actual]=max(TY(:,k));
    fprintf(out,'%d\n',label(label_index_actual));
end
fclose(out);
end

