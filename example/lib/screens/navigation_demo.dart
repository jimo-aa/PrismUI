import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('导航 (Navigation)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismBreadcrumb', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismBreadcrumb(
              items: [
                PrismBreadcrumbItem(label: 'Home', onTap: () {}),
                PrismBreadcrumbItem(label: 'Library', onTap: () {}),
                PrismBreadcrumbItem(label: 'Data', onTap: () {}),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismContextMenu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Center(
              child: PrismContextMenu(
                items: [
                  PrismContextMenuItem(label: 'Copy', icon: Icons.copy, onTap: () {}),
                  PrismContextMenuItem(label: 'Share', icon: Icons.share, onTap: () {}),
                  PrismContextMenuItem(
                    label: 'Delete',
                    icon: Icons.delete,
                    isDestructive: true,
                    onTap: () {},
                  ),
                ],
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Text('Right Click / Long Press Me'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
