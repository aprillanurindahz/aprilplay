import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/app_constants.dart';

import 'features/music/presentation/screens/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color electricYellow = Color(0xFFC6FF00);

  static const Color freshGreen = Color(0xFF00C853);

  static const Color darkBackground = Color(0xFF121212);

  static const Color cardColor = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AprilPlay',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: darkBackground,
            colorScheme: ColorScheme.dark(
              primary: electricYellow,
              secondary: freshGreen,
              surface: cardColor,
              background: darkBackground,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: darkBackground,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: electricYellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: electricYellow),
            ),
          ),
          home: const MainNavigation(),
        );
      },
    );
  }
}
