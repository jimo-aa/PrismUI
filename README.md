# Prism UI Component Library

Prism 是一个专为 Flutter 打造的现代化、高性能 UI 组件库。它提供了一套优雅、统一且功能丰富的组件，旨在帮助开发者快速构建美观的跨平台应用程序。

## ✨ 特性

- **现代化设计**：遵循现代 UI 设计趋势，提供清爽、一致的视觉体验。
- **跨平台支持**：完美适配 iOS、Android、Web、macOS、Windows 和 Linux。
- **丰富的组件**：包含 50+ 个常用组件，覆盖按钮、输入、布局、数据展示、反馈等多个类别。
- **高度可定制**：支持灵活的主题配置和样式覆盖，满足多样化的业务需求。
- **交互优化**：精心打磨的交互细节，提供流畅的用户体验（如 Hover 效果、点击反馈等）。

## 📦 组件列表

### 🔘 按钮与交互 (Buttons & Interactive)
- `PrismButton` - 支持多种样式（Primary, Outline, Ghost 等）的按钮
- `PrismHover` - 处理鼠标悬停交互的包装器

### 📝 输入与表单 (Inputs)
- `PrismTextField` - 基础文本输入框
- `PrismTextFormField` - 集成 Form 验证的表单输入框
- `PrismSelect` - 下拉选择器
- `PrismCheckbox` - 复选框
- `PrismRadio` - 单选框
- `PrismSwitch` - 开关
- `PrismDatePicker` - 日期选择器
- `PrismSearchBar` - 搜索栏
- `PrismRichEditor` - 富文本编辑器
- `PrismCompactCalendar` - 紧凑型日历

### 📐 布局 (Layout)
- `PrismAppShell` - 应用外壳（包含侧边栏、顶部栏等）
- `PrismTabs` - 标签页切换组件
- `PrismSplitView` - 分割视图（支持拖动调整）
- `PrismCard` / `PrismGradientCard` - 卡片容器
- `PrismSidebar` - 侧边导航栏
- `PrismHeader` - 顶部导航栏
- `PrismPageContainer` - 页面内容容器
- `PrismGlassContainer` - 毛玻璃效果容器

### 📊 数据展示 (Data Display)
- `PrismAvatar` - 头像
- `PrismTag` - 标签
- `PrismList` - 列表组件
- `PrismDataTable` - 数据表格
- `PrismTimeline` - 时间轴
- `PrismProgressBar` - 进度条
- `PrismMetricCard` - 指标卡片
- `PrismSkillBar` - 技能条
- `PrismStepProcess` - 步骤条
- `PrismHeatmapGrid` - 热力图风格网格
- `PrismCalendarView` - 日历视图

### 🔔 反馈 (Feedback)
- `PrismToast` - 轻量级提示
- `PrismAlertBox` - 警告/提示框
- `PrismModal` - 模态对话框
- `PrismLoading` - 加载指示器
- `PrismBadge` - 徽标
- `PrismTooltip` - 文字提示
- `PrismEmptyState` - 空状态展示
- `PrismPopover` - 气泡弹窗

### 🧭 导航 (Navigation)
- `PrismBreadcrumb` - 面包屑导航
- `PrismContextMenu` - 上下文菜单（右键菜单）

### 🧩 通用与媒体 (General & Media)
- `PrismDropdown` - 下拉菜单
- `PrismPagination` - 分页器
- `PrismUpload` - 上传组件
- `PrismImage` / `PrismVideoPlayer` / `PrismAudioPlayer` - 媒体组件

## 🚀 安装

在你的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # 方式 1: 本地引用 (开发时)
  prism:
    path: ../path/to/prism

  # 方式 2: Git 引用 (推荐)
  # prism:
    # git:
      # url: https://github.com/your-username/trism.git
      # path: .
```

## 📖 使用示例

```dart
import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: PrismButton(
            text: 'Hello Prism',
            onPressed: () {
              PrismToast.show(context, 'Welcome to Prism UI!');
            },
          ),
        ),
      ),
    );
  }
}
```

## 🛠️ 环境要求

- Flutter: >=1.17.0
- Dart: ^3.9.2

## 📄 许可证

MIT License
