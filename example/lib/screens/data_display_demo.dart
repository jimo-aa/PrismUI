import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class DataDisplayDemo extends StatelessWidget {
  const DataDisplayDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('数据展示 (Data Display)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismAvatar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                const PrismAvatar(
                  text: 'JD',
                  backgroundColor: Colors.blue,
                  size: 48,
                ),
                const SizedBox(width: 16),
                const PrismAvatar(
                  imageUrl: 'https://picsum.photos/200',
                  size: 48,
                ),
                const SizedBox(width: 16),
                PrismAvatar(
                  text: 'AB',
                  isOnline: true,
                  size: 48,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismTag', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const PrismTag(text: 'Default'),
                const PrismTag(text: 'Primary', variant: PrismTagVariant.primary),
                const PrismTag(text: 'Success', variant: PrismTagVariant.success),
                const PrismTag(text: 'Warning', variant: PrismTagVariant.warning),
                const PrismTag(text: 'Error', variant: PrismTagVariant.error),
                const PrismTag(text: 'Outline', rounded: true),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismProgressBar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismProgressBar(value: 0.3, label: 'Downloading...'),
            const SizedBox(height: 16),
            const PrismProgressBar(value: 0.7, showLabel: false, color: Colors.green),
            const SizedBox(height: 32),
            const Text('PrismMetricCard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: PrismMetricCard(
                    label: 'Revenue',
                    value: '\$12,345',
                    trend: '+15%',
                    isTrendUp: true,
                    icon: Icons.attach_money,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrismMetricCard(
                    label: 'Users',
                    value: '1,234',
                    trend: '-5%',
                    isTrendUp: false,
                    icon: Icons.people,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismTimeline', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismTimeline(
              items: [
                PrismTimelineItem(
                  title: const Text('Order Placed'),
                  subtitle: const Text('Your order has been placed successfully'),
                  time: DateTime.now().subtract(const Duration(hours: 2)),
                  isCompleted: true,
                ),
                PrismTimelineItem(
                  title: const Text('Order Shipped'),
                  subtitle: const Text('Your order is on the way'),
                  time: DateTime.now().subtract(const Duration(minutes: 30)),
                  isCompleted: true,
                ),
                PrismTimelineItem(
                  title: const Text('Out for Delivery'),
                  subtitle: const Text('Expected delivery by 5 PM'),
                  isCompleted: false,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismSkillBar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismSkillBar(label: 'Flutter', value: 0.9),
            const SizedBox(height: 8),
            const PrismSkillBar(label: 'Dart', value: 0.85, color: Colors.blue),
            const SizedBox(height: 32),
            const Text('PrismStepProcess', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismStepProcess(
              steps: [
                PrismProcessStep(title: 'Step 1', subtitle: 'Basic Info'),
                PrismProcessStep(title: 'Step 2', subtitle: 'Details'),
                PrismProcessStep(title: 'Step 3', subtitle: 'Review'),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismListItem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  PrismListItem(
                    title: const Text('Item 1'),
                    subtitle: const Text('Description for item 1'),
                    leading: const Icon(Icons.star),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  PrismListItem(
                    title: const Text('Item 2'),
                    subtitle: const Text('Description for item 2'),
                    leading: const Icon(Icons.favorite),
                    trailing: const Switch(value: true, onChanged: null),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismCalendarGrid (Preview)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PrismCalendarGrid(
                month: DateTime.now(),
                events: {
                  DateTime.now().day: [
                    PrismCalendarEvent(title: 'Meeting', color: Colors.blue),
                  ],
                  DateTime.now().add(const Duration(days: 2)).day: [
                    PrismCalendarEvent(title: 'Deadline', color: Colors.red),
                  ],
                },
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismHeatmapGrid', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismHeatmapGrid(
              rows: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
              columns: const ['9am', '10am', '11am', '12pm', '1pm'],
              data: [
                [PrismHeatmapStatus.idle, PrismHeatmapStatus.normal, PrismHeatmapStatus.busy, PrismHeatmapStatus.normal, PrismHeatmapStatus.idle],
                [PrismHeatmapStatus.normal, PrismHeatmapStatus.busy, PrismHeatmapStatus.busy, PrismHeatmapStatus.normal, PrismHeatmapStatus.normal],
                [PrismHeatmapStatus.busy, PrismHeatmapStatus.busy, PrismHeatmapStatus.normal, PrismHeatmapStatus.idle, PrismHeatmapStatus.idle],
                [PrismHeatmapStatus.normal, PrismHeatmapStatus.normal, PrismHeatmapStatus.idle, PrismHeatmapStatus.normal, PrismHeatmapStatus.busy],
                [PrismHeatmapStatus.idle, PrismHeatmapStatus.idle, PrismHeatmapStatus.normal, PrismHeatmapStatus.busy, PrismHeatmapStatus.busy],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
