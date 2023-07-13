function y = PLV( dataMatrix , electrodeNumber , SamplingFrequency , processesingPeriode, i)
% plv is the absolute value of the mean phase difference between the two 
% signals expressed as a complex unit-length vector

%% plv
dphia = Dphi(  dataMatrix , electrodeNumber , SamplingFrequency , processesingPeriode); % calling the Dphi function for phase differenses


sine = mean(sin( dphia( : , : ,:)),1);
cosine = mean(cos( dphia( : , : ,:)),1);
plv= sqrt( sine.^2 + cosine.^2);                                           %Computing plv index

%% output

y = zeros( electrodeNumber-1,electrodeNumber-1);                           % to avoid warning of changing matrix size in the loop below
%putting results to output y
for n =1:electrodeNumber-1                                                 % Numer of iterations equal to the number of electrodes
    for m= 1:electrodeNumber-1                                             % putting 3D matrix to 2D to be able to use imagesc 
        y(n,m)=plv( 1, n, m) ;                                             % putting 3D matrix to 2D to be able to use imagesc 
    end %end for
end %end for

print_output(y , i, 1,processesingPeriode);

end % end plv fun