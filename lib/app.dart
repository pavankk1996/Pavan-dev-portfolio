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

        // ✅ Latest Responsive Framework builder
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

  void scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Text(vm.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            LayoutBuilder(
              builder: (context, cons) {
                if (cons.maxWidth > 800) {
                  // Desktop / Tablet Navigation
                  return Row(
                    children: [
                      TextButton(
                        onPressed: () => scrollTo(0),
                        child: const Text('Home'),
                      ),
                      TextButton(
                        onPressed: () => scrollTo(700),
                        child: const Text('About'),
                      ),
                      TextButton(
                        onPressed: () => scrollTo(1400),
                        child: const Text('Projects'),
                      ),
                      TextButton(
                        onPressed: () => scrollTo(2300),
                        child: const Text('Resume'),
                      ),
                      TextButton(
                        onPressed: () => scrollTo(3000),
                        child: const Text('Contact'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () => vm.openResume(),
                        icon: const Icon(Icons.download),
                        label: const Text('Resume'),
                      ),
                    ],
                  );
                } else {
                  // Mobile Navigation
                  return IconButton(
                    onPressed: () => _openMobileMenu(context),
                    icon: const Icon(Icons.menu),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [
              HomeSection(),
              AboutSection(),
              ProjectsSection(),
              ResumeSection(),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(0);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(700);
                },
              ),
              ListTile(
                title: const Text('Projects'),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(1400);
                },
              ),
              ListTile(
                title: const Text('Resume'),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(2300);
                },
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  scrollTo(3000);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
