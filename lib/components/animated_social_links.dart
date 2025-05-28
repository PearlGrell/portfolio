import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedSocialLinks extends StatefulWidget {
  final String url;
  final String label;
  final IconData icon;
  const AnimatedSocialLinks({
    super.key,
    required this.url,
    required this.label,
    required this.icon,
  });

  @override
  State<AnimatedSocialLinks> createState() => _AnimatedSocialLinksState();
}

class _AnimatedSocialLinksState extends State<AnimatedSocialLinks> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(widget.url);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          debugPrint("Could not launch ${widget.url}");
        }
      },
      child: MouseRegion(
        onEnter:
            (_) => setState(() {
              isHovered = true;
            }),
        onExit:
            (_) => setState(() {
              isHovered = false;
            }),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 18,
              color:
                  !isHovered
                      ? Theme.of(context).textTheme.bodyMedium?.color
                      : Theme.of(context).chipTheme.labelStyle?.color,
            ),
            const SizedBox(width: 12),
            AnimatedDefaultTextStyle(
              style:
                  !isHovered
                      ? TextTheme.of(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      )
                      : TextTheme.of(context).bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).chipTheme.labelStyle?.color,
                      ),
              duration: const Duration(milliseconds: 200),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}
