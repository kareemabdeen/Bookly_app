import 'package:flutter/material.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/helper.dart';
import 'animated_text_widget.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    initColorizedAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment
          .stretch, // makes the children takes the largest width of the screen (screen width)
      children: [
        Image.asset(AssetsManager.logo),
        const SizedBox(
          height: 4,
        ),
        const AnimatedTextWidget(),
      ],
    );
  }

  void initColorizedAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    _animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.pushWithReplacmentNamed(AppRouter.kHomeView);
      },
    );
  }
}
