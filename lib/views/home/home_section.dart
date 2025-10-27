import 'package:flutter/material.dart';
import 'package:pavan_dev_portfolio/core/utils/app_colors.dart';
import 'package:pavan_dev_portfolio/core/widgets/text.dart';
import 'package:pavan_dev_portfolio/views/home/action_buttons.dart';
import 'package:provider/provider.dart';
import 'package:pavan_dev_portfolio/core/widgets/sizebox.dart';
import '../../viewmodels/home_view_model.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback onViewMorePressed;

  const HomeSection({super.key, required this.onViewMorePressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      width: double.infinity,
      height: height,
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Consumer<HomeViewModel>(
            builder: (context, vm, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile image
                ClipOval(
                  child: Image.asset(
                    vm.profileImage,
                    width: width < 300 ? 75 : 150,
                    height: width < 300 ? 75 : 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const DevSizeBox(height: 24),

                // Name
                AppText(vm.name, textAlign: TextAlign.center),

                const DevSizeBox(),

                // Tagline
                AppText(
                  vm.tagline,
                  textAlign: TextAlign.center,
          
                ),

                const DevSizeBox(),

                // Buttons row
                ActionButtons(vm: vm),
              ],
            ),
          ),

          // View More button
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: TextButton.icon(
              onPressed: onViewMorePressed,
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
