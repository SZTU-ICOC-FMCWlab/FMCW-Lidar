# FMCW-Lidar

## 子项目

- [`FMCWLidar-SIL`](FMCWLidar-SIL)：发射端设备模型、Simulink 软件在环及 FPGA 行为参考。
- [`FMCWLidar-matlab-sim`](FMCWLidar-matlab-sim)：算法仿真、FPGA 工程及 Python 可视化。

克隆时使用 `git clone --recurse-submodules`；已有克隆执行
`git submodule update --init --recursive`。

## TX 设备与线性化

- [设备说明、保护边界与官方资料](FMCWLidar-SIL/docs/DEVICE_GUIDE.md)
- [200 kHz 三角波 / 3 GHz / 0.50 m 光纤 MZI：辨识、补偿和 CMA-ES](FMCWLidar-SIL/docs/TX_LINEARIZATION_200KHZ.md)

上述新目标目前是实验设计和数值可行性分析，不是已完成的硬件验证。
SIL 原有 50 us / 50 ns MZI 的确定性结果不能作为该目标的性能保证。

设备说明已整合到 `FMCWLidar-SIL` 的 `main`。当前 SIL 默认是 **200 MS/s 采样、
50 us 单边、0.50 m MZI、64 chirp**；200 MS/s 不等于 200 kHz 三角波重复频率。
激光器波长、线宽、电流范围及调谐系数见设备说明第 5 节，其中明确区分手册转录和建模假设。
