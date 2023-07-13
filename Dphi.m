function y = Dphi( dataMatrix , electrodeNumber , SamplingFrequency , processesingPeriode)
%% this function is used to compute the phase of each electrode and then finds the differences of all electrodes
    samplenum = (processesingPeriode) * SamplingFrequency; % number of samples that is needed 


      x = dataMatrix(1:samplenum,1:electrodeNumber);% putting raw data to x
      xh = hilbert(x(:,:)); % hilbert of x
      phi = atan(imag(xh)./real(xh));% instantaneous phase

      y= ones(samplenum,electrodeNumber-1,electrodeNumber-1)/100000;% to avoid warning of changing matrix size in the loop below
      %to compute phase differences between all electrodes
    for c=1:electrodeNumber  % Numer of iterations equal to the number of electrodes
        for b=1:electrodeNumber % Numer of iterations equal to the number of electrodes
           y(1:samplenum,b , c)= mod(phi(1:samplenum,b)- phi(1:samplenum,c),2*pi); %Phase difference between electrodes b&c
        end % end for
    end % end for
end % end function