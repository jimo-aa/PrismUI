# Changelog

## [1.0.0] - 2026-02-16

### ✨ New Features

- **Form Support**: Added `PrismTextFormField` component for integrated Flutter Form validation and state management.
- **Component Feedback Optimization**:
  - `PrismTabs`: Implemented sophisticated interaction feedback (hover, scale, press effects) and refined active state animations.
  - `PrismSwitch`, `PrismCheckbox`, `PrismRadio`: Enhanced visual feedback with InkWell ripples and scale animations.
  - `PrismSplitView`: Added hover and active state feedback for the drag handle.
- **Dropdown Enhancements**: Added `builder` pattern support to `PrismDropdown` to allow custom trigger widgets and manual menu control.

### 🐛 Bug Fixes

- **PrismDropdown**: Fixed an issue where the dropdown would not open when using interactive children (like `PrismButton`) by resolving gesture conflicts.
- **PrismTextField**: Fixed a layout issue where validation error messages would cause height overflow or overlap; implemented custom error text rendering below the input field.
- **PrismTabs**: Fixed a dual-shadow bug where both previous and current tabs would show shadows during transition.
- **PrismTimeline**: Fixed type mismatch errors (DateTime vs String) in example usage.
- **Example Project**: Fixed compilation and testing errors in the `example` app to ensure smooth demonstration.

### 🚀 Initial Release

- Released the core library containing 50+ UI components across Layout, Inputs, Data Display, Feedback, Navigation, and Media categories.
- Comprehensive example project demonstrating usage of all components.
