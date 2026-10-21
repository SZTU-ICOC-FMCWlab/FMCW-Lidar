function roots = open_fmcw_workspace()
%OPEN_FMCW_WORKSPACE 打开器件库、算法库和系统架构；不仿真、不连接硬件。
roots = startup_fmcw_workspace();
modelPaths = { ...
    fullfile(roots.instruments, 'models', 'FMCWLidar_Instrument_Library.slx'), ...
    fullfile(roots.simulation, 'models', 'FMCWLidar_Simulation_Library.slx'), ...
    fullfile(roots.architecture, 'models', 'FMCW_FPGA_Algorithm_Sim.slx')};
if any(~cellfun(@isfile, modelPaths))
    build_fmcw_workspace();
end
for k = 1:numel(modelPaths)
    [~, modelName] = fileparts(modelPaths{k});
    if bdIsLoaded(modelName)
        loadedPath = get_param(modelName, 'FileName');
        if ~strcmpi(loadedPath, modelPaths{k})
            error('FMCW:ModelNameConflict', ...
                '模型 %s 已从其他目录打开。请自行保存并关闭旧窗口，再重试。', modelName);
        end
    end
    open_system(modelPaths{k});
end
end
