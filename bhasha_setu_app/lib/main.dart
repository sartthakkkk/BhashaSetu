import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/palash_colors.dart';
import 'data/app_state.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set dark immersive system navigation & status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: PalashColors.bgDark,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const PalashApp());
}

class PalashApp extends StatefulWidget {
  const PalashApp({super.key});

  @override
  State<PalashApp> createState() => _PalashAppState();
}

class _PalashAppState extends State<PalashApp> {
  late final PalashAppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = PalashAppState();
  }

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BhashaSetu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: PalashColors.bgDark,
        primaryColor: PalashColors.emeraldPrimary,
        colorScheme: const ColorScheme.dark(
          primary: PalashColors.emeraldPrimary,
          secondary: PalashColors.cyanElectric,
          surface: PalashColors.bgSurface,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        useMaterial3: true,
      ),
      home: MainNavigationScreen(appState: _appState),
    );
  }
}
