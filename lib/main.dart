import 'package:easy_song/core/theme.dart';
import 'package:easy_song/core/di/dependency_injection.dart';
import 'package:easy_song/features/auth/presentation/login_view_model.dart';
import 'package:easy_song/features/onboarding/presentation/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(
    BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme();
    return MaterialApp(
      theme: MaterialTheme(textTheme).light(),
      darkTheme: MaterialTheme(textTheme).dark(),
      debugShowCheckedModeBanner: false,

      home: OnboardingPage(),
    );
  }
}
