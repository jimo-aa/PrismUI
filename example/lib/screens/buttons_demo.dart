import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮/操作 (Buttons)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismButton Variants', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                PrismButton(
                  text: 'Primary',
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Secondary',
                  variant: PrismButtonVariant.secondary,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Outline',
                  variant: PrismButtonVariant.outline,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Ghost',
                  variant: PrismButtonVariant.ghost,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Destructive',
                  variant: PrismButtonVariant.text,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Disabled',
                  variant: PrismButtonVariant.danger,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Sizes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                PrismButton(
                  text: 'Small',
                  size: PrismButtonSize.small,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Medium',
                  size: PrismButtonSize.medium,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Large',
                  size: PrismButtonSize.large,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('States', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                PrismButton(
                  text: 'Loading',
                  isLoading: true,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'Disabled',
                  disabled: true,
                  onPressed: () {},
                ),
                PrismButton(
                  text: 'With Icon',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
