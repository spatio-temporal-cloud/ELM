function compare( before_file,after_file,x,y )
%COMPARE Summary of this function goes here
%   Detailed explanation goes here


before=load(before_file);
after=load(after_file);
d=zeros(x,y,3);
k=1;
for i=1:x
    for j=1:y
        switch after(k)
            case 1
                d(i,j,1)=1;
                d(i,j,2)=1;
                d(i,j,3)=1;
            case 2
                d(i,j,1)=0;
                d(i,j,2)=0;
                d(i,j,3)=1;
            case 3
                d(i,j,1)=0;
                d(i,j,2)=1;
                d(i,j,3)=0;
            case 4
                d(i,j,1)=1;
                d(i,j,2)=1;
                d(i,j,3)=0;
            case 5
                d(i,j,1)=1;
                d(i,j,2)=0;
                d(i,j,3)=1;
        end
        
        if after(k)==1&&before(k)~=1,
            d(i,j,1)=0;
            d(i,j,2)=1;
            d(i,j,3)=1;
        end
        k=k+1;
    end
end
imshow(d);


end
