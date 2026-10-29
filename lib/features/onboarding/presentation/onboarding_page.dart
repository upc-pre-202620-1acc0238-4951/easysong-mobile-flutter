import 'package:easy_song/features/auth/presentation/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.shadow,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    Text(
                      "Welcome to Easy Song",
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Discover and enjoy your favorite songs with ease.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text("Get started"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
