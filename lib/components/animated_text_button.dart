import 'package:flutter/material.dart';

class AnimatedTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  const AnimatedTextButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  State<AnimatedTextButton> createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<AnimatedTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodySmall;
    final textStyle =
        _isHovered || widget.isSelected
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          AnimatedDefaultTextStyle(
            style: textStyle!,
            duration: const Duration(milliseconds: 200),
            child: Text(widget.label),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 1,
            alignment: Alignment.centerLeft,
            width:
                _isHovered || widget.isSelected ? widget.label.length * 7.0 : 0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
