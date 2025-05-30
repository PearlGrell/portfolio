import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_button.dart';
import 'package:portfolio/components/animated_chip.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _slideAnim = Tween<Offset>(
      begin: Offset(0, 0.03),
      end: Offset.zero,
    ).animate(curve);
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(curve);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> get _skills => [
    "Flutter",
    "TypeScript",
    "Express.js",
    "Figma",
    "PostgreSQL",
  ];

  List<(String, (String, String)?)> get _achievements => [
    ("Recipient of the Reliance Undergraduate Scholarship 2024", null),
    (
      "Recipient of the Appinventiv Eduboost Scholarship 2024",
      (
        "https://aryan-trivedi.vercel.app/public/pdfs/appinventiv.pdf",
        "Certificate",
      ),
    ),
    (
      "Winner of 'Valentine Me' - Intra-College Web Development Competition",
      (
        "https://aryan-trivedi.vercel.app/public/pdfs/valentine-me.pdf",
        "Certificate",
      ),
    ),
    (
      "Winner of Internlay - Experimental Internship Program",
      (
        "https://aryan-trivedi.vercel.app/public/pdfs/internlay.pdf",
        "Certificate",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(
        opacity: _opacityAnim,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Me', style: textTheme.bodyLarge),
            const Divider(),
            const SizedBox(height: 24),
            _buildText(
              "I am an aspiring Flutter developer with a strong interest in building efficient and user-friendly mobile applications. Alongside development, I also explore UI/UX design to create interfaces that are both functional and visually appealing.",
              textTheme,
            ),
            const SizedBox(height: 12),
            _buildText(
              "I’m expanding my skills in backend development to better understand the full scope of application architecture. This helps me deliver more reliable and scalable software solutions.",
              textTheme,
            ),
            const SizedBox(height: 12),
            _buildText(
              "Additionally, I have a keen interest in emerging technologies like quantum computing, which motivates me to stay updated with future trends in the tech industry.",
              textTheme,
            ),
            const SizedBox(height: 32),
            Text('Technical Interests', style: textTheme.bodyLarge),
            const Divider(),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 16,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children:
                  _skills.map((skill) {
                    return SizedBox(
                      height: 36,
                      width: skill.length * 10 + 24,
                      child: AnimatedChip(text: skill),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 32),
            AnimatedButton(),
            const SizedBox(height: 32),
            Text('Current Achievements', style: textTheme.bodyLarge),
            const Divider(),
            const SizedBox(height: 20),
            for (var item in _achievements)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '•',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: _buildText(item.$1, textTheme)),
                      const SizedBox(width: 8),
                      if (item.$2 != null)
                        InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () async {
                            if (item.$2 != null) {
                              launchUrl(
                                Uri.parse(item.$2!.$1),
                                mode: LaunchMode.externalApplication,
                              ).catchError((error) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error opening link'),
                                    ),
                                  );
                                }
                                return true;
                              });
                            }
                          },
                          child: Text(
                            item.$2!.$2,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, TextTheme textTheme) {
    return Text(
      text,
      style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
