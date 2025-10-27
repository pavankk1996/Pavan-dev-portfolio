import 'package:flutter/material.dart';
import 'package:pavan_dev_portfolio/core/utils/app_colors.dart';
import 'package:pavan_dev_portfolio/core/widgets/button.dart';
import 'package:pavan_dev_portfolio/core/widgets/sizebox.dart';
import 'package:pavan_dev_portfolio/viewmodels/home_view_model.dart';

class ActionButtons extends StatelessWidget {
  final HomeViewModel vm;

  const ActionButtons({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UniversalButton(
          text: vm.getInTouchTxt,
          onPressed: () {},
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          borderRadius: 3,
          image: Image.asset(
            vm.linkedInImg,
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
        const DevSizeBox(),
        UniversalButton(
          text: vm.downloadbtnTxt,
          onPressed: () {},
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          borderRadius: 3,
          image: Image.asset(
            vm.cvbtnImg,
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
