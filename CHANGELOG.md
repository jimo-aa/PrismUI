# 更新日志 (Changelog)

## [1.0.0] - 2026-02-16

### ✨ 新增特性

- **表单支持**：新增 `PrismTextFormField` 组件，集成 Flutter Form 表单验证和状态管理功能。
- **组件反馈优化**：
  - `PrismTabs`：实现了精致的交互反馈（悬停、缩放、点击效果），并优化了选中状态动画。
  - `PrismSwitch`、`PrismCheckbox`、`PrismRadio`：增强了视觉反馈，添加了水波纹（InkWell）和缩放动画。
  - `PrismSplitView`：为拖拽手柄添加了悬停和激活状态的反馈。
- **下拉菜单增强**：`PrismDropdown` 新增 `builder` 模式支持，允许自定义触发组件和手动控制菜单开关。

### 🐛 问题修复

- **PrismDropdown**：修复了在使用交互式子组件（如 `PrismButton`）时，因手势冲突导致下拉菜单无法打开的问题。
- **PrismTextField**：修复了表单验证错误信息导致的高度溢出或重叠布局问题；实现了错误信息在输入框下方独立渲染的优化。
- **PrismTabs**：修复了切换标签时，前一个和当前标签同时显示阴影的双重阴影 Bug。
- **PrismTimeline**：修复了示例代码中的类型不匹配错误（DateTime 与 String）。
- **示例项目**：修复了 `example` 应用中的编译和测试错误，确保演示流程顺畅。

### 🚀 首次发布

- 发布核心库，包含布局、输入、数据展示、反馈、导航和媒体等类别的 50+ 个 UI 组件。
- 提供包含所有组件用法的完整示例项目。
