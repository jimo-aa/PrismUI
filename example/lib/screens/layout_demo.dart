import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class LayoutDemo extends StatefulWidget {
  const LayoutDemo({super.key});

  @override
  State<LayoutDemo> createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('布局 (Layout)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismCard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Subtitle goes here', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 16),
                  Text('This is the content of the card. It can be any widget.'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PrismCard(
              onTap: () {},
              child: const Center(child: Text('Tap me! (Interactive Card)')),
            ),
            const SizedBox(height: 32),
            const Text('PrismGradientCard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismGradientCard(
              gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gradient Card', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('With a nice gradient background', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  Text('Content with white text automatically.', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismGlassContainer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/800/400'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: PrismGlassContainer(
                  width: 300,
                  height: 150,
                  child: const Center(
                    child: Text(
                      'Glass Effect',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismTabs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismTabs(
              tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.withOpacity(0.1),
              child: Center(
                child: Text('Content for Tab ${_selectedTabIndex + 1}'),
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismSplitView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PrismSplitView(
                initialRatio: 0.3,
                left: Container(
                  color: Colors.blue.withOpacity(0.2),
                  child: const Center(child: Text('Left Pane')),
                ),
                right: Container(
                  color: Colors.green.withOpacity(0.2),
                  child: const Center(child: Text('Right Pane')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
