import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_view_model.dart';

class HomeSection extends StatefulWidget {
  final VoidCallback onViewMorePressed;

  const HomeSection({super.key, required this.onViewMorePressed});

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
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      color: Colors.black,
      width: double.infinity,
      height: height, // full screen height
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 👇 Center main content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  vm.profileImage,
                  width: width < 300 ? 75 : 150,
                  height: width < 300 ? 75 : 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                vm.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              SlideTransition(
                position: _slide,
                child: FadeTransition(
                  opacity: _fade,
                  child: Text(
                    vm.tagline,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),

          // 👇 Positioned "View More" button (direct child of Stack)
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: TextButton.icon(
              onPressed: widget.onViewMorePressed,
              icon: const Icon(Icons.keyboard_arrow_down),
              label: const Text('View More', style: TextStyle(fontSize: 16)),
              style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
