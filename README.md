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
