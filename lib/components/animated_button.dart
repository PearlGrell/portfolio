import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(
          Uri.parse("https://aryan-trivedi.vercel.app/public/pdfs/resume.pdf"),
          mode: LaunchMode.externalApplication,
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 150,
          height: 40,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.fileLines,
                size: 18,
                color: isHovered
                    ? Colors.white
                    : Theme.of(context).chipTheme.labelStyle?.color,
              ),
              const SizedBox(width: 8),
              AnimatedDefaultTextStyle(
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
                duration: const Duration(milliseconds: 200),
                child: Text("View Resume"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
