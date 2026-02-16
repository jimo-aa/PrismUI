import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class FeedbackDemo extends StatelessWidget {
  const FeedbackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('反馈 (Feedback)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismAlertBox', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismAlertBox(
              variant: PrismAlertVariant.info,
              message: 'Info: This is an information message.',
            ),
            const SizedBox(height: 16),
            const PrismAlertBox(
              variant: PrismAlertVariant.success,
              message: 'Success: Operation completed successfully.',
            ),
            const SizedBox(height: 16),
            const PrismAlertBox(
              variant: PrismAlertVariant.warning,
              message: 'Warning: Please be careful with this action.',
            ),
            const SizedBox(height: 16),
            const PrismAlertBox(
              variant: PrismAlertVariant.error,
              message: 'Error: Something went wrong.',
            ),
            const SizedBox(height: 32),
            const Text('PrismBadge', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: PrismBadge(
                        text: '5',
                        rounded: true,
                        variant: PrismBadgeVariant.error,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                const PrismBadge(
                  text: 'New',
                  variant: PrismBadgeVariant.primary,
                ),
                const SizedBox(width: 8),
                const PrismBadge(
                  text: 'Beta',
                  variant: PrismBadgeVariant.warning,
                  rounded: false,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('PrismToast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismButton(
              text: 'Show Toast',
              onPressed: () {
                PrismToast.show(context, 'Hello from Prism Toast!');
              },
            ),
            const SizedBox(height: 32),
            const Text('PrismLoading', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Center(child: PrismLoading()),
            const SizedBox(height: 32),
            const Text('PrismTooltip', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Center(
              child: PrismTooltip(
                message: 'This is a tooltip',
                child: Icon(Icons.info_outline),
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismEmptyState', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismEmptyState(
              icon: Icons.inbox,
              title: 'No Items Found',
              description: 'Try adjusting your filters or search query.',
              actionLabel: 'Refresh',
            ),
            const SizedBox(height: 32),
            const Text('PrismModal & Popover', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: [
                PrismButton(
                  text: 'Show Modal',
                  onPressed: () {
                    PrismModal.show(
                      context: context,
                      title: 'Example Modal',
                      content: const Text('This is the content of the modal dialog.'),
                      actions: [
                        PrismButton(
                          text: 'Cancel',
                          variant: PrismButtonVariant.ghost,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        PrismButton(
                          text: 'Confirm',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                ),
                PrismPopover(
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Popover Content'),
                      Divider(),
                      Text('More details here...'),
                    ],
                  ),
                  child: const PrismButton(
                    text: 'Show Popover',
                    variant: PrismButtonVariant.outline,
                    onPressed: null, // Handled by Popover
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
