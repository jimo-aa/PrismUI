import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class InteractiveDemo extends StatelessWidget {
  const InteractiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('交互/特效 (Interactive)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PrismHover', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismHover(
              builder: (context, isHovered) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: isHovered
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      isHovered ? 'Hovered!' : 'Hover Me',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
