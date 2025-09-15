import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  final List<String> messages = [
    "Welcome to FOOM – turn screen time into savings!",
    "Track your app usage and stay productive.",
    "Earn tokens and invest in Money Market Funds.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: messages.length,
        onPageChanged: (index) => setState(() => _pageIndex = index),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android, size: 100, color: Colors.deepPurple),
                const SizedBox(height: 32),
                Text(
                  messages[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                if (index == messages.length - 1)
                  AppButton(
                    text: "Get Started",
                    onPressed: () => context.go('/login'),
                  )
                else
                  AppButton(
                    text: "Next",
                    onPressed: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
