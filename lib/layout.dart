import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_text_button.dart';
import 'package:portfolio/components/animated_text.dart';
import 'package:portfolio/screen/contact_screen.dart';
import 'package:portfolio/screen/home_screen.dart';
import 'package:portfolio/screen/work_screen.dart';

enum Section { home, works, contact }

class Layout extends StatefulWidget {
  const Layout({super.key});

  static const double maxContentWidth = 720;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  Section currentSection = Section.home;

  final Map<Section, Widget> _sectionWidgets = {
    Section.home: const HomeScreen(),
    Section.works: const WorkScreen(),
    Section.contact: const ContactScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Layout.maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  _buildAppBar(),
                  const SizedBox(height: 64),
                  _sectionWidgets[currentSection] ?? const HomeScreen(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        AnimatedText(
          text: 'ARYAN TRIVEDI',
          onTap: () => _selectSection(Section.home),
        ),
        const Spacer(),
        _buildNavButton(label: 'WORKS', section: Section.works, isSelected: currentSection == Section.works),
        const SizedBox(width: 16),
        _buildNavButton(label: 'CONTACT', section: Section.contact, isSelected: currentSection == Section.contact),
      ],
    );
  }

  Widget _buildNavButton({required String label, required Section section, bool isSelected = false}) {
    return AnimatedTextButton(
      label: label,
      onTap: () => _selectSection(section),
      isSelected: isSelected,
    );
  }

  void _selectSection(Section section) {
    if (currentSection != section) {
      setState(() {
        currentSection = section;
      });
    }
  }
}
