import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const AnimatedText({super.key, required this.text, this.onTap});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodySmall;
    final textStyle =
        _isHovered
            ? textTheme?.copyWith(color: Theme.of(context).primaryColor)
            : textTheme;
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedDefaultTextStyle(
          style: textStyle!,
          duration: const Duration(milliseconds: 200),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
