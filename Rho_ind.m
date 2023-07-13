 function [y]= Rho_ind( dataMAtrix   , electrodeNumber , SamplingFrequency , processesingPeriode,m)
 
%  To characterize the strength of synchronization, we have to quantify the
%  deviation of the actual distribution of the relative phase from a 
%  uniform one.

 
    rho_dphi = Dphi(dataMAtrix ,  electrodeNumber , SamplingFrequency , processesingPeriode); % calling the Dphi function for phase differenses

        for i =  2 : processesingPeriode/2                                     % Numer of iterations equal to the number of electrodes
                                                                               % devided time dimention into 2 second periods to have a vector result
            h1 = histogram(rho_dphi((i-1)*processesingPeriode/2: i*processesingPeriode/2,:,:), 'Normalization', 'pdf'); % histogram to use as probability
            h  = h1.Values;                                                    % to get values of histogram bins
            s  = -sum( h.*log(h));                                             % shannon entropy
            numbBins = h1.NumBins;                                             % number of bins as max entropy 
            r (i)= (numbBins -s)/numbBins;                                     % rho formula
        end % end for
        y= r;                                                                  % transfering result vector to function output
        print_output(y ,m ,3,processesingPeriode);
end %% end fun