import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';
import '../buttons/prism_button.dart';

class PrismVideoPlayer extends StatelessWidget {
  final String? url;
  final double aspectRatio;
  final bool autoPlay;

  const PrismVideoPlayer({
    super.key,
    this.url,
    this.aspectRatio = 16 / 9,
    this.autoPlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.play_circle_outline, size: 64, color: Colors.white),
                const SizedBox(height: 16),
                Text(
                  '视频播放器',
                  style: PrismTypography.getBodyMedium(context).copyWith(color: Colors.white),
                ),
                if (url != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      url!,
                      style: PrismTypography.getBodySmall(context).copyWith(color: Colors.white54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.play_arrow, color: Colors.white),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.3,
                          child: Container(
                            color: PrismColors.getBrandDefault(context),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.volume_up, color: Colors.white),
                    const SizedBox(width: 16),
                    const Icon(Icons.fullscreen, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
