%function params=mmh(iterations, paramNumber)
function params=mmh(iterations, paramNumber, proportion,equations)

firstHit=0;
hit=0;
parIndex=0;

   for i=1:iterations

      if(firstHit==0) %parameter search
      %generate random params
         for i=1:paramNumber
            paramSet(i)=rand(); 
         end

         %send params to equations
         %hit=equations(paramSet);

         if(hit==1)
            parIndex++;
            params(parIndex,:)=paramSet;
	    firstHit=1;
         end

      else %if firstHit ==1 then switch to MMH
      %use last entry in params matrix 
         for i=1:paramNumber
            if(params(parIndex,i)==0) paramSet(i)=abs(normrnd(0,0.001));
            else
               paramSet(i)=abs(normrnd(params(parIndex,i),proportion*params(parIndex,i))); 
            end

	    pxi=1/(sqrt(2*pi)*proportion*params(parIndex,i));
	    qxi=1/(sqrt(2*pi)*proportion*params(parIndex,i))*exp(-(paramSet(i)-params(parIndex,i))^2/(2*proportion^2*params(parIndex,i)^2));
	    pxip1=1/(sqrt(2*pi)*proportion*paramSet(i));
	    qxip1=1/(sqrt(2*pi)*proportion*paramSet(i))*exp(-(paramSet(i)-params(parIndex,i))^2/(2*proportion^2*paramSet(i)^2));

	    num=rand();
	    if(num>(pxip1*qxip1)/(pxi*qxi)) %reject the choice
	       paramSet(i)=params(parIndex,i);
	    end

    	    %hit=equations(paramSet);

            if(hit==1)
               parIndex++;
               params(parIndex,:)=paramSet;
            end


      end %end parameter search


   end %end main iteration for loop

end %end function

%function normrnd
