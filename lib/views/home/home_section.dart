import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_view_model.dart';
import '../common/tech_chip.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
      constraints: const BoxConstraints(maxWidth: 1400),
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vm.name,
                      style: TextStyle(
                        fontSize: width > 800 ? 42 : 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      vm.tagline,
                      style: TextStyle(fontSize: width > 800 ? 20 : 16),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => vm.openResume(),
                          child: const Text('Download Resume'),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: () => _scrollTo(1400),
                          child: const Text('View Projects'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: const [
                        TechChip('Flutter'),
                        TechChip('Dart'),
                        TechChip('Kotlin'),
                        TechChip('Firebase'),
                        TechChip('BLoC / Cubit'),
                        TechChip('CI/CD'),
                      ],
                    ),
                  ],
                ),
              ),
              if (width > 800)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Hero(
                      tag: 'hero-image',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          vm.heroImage,
                          fit: BoxFit.cover,
                          height: 340,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollTo(double offset) {
    final shell = context.findAncestorStateOfType<State>();
    // Parent shell handles scrolling; nothing required here.
    // Scroll from App shell via AppBar buttons.
  }
}
