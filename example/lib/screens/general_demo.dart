import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class GeneralDemo extends StatefulWidget {
  const GeneralDemo({super.key});

  @override
  State<GeneralDemo> createState() => _GeneralDemoState();
}

class _GeneralDemoState extends State<GeneralDemo> {
  int _currentPage = 1;
  String _selectedItem = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基础/通用 (General)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismDropdown', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismDropdown<String>(
              items: [
                PrismDropdownItem(value: 'Option 1', label: 'Option 1', icon: Icons.home),
                PrismDropdownItem(value: 'Option 2', label: 'Option 2', icon: Icons.settings),
                PrismDropdownItem(value: 'Option 3', label: 'Option 3', icon: Icons.person),
              ],
              onSelected: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
              builder: (context, controller) {
                return PrismButton(
                  text: 'Selected: $_selectedItem',
                  variant: PrismButtonVariant.outline,
                  icon: Icons.arrow_drop_down,
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            const Text('PrismPagination', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismPagination(
              currentPage: _currentPage,
              totalPages: 10,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              showFirstLast: true,
            ),
            const SizedBox(height: 32),
            const Text('PrismUpload', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismUpload(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
