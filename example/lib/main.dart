import 'package:flutter/material.dart';
import 'package:prism/prism.dart';
import 'screens/buttons_demo.dart';
import 'screens/inputs_demo.dart';
import 'screens/data_display_demo.dart';
import 'screens/feedback_demo.dart';
import 'screens/layout_demo.dart';
import 'screens/navigation_demo.dart';
import 'screens/interactive_demo.dart';
import 'screens/general_demo.dart';
import 'screens/media_demo.dart';

void main() {
  runApp(const PrismExampleApp());
}

class PrismExampleApp extends StatefulWidget {
  const PrismExampleApp({super.key});

  @override
  State<PrismExampleApp> createState() => _PrismExampleAppState();
}

class _PrismExampleAppState extends State<PrismExampleApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prism UI Gallery',
      theme: PrismTheme.lightTheme,
      darkTheme: PrismTheme.darkTheme,
      themeMode: _themeMode,
      home: HomePage(toggleTheme: _toggleTheme, isDark: _themeMode == ThemeMode.dark),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const HomePage({super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prism UI 组件库'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategory(context, '按钮/操作 (Buttons)', const ButtonsDemo()),
          _buildCategory(context, '输入/表单 (Inputs)', const InputsDemo()),
          _buildCategory(context, '数据展示 (Data Display)', const DataDisplayDemo()),
          _buildCategory(context, '反馈 (Feedback)', const FeedbackDemo()),
          _buildCategory(context, '布局 (Layout)', const LayoutDemo()),
          _buildCategory(context, '导航 (Navigation)', const NavigationDemo()),
          _buildCategory(context, '交互/特效 (Interactive)', const InteractiveDemo()),
          _buildCategory(context, '基础/通用 (General)', const GeneralDemo()),
          _buildCategory(context, '媒体 (Media)', const MediaDemo()),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, Widget page) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
