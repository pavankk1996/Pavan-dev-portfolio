import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/projects_view_model.dart';
import '../../models/project.dart';
import '../../services/url_service.dart';
import '../common/section_title.dart';

/// Displays the Projects section with animated grid layout.
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 1000) return 3;
    if (width > 700) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProjectsViewModel>();
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = _calculateCrossAxisCount(width);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 28),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Projects'),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _fadeInAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeInAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - _fadeInAnimation.value)),
                  child: child,
                ),
              );
            },
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vm.projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 280,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemBuilder: (context, index) {
                final project = vm.projects[index];
                return ProjectCard(project: project);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Single Project Card widget with hover animation and clean UI.
class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        //transform: Matrix4.identity()..translate(0, _hovering ? -6 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: _hovering
                  ? Colors.indigo.withOpacity(0.15)
                  : Colors.black12,
              blurRadius: _hovering ? 18 : 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.project.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image_outlined, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Project Name
              Text(
                widget.project.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
              const SizedBox(height: 6),

              // Tagline / Description
              Text(
                widget.project.tagline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 10),

              // Open Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => UrlService.open(widget.project.storeUrl),
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: const Text('Open'),
                  style: TextButton.styleFrom(foregroundColor: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
