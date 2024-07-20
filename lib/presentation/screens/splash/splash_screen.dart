import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    _navigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userName") != null) {
      await Future.delayed(const Duration(seconds: 2), () {
        context.router.replace(HomeRoute(prefs: prefs));
      });
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        context.router.replace(const WelcomeRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Text(
            'Welcome',
            style: Theme.of(context).textTheme.labelLarge!.bold.s30.black,
          ),
        ),
      ),
    );
  }
}
