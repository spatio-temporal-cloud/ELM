function statistic( group_file,result_file )
%STATISTIC Summary of this function goes here
%   Detailed explanation goes here

%Urban 1, Whrite
%Water 2, Blue
%Vegetation 3, Green
%Arable land 4, Yellow
%Wetlands 5, Red
group=load(group_file);
count=zeros(1,5);
for i=1:size(group,1)
    switch group(i)
        case {1}
            count(1)=count(1)+1;
        case {2}
            count(2)=count(2)+1;
        case {3}
            count(3)=count(3)+1;
        case {4}
            count(4)=count(4)+1;
        case {5}
            count(5)=count(5)+1;
    end    
end

result=fopen(result_file,'w');
fprintf(result,'Urban:  %d  %f\n',count(1),count(1)/size(group,1));
fprintf(result,'Water:  %d  %f\n',count(2),count(2)/size(group,1));
fprintf(result,'Vegetation:  %d  %f\n',count(3),count(3)/size(group,1));
fprintf(result,'Arable land:  %d  %f\n',count(4),count(4)/size(group,1));
fprintf(result,'Wetlands:  %d  %f\n',count(5),count(5)/size(group,1));
fclose(result);
s={'Urban','Water','Vegetation','Arable land','Wetlands'};
pie(count,[1,0,0,0,0]);

legend('Whrite: Urban','Blue: Water','Green: Vegetation','Yellow: Arable land','Red: Wetlands');

end

