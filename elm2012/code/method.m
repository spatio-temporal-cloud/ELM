function [ af,num,accuracy,x,y ] = method( min_num,max_num,data_trn,data_tst )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% af: active function
% num: hidden node number
% accuracy: testing accuracy
if min_num >= max_num,
    fprintf('min_num must be smaller than max_num\n');
    return;
end
    
afs = {'sig' 'sin' 'hardlim' 'tribas' 'radbas'};
accuracy = 0;
num = 0;
num_of_trial = 5;
test=zeros(num_of_trial,1);
af = 'sig';
step = 3;
len = ceil((max_num-min_num+1)/step);
x=zeros(length(afs),len);
y=zeros(length(afs),len);
for i=1:length(afs)
    l=1;
    for j=min_num:step:max_num
        
        for m=1:num_of_trial
            [TrainingTime, TestingTime, TrainingAcc, TestingAcc] = elm(data_trn, data_tst, 1, j, afs{i});
            test(m,1)=TestingAcc;
        end
        AverageTestingAccuracy=mean(test);
        
        fprintf('active function: %s; hidden node number: %d; Average Testing Accuracy: %f',afs{i},j,AverageTestingAccuracy);
        
        switch afs{i}
            case {'sig'}
                x(1,l)=j;
                y(1,l)=AverageTestingAccuracy;
            case {'sin'}
                x(2,l)=j;
                y(2,l)=AverageTestingAccuracy;
            case {'hardlim'}
                x(3,l)=j;
                y(3,l)=AverageTestingAccuracy;
            case {'tribas'}
                x(4,l)=j;
                y(4,l)=AverageTestingAccuracy;
            otherwise
                x(5,l)=j;
                y(5,l)=AverageTestingAccuracy;
        end
        
        l=l+1;
        if AverageTestingAccuracy > accuracy,
            accuracy = AverageTestingAccuracy;
            num = j;
            af = afs{i};
        end
        
    end
    
end
title('Incremental ELM Training Algorithm');
xlabel('Hidden Node Number');
ylabel('Average Testing Accuracy');
plot(x(1,:),y(1,:),'r');
hold on;
plot(x(2,:),y(2,:),'b');
hold on;
plot(x(3,:),y(3,:),'g');
hold on;
plot(x(4,:),y(4,:),'k');
hold on;
plot(x(5,:),y(5,:),'y');

legend('Red: Sig','Blue: Sin','Green: hardlim','Black: tribas','Yellow: radbas');
end
