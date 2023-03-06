function phit=spruce(paramSet)

phit=0;
a=paramSet

%run equations to steady state if needed

%evaluate param set passed in from mmh, here we know the steady state condition
if(a>=0.185 && a<=0.255)
   phit=1;
end

end %end function
