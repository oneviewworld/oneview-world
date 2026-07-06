import 'package:flutter/material.dart';
import '../constants/app_data.dart';
import '../../models/project_model.dart';

/// Route configuration representing the current navigation state.
class AppRoutePath {
  final String location;
  final ProjectModel? project;

  const AppRoutePath.home() : location = '/', project = null;
  const AppRoutePath.projects() : location = '/projects', project = null;
  AppRoutePath.projectDetail(this.project) : location = '/projects/${project!.id}';

  bool get isHome => location == '/';
  bool get isProjects => location == '/projects';
  bool get isProjectDetail => project != null;
}

/// Parses browser URL into AppRoutePath.
class AppRouteParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.toString());

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'projects') {
      return const AppRoutePath.projects();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'projects') {
      final id = uri.pathSegments[1];
      final project = AppData.projects.where((p) => p.id == id).firstOrNull;
      if (project != null) {
        return AppRoutePath.projectDetail(project);
      }
    }

    return const AppRoutePath.home();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(uri: Uri.parse(configuration.location));
  }
}

/// Router delegate that manages page stack and URL updates.
class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final Widget Function() homeBuilder;
  final Widget Function() projectsBuilder;
  final Widget Function(ProjectModel) projectDetailBuilder;

  AppRoutePath _currentPath = const AppRoutePath.home();

  AppRouterDelegate({
    required this.homeBuilder,
    required this.projectsBuilder,
    required this.projectDetailBuilder,
  });

  @override
  AppRoutePath get currentConfiguration => _currentPath;

  void navigateTo(AppRoutePath path) {
    _currentPath = path;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: homeBuilder()),
        if (_currentPath.isProjects)
          MaterialPage(child: projectsBuilder()),
        if (_currentPath.isProjectDetail)
          MaterialPage(child: projectDetailBuilder(_currentPath.project!)),
      ],
      onDidRemovePage: (page) {
        if (_currentPath.isProjectDetail) {
          _currentPath = const AppRoutePath.projects();
        } else {
          _currentPath = const AppRoutePath.home();
        }
        notifyListeners();
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _currentPath = configuration;
  }
}
