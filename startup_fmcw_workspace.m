function roots = startup_fmcw_workspace()
%STARTUP_FMCW_WORKSPACE 初始化四个私有子仓库；不连接仪器、不运行模型。
workspaceRoot = fileparts(mfilename('fullpath'));
names = {'instruments', 'simulation', 'architecture', 'experiments'};
directories = {'FMCWLidar-SIL', 'FMCWLidar-matlab-sim', ...
    'FMCWLidar-Architecture', 'FMCWLidar-Experiments'};
entries = {'startup_fmcwlidar_instruments.m', 'startup_fmcwlidar_simulation.m', ...
    'startup_fmcwlidar_architecture.m', 'startup_fmcwlidar_experiments.m'};
for k = 1:numel(names)
    name = names{k};
    roots.(name) = fullfile(workspaceRoot, directories{k});
    if ~isfile(fullfile(roots.(name), entries{k}))
        error('FMCW:MissingSubmodule', ...
            '缺少或未初始化 %s。请在工作区运行 git submodule update --init --recursive。', directories{k});
    end
    addpath(roots.(name));
end
startup_fmcwlidar_instruments();
startup_fmcwlidar_simulation();
startup_fmcwlidar_architecture(workspaceRoot);
startup_fmcwlidar_experiments(workspaceRoot);
end
