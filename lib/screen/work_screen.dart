import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Text(
                'I have been working with Flutter for over 2 years, building mobile applications with a focus on performance and user experience.',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Text('UI/UX Designs', style: textTheme.bodyLarge),
              const Divider(),
              const SizedBox(height: 16),
              Container(
                height: 480,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                  color: Theme.of(context).chipTheme.backgroundColor,
                ),
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      if (_currentPage < _designs.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                      if (_currentPage == _designs.length - 1) {
                        pageController.animateTo(
                          0,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    } else if (details.primaryVelocity! > 0) {
                      if (_currentPage > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                      if (_currentPage == 0) {
                        pageController.animateToPage(
                          _designs.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  },
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: _designs.length,
                    onPageChanged: _onPageChanged,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final design = _designs[index];
                      return _buildUIUX(design);
                    },
                  ),
                ),
              ),
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

  _buildUIUX((String, String, String) design) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 425,
          width: double.infinity,
          child: Image.network(design.$3, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(design.$2, style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse(design.$1);
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
