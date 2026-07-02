import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const OneViewApp());
}

class OneViewApp extends StatefulWidget {
  const OneViewApp({super.key});

  @override
  State<OneViewApp> createState() => _OneViewAppState();
}

class _OneViewAppState extends State<OneViewApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    _themeProvider.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneView - Building Mobile Apps, Games & Digital Solutions',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeProvider.themeMode,
      home: HomePage(themeProvider: _themeProvider),
    );
  }
}
