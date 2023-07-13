function [my_pli ]= PLI( dataMtrix , electrodeNumber , SamplingFrequency , processesingPeriode, i)
%This is based on the principle that a constant nonzero phase lag between 
% two time-series cannot be the effect of volume conduction from a single 
% source, so it renders true interactions between sources.



      samplenum=processesingPeriode*SamplingFrequency;                     % number of samples that is needed 

      x = dataMtrix(1:samplenum,1:electrodeNumber);                        % putting raw data into x
      xh = hilbert(x(:,:));                                                % hilbert of x
      phi = atan(imag(xh)./real(xh));                                      % instantaneous phase

      dphi= ones(samplenum,electrodeNumber-1,electrodeNumber-1)/100000;    % to avoid warning of changing matrix size in the loop below

    for c=1:electrodeNumber                                                % Numer of iterations equal to the number of electrodes
        for b=1:electrodeNumber                                            % Numer of iterations equal to the number of electrodes
           dphi(1:samplenum,b , c)= phi(1:samplenum,b)- phi(1:samplenum,c);%Phase difference between electrodes b&c without mod( x, 2*pi)
        end % end for
    end % end for

     %% pli

    pli=abs( mean( sign(dphi),1));
    %% wpli % it works so slowly

    % for m= 1:8
    % for n= 1:127
    % pxy = cpsd(dataMAtrix(:,n,m ),dataMAtrix(:,n+1 ,m ),hamming(20));
    % end

    % J=imag(pxy);
    % A = abs(J);
    % y = abs( mean( J,1 ))/ mean ( A,1);
    % wpli= abs(mean( abs(sin (Dphi))./ sin(Dphi),1));
    % end

    %% output

    my_pli = zeros( electrodeNumber-1,electrodeNumber-1);                      % to avoid warning of changing matrix size in the loop below
    %my_wpli = zeros( electrodeNumber-1,electrodeNumber-1);                    % to avoid warning of changing matrix size in the loop below

    for n =1:electrodeNumber-1                                                 % Numer of iterations equal to the number of electrodes
        for m= 1:electrodeNumber-1                                             % Numer of iterations equal to the number of electrodes
            my_pli(n,m)=pli( 1, n, m);                                         % putting 3D matrix to 2D to be able to use imagesc 
           % my_wpli(n,m)= wpli(1 , n,m);
        end % end for
    end % end for

      print_output(my_pli ,i ,2,processesingPeriode);

end %% end PLI function