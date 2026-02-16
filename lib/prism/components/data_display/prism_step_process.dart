import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../layout/prism_card.dart';
import '../feedback/prism_badge.dart';

class PrismStepProcess extends StatelessWidget {
  final List<PrismProcessStep> steps;

  const PrismStepProcess({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isLast = index == steps.length - 1;

            return Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: index == 0 ? Colors.transparent : PrismColors.getBorder(context),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: PrismColors.getBgCard(context),
                                border: Border.all(color: PrismColors.getBrandDefault(context), width: 2),
                              ),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: PrismColors.getBrandDefault(context),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: isLast ? Colors.transparent : PrismColors.getBorder(context),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          step.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: PrismColors.getTextMain(context),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: PrismColors.getTextSecondary(context),
                          ),
                        ),
                        if (step.extraTag != null) ...[
                          const SizedBox(height: 8),
                          step.extraTag!,
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class PrismProcessStep {
  final String title;
  final String subtitle;
  final Widget? extraTag;

  PrismProcessStep({
    required this.title,
    required this.subtitle,
    this.extraTag,
  });
}
