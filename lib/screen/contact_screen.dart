import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/animated_social_links.dart';
import 'package:portfolio/layout.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  List<(String, String, IconData)> contactLinks = [
    (
      "LinkedIn",
      "https://www.linkedin.com/in/aryan-trivedi-lko/",
      FontAwesomeIcons.linkedinIn,
    ),
    ("GitHub", "https://github.com/PearlGrell", FontAwesomeIcons.github),
    (
      "Instagram",
      "https://www.instagram.com/aryan_.__/",
      FontAwesomeIcons.instagram,
    ),
    (
      'Discord',
      'https://discord.com/users/1006841350223839342',
      FontAwesomeIcons.discord,
    ),
    (
      "Email",
      "mailto:aryan.trivedi.official@gmail.com",
      FontAwesomeIcons.envelope,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return OrientationBuilder(
      builder: (context, orienatation) {
        final isWide =
            orienatation == Orientation.landscape ||
            MediaQuery.of(context).size.width > Layout.maxContentWidth;

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          opacity: _opacity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact Me', style: textTheme.headlineSmall),
              const Divider(),
              const SizedBox(height: 32),
              isWide
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildContactInfo(contactLinks, textTheme),
                      ),
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: _buildImage()),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfo(contactLinks, textTheme, isWide: false),
                      const SizedBox(height: 32),
                      _buildImage(),
                    ],
                  ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(
    List<(String, String, IconData)> contactLinks,
    TextTheme textTheme, {
    bool isWide = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(
          'Feel free to reach out to me via email or connect with me on any of these platforms. '
          'Always eager to discuss new projects, ideas, or opportunities.',
          textTheme,
        ),
        const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              contactLinks
                  .map(
                    (link) => Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.0,
                        left: isWide ? 0 : 16.0,
                      ),
                      child: AnimatedSocialLinks(
                        label: link.$1,
                        url: link.$2,
                        icon: link.$3,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 8.5 / 10,
      child: Image.asset(
        'assets/my_photo.jpg',
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
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
