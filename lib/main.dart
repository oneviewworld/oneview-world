import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'pages/home_page.dart';
import 'pages/project_detail_page.dart';
import 'pages/projects_list_page.dart';

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
  late final AppRouterDelegate _routerDelegate;
  final AppRouteParser _routeParser = AppRouteParser();

  @override
  void initState() {
    super.initState();
    _themeProvider.addListener(() => setState(() {}));
    _routerDelegate = AppRouterDelegate(
      homeBuilder: () => HomePage(themeProvider: _themeProvider),
      projectsBuilder: () => const ProjectsListPage(),
      projectDetailBuilder: (project) => ProjectDetailPage(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OneView - Building Mobile Apps, Games & Digital Solutions',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeProvider.themeMode,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeParser,
    );
  }
}
