import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/projects_view_model.dart';
import 'viewmodels/contact_view_model.dart';
import 'views/home/home_section.dart';
import 'views/about/about_section.dart';
import 'views/projects/projects_section.dart';
import 'views/resume/resume_section.dart';
import 'views/contact/contact_section.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ProjectsViewModel()),
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
      ],
      child: MaterialApp(
        title: 'Pavan Kumar S — Portfolio',
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: ClampingScrollWrapper.builder(context, child!),
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        home: const PortfolioShell(),
      ),
    );
  }
}

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();

  late final AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  /// 🔹 Smooth scroll to a given widget key
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HomeSection(onViewMorePressed: () => scrollToSection(_aboutKey)),
              AboutSection(key: _aboutKey),
              // ProjectsSection(),
              // ResumeSection(),
              // ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}
