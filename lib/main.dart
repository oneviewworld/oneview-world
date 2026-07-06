import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/constants/app_data.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'pages/home_page.dart';
import 'pages/project_detail_page.dart';

void main() {
  usePathUrlStrategy();
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '/');

        // Match /projects/:id
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments[0] == 'projects') {
          final projectId = uri.pathSegments[1];
          final project = AppData.projects.where((p) => p.id == projectId).firstOrNull;
          if (project != null) {
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => ProjectDetailPage(project: project),
            );
          }
        }

        // Default: home
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(themeProvider: _themeProvider),
        );
      },
    );
  }
}
