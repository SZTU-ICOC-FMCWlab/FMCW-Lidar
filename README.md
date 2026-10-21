# FMCW-Lidar

## 子项目

- [`FMCWLidar-SIL`](FMCWLidar-SIL)：可拖放设备库、SIGLENT TCP 实机控制、发射端设备模型、Simulink 软件在环及 FPGA 行为参考。
- [`FMCWLidar-matlab-sim`](FMCWLidar-matlab-sim)：算法仿真、FPGA 工程及 Python 可视化。

克隆时使用 `git clone --recurse-submodules`；已有克隆执行
`git submodule update --init --recursive`。

完整下载（需有两个子仓库的访问权限）：

```sh
git clone --recurse-submodules git@github.com:SZTU-ICOC-FMCWlab/FMCW-Lidar.git
```

GitHub 主仓库的 **Download ZIP 不包含子模块内容**。不用 Git 时，请另行下载
`FMCWLidar-SIL` 仓库的 ZIP 并解压。该私密子仓库已附六份器件 PDF，仅供内部阅读；
在 MATLAB 中进入 `FMCWLidar-SIL`，运行 `startup_fmcwlidar_sil`，打开模型后
双击器件模块，再点击“帮助”即可打开本地手册，不依赖原电脑目录。
详见 [手册说明](FMCWLidar-SIL/docs/manuals/README.md)。运行模型需 MATLAB/Simulink，
阅读 PDF 需系统有 PDF 阅读应用。

设备库中已加入 **SIGLENT SDG6000X TCP**，默认不访问硬件；启动工程后运行
`build_siglent_sdg_tcp_example`，再打开 `SIGLENT_SDG_TCP_Example`。
支持范围、接线顺序及未完成的实机验证见 [使用说明](FMCWLidar-SIL/README.md#siglent-tcp-实验室设备)。

## TX 设备与线性化

- [设备说明、保护边界与官方资料](FMCWLidar-SIL/docs/DEVICE_GUIDE.md)
- [200 kHz 三角波 / 3 GHz / 0.50 m 光纤 MZI：辨识、补偿和 CMA-ES](FMCWLidar-SIL/docs/TX_LINEARIZATION_200KHZ.md)
- [HTML 辨识与补偿方案（下载后浏览器打开）](FMCWLidar-SIL/docs/TX_Identification_Compensation.html)：离线参数计算、实验步骤、模型前馈、ILC/CMA-ES 与打印版

上述新目标目前是实验设计和数值可行性分析，不是已完成的硬件验证。
SIL 原有 50 us / 50 ns MZI 的确定性结果不能作为该目标的性能保证。

设备说明已整合到 `FMCWLidar-SIL` 的 `main`。当前 SIL 默认是 **200 MS/s 采样、
50 us 单边、0.50 m MZI、64 chirp**；200 MS/s 不等于 200 kHz 三角波重复频率。
激光器波长、线宽、电流范围及调谐系数见设备说明第 5 节，其中明确区分手册转录和建模假设。
