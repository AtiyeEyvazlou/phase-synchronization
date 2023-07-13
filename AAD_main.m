
% =========================================================================
%              Computing Phase synchronization indexes
% =========================================================================
% This program contains one main stage of computing PS indexes procedures and is
% divided into the following steps:
%
% Stage 1: loading data
% Stage 2: computing indexes
% Stage 3: saving output into its subfolder
% -------------------------------------------------------------------------
%   Usage:  
%     calculation of plv, pli and rho indexes.
% -------------------------------------------------------------------------
%   Inputs:
%      
%      subNum               : Number of subjects
%      dataMatrix           : load eeg signal to matlab and put it to dataMatrix
%      chNum                : Number of channels  
%      fs                   : Sampling Frequency 
%      tLeng                : processing time length (seconds)
% -------------------------------------------------------------------------
%   Output:
%     outputs are saved into Results subfolder.
% -------------------------------------------------------------------------
%   Example call:
%      Rho_ind ( dataMatrix(:,:), chNum , fs , tLeng, i);
%      PLI( dataMatrix(:,:) , chNum , fs , tLeng, i);
%      PLV(  dataMatrix(:,:) , chNum , fs , tLeng, i);
% -------------------------------------------------------------------------
%   Reference(s):
%      [1]	G. Niso et al., "HERMES: towards an integrated toolbox to characterize functional and effective brain connectivity," Neuroinformatics, vol. 11, no. 4, pp. 405-434, 2013.
% -------------------------------------------------------------------------
%   Author:
%      Atiyeh Eyvazlou (October 2020)
% -------------------------------------------------------------------------
%% ------------------------------------------------------------------------
% ------------ Paths Configuration ----------------------------------------
% -------------------------------------------------------------------------
% Here, the path of data subfolder for loaing input is added to the
% Workspace of MATLAB.
close all         % Close all previous figures.
clc               % Clean command window.
clear             % Clean workspace.
ConfigPath;       % Configuring the paths
%% ------------------------------------------------------------------------
% ------------ Parameters Initialization ----------------------------------
% -------------------------------------------------------------------------
 
subNum     =         8 ; % Number of subjects
chNum      =       128 ; % Number of channels
fs         =       128 ; % Sampling Frequency 
tLeng      =        70 ; % processing time length (seconds)

%% ------------------------------------------------------------------------
% ------------ stage1: loading data ----------------------------------
% -------------------------------------------------------------------------
% prompt1 = 'load your data and rename it to "dataMatrix".        for example:load( my_data.mat );dataMatrix = my_data'

load('all_data2.mat'); % as an example, I've loaded my data here.
dataMatrix = all_data2; % load eeg signal to matlab and put it to dataMatrix
%% ------------------------------------------------------------------------
% ------------ stage2: computing indexes ----------------------------------
% -------------------------------------------------------------------------
% 
prompt2 = 'Which index do you want to be calculated? ( plv=1, pli=2, rho=3, break=0 ) ';
y = input(prompt2);

plv= zeros ( chNum-1 , chNum-1 ); pli = plv ;  % to avoid warning of changing matrix size in the loop below
                         

% The following loop computes indexes for all subjects
for i = 1:subNum                               % Numer of iterations equal to the number of subjects
    
    if     y==3                                                   % checking the requested index for computing
        rho= Rho_ind ( dataMatrix(:,:,i), chNum , fs , tLeng , i); % calling Rho_ind function
        rho1(i,:)= rho;                                       % saving result of each subject 
        save( 'Results/rho/rho.mat', 'rho1');  
        
    elseif y==2
        pli(:,:, i)= PLI( dataMatrix(:,:,i) , chNum , fs , tLeng, i); % calling PLI function        
        save( 'Results/pli/pli.mat', 'pli');
        
    elseif y==1
        plv(:,:, i)= PLV(  dataMatrix(:,:,i) , chNum , fs , tLeng, i); % calling PLV function
        save( 'Results/plv/plv.mat', 'plv');
        
    elseif y==0
        break
        
%     else 
%         prompt3 = 'invalid input, please try again. (plv=1 , pli=2 , rho = 3 , break = 0) ';
%         y = input(prompt3);

    end % end if
end % end for

%% ------------------------------------------------------------------------
% ------------ stage3: saving outputs into its subfolder -------------------
% -------------------------------------------------------------------------
% 
fprintf('The extracted features are saved to Results subfolder. ');
%  rest are in print_output() function.
