%This script shows an example of how to use the Modified Metroplis-Hastings random walk algorithm
clear;

%specify an array of values that satisfies your model specific criteria
array=[10 10];
hits(1,:)=array;

%for loop that determines how many candidate parameter sets to generate, here we choose 100
for iterations=1:100
	%generate new candidate array
	candidate=mmh(array,0.5);

	%Determine if the new 'candidate' array satisfies your model criteria. Here we choose the condition that the sum of the elements must be greater than 10. If the condition is satisfied, we rename 'candidate' as 'array' to be used in the next call to mmh. If the condition is not satisfied, the previous 'array' will be used in the next call to mmh. Arrays that satisfy the criteria are collected in 'hits' 
	if(sum(candidate)>10)
		array=candidate;
		[r,c]=size(hits);
		hits(r+1,:)=array;
	end
end
