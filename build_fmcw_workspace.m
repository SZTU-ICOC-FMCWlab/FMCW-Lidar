function paths = build_fmcw_workspace()
%BUILD_FMCW_WORKSPACE 构建设备库、算法库与集成/实验模型；不运行模型。
startup_fmcw_workspace();
paths.instruments = build_fmcwlidar_instruments();
paths.simulation = build_fmcwlidar_simulation();
paths.architecture = build_fmcwlidar_architecture();
paths.experiments = build_fmcwlidar_experiments();
end
