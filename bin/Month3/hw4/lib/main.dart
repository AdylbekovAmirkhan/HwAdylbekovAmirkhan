import 'package:flutter/material.dart';
import '/home/home_cubit.dart';
import '/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/home/test_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/onboarding/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final bool isOnboardingViewed =
      preferences.getBool('isOnboardingViewed') ?? false;

  final homeCubit = HomeCubit();

  runApp(MyApp(isOnboardingViewed: isOnboardingViewed, cubit: homeCubit));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingViewed;
  final HomeCubit cubit;

  const MyApp({
    super.key,
    required this.isOnboardingViewed,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isOnboardingViewed
          ? MyHomePage(
              title: 'Flutter Demo Home Page',
              cubit: cubit,
              onThemeChanged: (value) {},
            )
          : OnboardingPage(cubit: cubit, onThemeChanged: (value) {}),
    );
  }
}
