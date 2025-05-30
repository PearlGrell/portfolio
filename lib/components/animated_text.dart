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
    return InkWell(
      onTap: widget.onTap,
      onHover: (hovering) {
        setState(() {
          _isHovered = hovering;
        });
      },
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: AnimatedDefaultTextStyle(
        style: textStyle!,
        duration: const Duration(milliseconds: 200),
        child: Text(widget.text),
      ),
    );
  }
}
