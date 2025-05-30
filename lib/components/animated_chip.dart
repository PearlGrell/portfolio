import 'package:flutter/material.dart';

class AnimatedChip extends StatefulWidget {
  final String text;
  const AnimatedChip({super.key, required this.text});

  @override
  State<AnimatedChip> createState() => _AnimatedChipState();
}

class _AnimatedChipState extends State<AnimatedChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      onTap: () {},
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              isHovered
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).chipTheme.backgroundColor,
          border: Border.all(
            color: Theme.of(context).chipTheme.side!.color,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style:
              isHovered
                  ? TextTheme.of(context).bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                  : TextTheme.of(context).bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).chipTheme.labelStyle?.color,
                  ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
