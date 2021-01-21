function [real_val] = chrome_decode(Population,N,L,BS,m,Lo,Hi)
real_val = [];
STED(1) = 1;
for i=2:m+1
    STED(i) = STED(i-1)+BS(i-1);
end
for j=1:m
		x=BS(j)-1:-1:0;
		pow2x=2.^x;
		for i=1:N
			gene=Population(i,STED(j):STED(j+1)-1);
			var_norm=sum(pow2x.*gene)/(2^BS(j)-1);
			real_val(i,j)=Lo(j)+(Hi(j)-Lo(j))*var_norm;
		end
	end
return;
