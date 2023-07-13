function ConfigPath
% =========================================================================
%              Adding the Paths of Matlab Files 
% =========================================================================
% In this function the paths of all subfolders for the ... system, including
% "database", "results" are
% added to the current path of Matlab workspace.
% -------------------------------------------------------------------------
%   Usage:
%      ConfigPath
% -------------------------------------------------------------------------
%   Outputs:
%      As output, subroot of program are added.
% -------------------------------------------------------------------------
%   Example call:
%      ConfigPath;
% -------------------------------------------------------------------------
%   Author:
%      Atiyeh Eyvazlou (september 5, 2020)

%% ------------------------------------------------------------------------
% ------------ Paths Configuration ----------------------------------------
% ------------------------------------------------------------------------- 
% Workspace of MATLAB.

% Geting root path
pathstr = pwd;

% Adding paths of all subfolders for the ... system, including "database", 
% "features", "train data", "test data", ... and "results".
path(path,[pathstr,'\data']);
addpath(genpath('Atiyeh Eyvazlou\Databases'))
oldDir = 'Atiyeh Eyvazlou\Databases';
ieeSen = strrep(pathstr,oldDir,'Databases\IEEE Sentences');  % Finding oldDir and replace 'Databases\IEEE Sentences'
path(path,ieeSen);

% Notifying the user for a successful addition of paths.
clc;
disp('ConfigPath: Paths added');
end