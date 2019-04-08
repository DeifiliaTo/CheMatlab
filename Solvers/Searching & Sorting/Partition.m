function [a, PivotPos]= Partition(a, LBound, RBound)

RandValue = ceil(rand*(RBound - LBound + 1)) + LBound - 1;
if (RandValue > RBound || RandValue < LBound)
    error ('Rand value out of bounds')
end
tmp = a(RBound);
a(RBound) = a(RandValue);
a(RandValue) = tmp;

PivotPos = RBound;
LeftPos = LBound;

tmp = a(PivotPos); %sum(a(:,:,PivotPos)

while(LeftPos < PivotPos)
    while(a(LeftPos) > tmp) %sum(sum(a(:,:.LeftPos)) > tmp)
       a(PivotPos) = a(LeftPos); %a(:,:,PivotPos) = a(:,:,LeftPos)
       a(LeftPos) = a(PivotPos-1);
       a(PivotPos-1) = tmp;
       PivotPos = PivotPos -1;
    end
    LeftPos = LeftPos + 1;
end

end