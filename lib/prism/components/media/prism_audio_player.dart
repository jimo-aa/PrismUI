import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismAudioPlayer extends StatelessWidget {
  final String? url;
  final String title;
  final Duration duration;

  const PrismAudioPlayer({
    super.key,
    this.url,
    required this.title,
    this.duration = const Duration(minutes: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PrismColors.getBgCard(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PrismColors.getBorder(context)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: PrismColors.getBrandDefault(context).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.music_note,
              color: PrismColors.getBrandDefault(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: PrismTypography.getBodyMedium(context).copyWith(fontWeight: FontWeight.w500, color: PrismColors.getTextMain(context)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '0:00',
                      style: PrismTypography.getBodySmall(context).copyWith(color: PrismColors.getTextSecondary(context)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: PrismColors.getBorder(context),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDuration(duration),
                      style: PrismTypography.getBodySmall(context).copyWith(color: PrismColors.getTextSecondary(context)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_circle_fill),
            color: PrismColors.getBrandDefault(context),
            iconSize: 40,
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
