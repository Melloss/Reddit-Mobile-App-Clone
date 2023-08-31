import 'package:flutter/material.dart';
import 'package:reddit_mobile_app_clone/Helper/color_pallet.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: 47).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.repeat();
    _animationController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: ColorPallets.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage(
                    'assets/loader/reddit_loader_${_animation.value < 10 ? _animation.value.round().toString().padLeft(2, '0') : _animation.value.round().toString()}.png'))),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
