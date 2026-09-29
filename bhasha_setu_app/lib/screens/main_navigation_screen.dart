import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../data/app_state.dart';
import '../widgets/floating_glass_navbar.dart';
import 'curriculum_screen.dart';
import 'live_translation_screen.dart';
import 'nipun_studio_screen.dart';
import 'offline_hub_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final PalashAppState appState;

  const MainNavigationScreen({
    super.key,
    required this.appState,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.appState,
      builder: (context, _) {
        final screens = [
          LiveTranslationScreen(appState: widget.appState),
          NipunStudioScreen(appState: widget.appState),
          CurriculumScreen(appState: widget.appState),
          OfflineHubScreen(appState: widget.appState),
        ];

        return Scaffold(
          backgroundColor: PalashColors.bgDark,
          body: Stack(
            children: [
              // Active Screen Body with cross-fade
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: screens[_currentIndex],
              ),

              // Curved Floating Glass Bottom Navigation Bar
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FloatingGlassNavbar(
                  currentIndex: _currentIndex,
                  onTabSelected: (index) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
