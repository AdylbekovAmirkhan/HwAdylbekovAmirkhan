import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hw4/home/home_page.dart';
import '/home/home_cubit.dart';

class OnboardingPage extends StatefulWidget {
  final HomeCubit cubit;
  final Function(bool) onThemeChanged;

  const OnboardingPage({
    super.key,
    required this.cubit,
    required this.onThemeChanged,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    _saveOnboardingStatus();
  }

  void _saveOnboardingStatus() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isOnboardingViewed', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.assignment_turned_in_outlined, size: 100, color: Colors.blue),
              const SizedBox(height: 30),
              const Text(
                "Добро пожаловать",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                "Это приложение поможет вам эффективно управлять вашими задачами и дедлайнами.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => MyHomePage(
                          title: 'Главная',
                          cubit: widget.cubit,
                          onThemeChanged: widget.onThemeChanged,
                        ),
                      ),
                    );
                  },
                  child: const Text("Начать работу"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
