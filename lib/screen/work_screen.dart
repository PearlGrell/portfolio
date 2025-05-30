import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum Language { dart, typescript, react }

extension LanguageExtension on Language {
  String get name {
    switch (this) {
      case Language.dart:
        return 'Dart';
      case Language.typescript:
        return 'TypeScript';
      case Language.react:
        return 'React';
    }
  }
}

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen>
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 5), (time){
        if (pageController.hasClients) {
          if (_currentPage < _designs.length - 1) {
            pageController.nextPage(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            pageController.animateToPage(
              0,
              curve: Curves.easeInCubic,
              duration: const Duration(milliseconds: 300),
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final PageController pageController = PageController();
  final List<(String url, String title, String imgPath)> _designs = [
    (
      'https://www.figma.com/design/dzuleyvBTNbhS9BXXtkv4y/E-cell',
      'E-Cell',
      'https://aryan-trivedi.vercel.app/public/designs/e_cell.png',
    ),
    (
      'https://www.figma.com/design/4AjGXuaH6dpzJcJbfliZEY/Annonify',
      'Annonify',
      'https://aryan-trivedi.vercel.app/public/designs/annonify.png',
    ),
    (
      'https://www.figma.com/design/yxoblOPiD4iYKLkskhGWwd/Coffee',
      'Coffee',
      'https://aryan-trivedi.vercel.app/public/designs/coffee.png',
    ),
    (
      'https://www.figma.com/design/p8iL2hL4worPZAoEyZk8Z3/Competition',
      'Competition',
      'https://aryan-trivedi.vercel.app/public/designs/competition.png',
    ),
  ];

  final List<(String, String, String, Language)> _repos = [
    (
      'https://www.github.com/PearlGrell/portfolio',
      'Portfolio',
      "A minilamal portfolio website built with Flutter.",
      Language.dart,
    ),
    (
      'https://www.github.com/PearlGrell/flutter_linear_calendar',
      'Flutter Linear Calendar',
      "A Flutter package for creating a linear calendar widget.",
      Language.dart,
    ),
    (
      'https://www.github.com/PearlGrell/blog-site-backend',
      'Blog Site Backend',
      "A backend for a blog site built with Express.js and TypeScript.",
      Language.typescript,
    ),
    (
      'https://www.github.com/PearlGrell/whatsapp-chat-analysis',
      'WhatsApp Chat Analysis',
      "An application which analyses WhatsApp chat data and generates insights.",
      Language.dart,
    ),
    (
      'https://www.github.com/PearlGrell/love-terminal',
      'Love Terminal',
      "A terminal-based dating profile viewer built with React.",
      Language.react,
    ),
  ];

  int _currentPage = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(
        opacity: _opacityAnim,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Development', style: textTheme.bodyLarge),
              const Divider(),
              const SizedBox(height: 16),
              for (var v in _repos) _buildRepo(v),
              const SizedBox(height: 16),
              Text('UI/UX Designs', style: textTheme.bodyLarge),
              const Divider(),
              const SizedBox(height: 16),
              _buildUIUX(_designs[_currentPage]),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _designs.length,
                  (index) => _buildPageIndicator(_currentPage == index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      if (_currentPage < _designs.length - 1) {
        pageController.nextPage(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
      }
      if (_currentPage == _designs.length - 1) {
        pageController.animateTo(
          0,
          curve: Curves.easeInCubic,
          duration: const Duration(milliseconds: 300),
        );
      }
    } else if (details.primaryVelocity! > 0) {
      if (_currentPage > 0) {
        pageController.previousPage(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
      }
      if (_currentPage == 0) {
        pageController.animateToPage(
          _designs.length - 1,
          curve: Curves.easeInCubic,
          duration: const Duration(milliseconds: 300),
        );
      }
    }
  }

  Widget _buildRepo((String, String, String, Language) repo) {
    final (url, name, description, lang) = repo;

    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => launchUrl(Uri.parse(url)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                "• ",
                style: TextTheme.of(
                  context,
                ).bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 6),
              Text(
                name,
                style: TextTheme.of(
                  context,
                ).bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 6),
              Text(
                '(${lang.name})',
                style: TextTheme.of(
                  context,
                ).bodySmall?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              description,
              style: TextTheme.of(context).bodySmall?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withAlpha((0.7 * 255).toInt()),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  _buildImage((String, String, String) design) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Image.network(design.$3, fit: BoxFit.cover),
    );
  }

  _buildUIUX((String, String, String) design) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
        color: Theme.of(context).chipTheme.backgroundColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: GestureDetector(
              onHorizontalDragEnd: _onHorizontalDragEnd,
              child: PageView.builder(
                controller: pageController,
                itemCount: _designs.length,
                onPageChanged: _onPageChanged,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final design = _designs[index];
                  return _buildImage(design);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _designs[_currentPage].$2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () async {
                    final url = Uri.parse(_designs[_currentPage].$1);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: const Icon(
                    FontAwesomeIcons.arrowUpRightFromSquare,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildPageIndicator(bool isSelected) {
    return Container(
      width: isSelected ? 16 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSelected ? BorderRadius.circular(4.0) : null,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
      ),
    );
  }
}
