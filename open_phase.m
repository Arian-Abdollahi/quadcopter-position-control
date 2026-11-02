function phasePath = open_phase(phaseNumber)
%OPEN_PHASE Open one quadcopter analysis phase without running a simulation.
% Run this function from the repository root. Live scripts execute in the
% MATLAB base workspace when run from the Live Editor.
if nargin == 0
    phaseNumber = 3;
end
validateattributes(phaseNumber, {'numeric'}, {'scalar', 'integer', '>=', 1, '<=', 3});
projectRoot = fileparts(mfilename('fullpath'));
phaseFolders = {'01_modeling_and_analysis', '02_position_tracking', ...
                '03_observers_and_robustness'};
liveFiles = {'Phase1.mlx', 'Main.mlx', 'Main.mlx'};
modelFiles = {'Phase1_simulink.slx', 'Main.slx', 'Main.slx'};
if bdIsLoaded('Main')
    loadedPath = get_param('Main', 'FileName');
    targetPath = fullfile(projectRoot, 'phases', phaseFolders{phaseNumber}, modelFiles{phaseNumber});
    if ~strcmp(loadedPath, targetPath)
        error('Quadcopter:PhaseAlreadyOpen', ...
              'Save and close the other Main model before selecting a different phase.');
    end
end
phasePath = fullfile(projectRoot, 'phases', phaseFolders{phaseNumber});
addpath(projectRoot);
cd(phasePath);
open(fullfile(phasePath, liveFiles{phaseNumber}));
fprintf('Selected phase %d. Run the relevant live-script sections first.\n', phaseNumber);
fprintf('Then open the model with: open_system(''%s'')\n', modelFiles{phaseNumber});
end
