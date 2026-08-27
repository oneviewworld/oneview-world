import 'package:flutter/material.dart';
import '../constants/app_data.dart';
import '../data/instagram_posts_data.dart';
import '../models/instagram_post.dart';
import '../../models/project_model.dart';

/// Route configuration representing the current navigation state.
class AppRoutePath {
  final String location;
  final ProjectModel? project;
  final InstagramPost? blogPost;
  final bool isBlogList;

  const AppRoutePath.home() : location = '/', project = null, blogPost = null, isBlogList = false;
  const AppRoutePath.projects() : location = '/projects', project = null, blogPost = null, isBlogList = false;
  const AppRoutePath.blogList() : location = '/blog', project = null, blogPost = null, isBlogList = true;
  AppRoutePath.projectDetail(this.project) : location = '/projects/${project!.id}', blogPost = null, isBlogList = false;
  AppRoutePath.blog(this.blogPost) : location = '/blog/${blogPost!.urlId}', project = null, isBlogList = false;

  bool get isHome => location == '/';
  bool get isProjects => location == '/projects';
  bool get isProjectDetail => project != null;
  bool get isBlog => blogPost != null;
}

/// Parses browser URL into AppRoutePath.
class AppRouteParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.toString());

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'projects') {
      return const AppRoutePath.projects();
    }

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'blog') {
      return const AppRoutePath.blogList();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'projects') {
      final id = uri.pathSegments[1];
      final project = AppData.projects.where((p) => p.id == id).firstOrNull;
      if (project != null) {
        return AppRoutePath.projectDetail(project);
      }
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'blog') {
      final id = uri.pathSegments[1];
      final post = instagramPosts.where((p) => p.urlId == id).firstOrNull;
      if (post != null) {
        return AppRoutePath.blog(post);
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
  final Widget Function() blogListBuilder;
  final Widget Function(ProjectModel) projectDetailBuilder;
  final Widget Function(InstagramPost) blogDetailBuilder;

  AppRoutePath _currentPath = const AppRoutePath.home();

  AppRouterDelegate({
    required this.homeBuilder,
    required this.projectsBuilder,
    required this.blogListBuilder,
    required this.projectDetailBuilder,
    required this.blogDetailBuilder,
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
        if (_currentPath.isBlogList)
          MaterialPage(child: blogListBuilder()),
        if (_currentPath.isProjectDetail)
          MaterialPage(child: projectDetailBuilder(_currentPath.project!)),
        if (_currentPath.isBlog)
          MaterialPage(child: blogDetailBuilder(_currentPath.blogPost!)),
      ],
      onDidRemovePage: (page) {
        if (_currentPath.isProjectDetail) {
          _currentPath = const AppRoutePath.projects();
        } else if (_currentPath.isBlog) {
          _currentPath = const AppRoutePath.blogList();
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
