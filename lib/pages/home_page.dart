import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/theme_provider.dart';
import '../widgets/common/navigation_bar.dart';
import '../sections/hero_section.dart';
import '../sections/services_section.dart';
import '../sections/solutions_section.dart';
import '../sections/projects_section.dart';
import '../sections/technologies_section.dart';
import '../sections/why_oneview_section.dart';
import '../sections/process_section.dart';
import '../sections/about_section.dart';
import '../sections/faq_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';

class HomePage extends StatefulWidget {
  final ThemeProvider themeProvider;

  const HomePage({super.key, required this.themeProvider});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0;

  final Map<String, GlobalKey> _sectionKeys = {
    AppConstants.sectionHome: GlobalKey(),
    AppConstants.sectionServices: GlobalKey(),
    AppConstants.sectionSolutions: GlobalKey(),
    AppConstants.sectionProjects: GlobalKey(),
    AppConstants.sectionTechnologies: GlobalKey(),
    AppConstants.sectionWhyOneView: GlobalKey(),
    AppConstants.sectionProcess: GlobalKey(),
    AppConstants.sectionAbout: GlobalKey(),
    AppConstants.sectionFaq: GlobalKey(),
    AppConstants.sectionContact: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients &&
        _scrollController.position.maxScrollExtent > 0) {
      setState(() {
        _scrollProgress = _scrollController.offset /
            _scrollController.position.maxScrollExtent;
      });
    }
  }

  void _scrollToSection(String sectionId) {
    final key = _sectionKeys[sectionId];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top padding for nav bar
                const SizedBox(height: 70),
                _buildSection(AppConstants.sectionHome, HeroSection(
                  onViewWork: () =>
                      _scrollToSection(AppConstants.sectionProjects),
                  onStartProject: () =>
                      _scrollToSection(AppConstants.sectionContact),
                )),
                _buildSection(AppConstants.sectionServices,
                    const ServicesSection()),
                _buildSection(AppConstants.sectionSolutions,
                    const SolutionsSection()),
                _buildSection(AppConstants.sectionProjects,
                    const ProjectsSection()),
                _buildSection(AppConstants.sectionTechnologies,
                    const TechnologiesSection()),
                _buildSection(AppConstants.sectionWhyOneView,
                    const WhyOneViewSection()),
                _buildSection(
                    AppConstants.sectionProcess, const ProcessSection()),
                _buildSection(
                    AppConstants.sectionAbout, const AboutSection()),
                _buildSection(AppConstants.sectionFaq, const FaqSection()),
                _buildSection(AppConstants.sectionContact,
                    const ContactSection()),
                FooterSection(onNavItemTap: _scrollToSection),
              ],
            ),
          ),
          // Navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(
              themeProvider: widget.themeProvider,
              onNavItemTap: _scrollToSection,
              scrollProgress: _scrollProgress,
            ),
          ),
          // Scroll to top button
          Positioned(
            bottom: 24,
            right: 24,
            child: AnimatedOpacity(
              opacity: _scrollProgress > 0.05 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton.small(
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutCubic,
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String id, Widget child) {
    return Container(
      key: _sectionKeys[id],
      child: child,
    );
  }
}
