import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';
import '../layout/prism_tabs.dart';

class PrismRichEditor extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final double height;

  const PrismRichEditor({
    super.key,
    this.initialValue = '',
    this.onChanged,
    this.height = 400,
  });

  @override
  State<PrismRichEditor> createState() => _PrismRichEditorState();
}

class _PrismRichEditorState extends State<PrismRichEditor> with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: PrismColors.getBgCard(context),
        border: Border.all(color: PrismColors.getBorder(context)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: PrismColors.getBorder(context))),
            ),
            child: Row(
              children: [
                _buildToolbarButton(Icons.format_bold, '**', '**'),
                _buildToolbarButton(Icons.format_italic, '*', '*'),
                _buildToolbarButton(Icons.strikethrough_s, '~~', '~~'),
                const VerticalDivider(width: 16),
                _buildToolbarButton(Icons.code, '`', '`'),
                _buildToolbarButton(Icons.data_object, '```\n', '\n```'),
                const VerticalDivider(width: 16),
                _buildToolbarButton(Icons.link, '[', '](url)'),
                _buildToolbarButton(Icons.image, '![alt](', ')'),
                const Spacer(),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: PrismColors.getBgBody(context),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTabButton(0, 'Write'),
                      _buildTabButton(1, 'Preview'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Type your markdown content here...',
                    hintStyle: TextStyle(color: PrismColors.getTextSecondary(context)),
                  ),
                  style: TextStyle(
                    fontFamily: 'JetBrains Mono',
                    fontSize: 14,
                    color: PrismColors.getTextMain(context),
                  ),
                  onChanged: widget.onChanged,
                ),
                Markdown(
                  data: _controller.text,
                  styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    p: PrismTypography.getBodyMedium(context),
                    h1: PrismTypography.getH1(context),
                    h2: PrismTypography.getH2(context),
                    h3: PrismTypography.getH3(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarButton(IconData icon, String prefix, String suffix) {
    return IconButton(
      icon: Icon(icon, size: 20, color: PrismColors.getTextSecondary(context)),
      splashRadius: 20,
      onPressed: () {
        final text = _controller.text;
        final selection = _controller.selection;
        final newText = text.replaceRange(
          selection.start,
          selection.end,
          '$prefix${text.substring(selection.start, selection.end)}$suffix',
        );
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: selection.start + prefix.length + (selection.end - selection.start),
          ),
        );
        widget.onChanged?.call(newText);
      },
    );
  }

  Widget _buildTabButton(int index, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? PrismColors.getBgCard(context) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: PrismTypography.getBodySmall(context).copyWith(
            color: isSelected ? PrismColors.getTextMain(context) : PrismColors.getTextSecondary(context),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
