import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class MediaDemo extends StatelessWidget {
  const MediaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('媒体 (Media)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismImage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismImage(
              src: 'https://picsum.photos/400/200',
              width: double.infinity,
              height: 200,
              borderRadius: 12,
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: PrismImage(
                    src: 'https://picsum.photos/200/200',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: PrismImage(
                    src: 'https://invalid-url.com/image.png', // Test error handling
                    height: 150,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismAudioPlayer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismAudioPlayer(
              title: 'Demo Audio Track',
              duration: Duration(minutes: 3, seconds: 45),
            ),
            const SizedBox(height: 32),
            const Text('PrismVideoPlayer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismVideoPlayer(
              aspectRatio: 16 / 9,
            ),
          ],
        ),
      ),
    );
  }
}
