import 'package:flutter/material.dart';
import 'userModel.dart';

class ResultPage extends StatelessWidget {
  final UserModel user;

  const ResultPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String firstLetter = user.name.isNotEmpty ? user.name.substring(0, 1).toUpperCase() : 'U';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Данные пользователя'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade400,
                child: Text(
                  firstLetter,
                  style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
            buildDataRow(Icons.person, 'Имя', user.name),
            buildDataRow(Icons.badge, 'Фамилия', user.surname),
            buildDataRow(Icons.phone, 'Телефон', user.phone),
            buildDataRow(Icons.email, 'Email', user.email),
            buildDataRow(Icons.account_circle, 'Логин', user.login),
          ],
        ),
      ),
    );
  }

  Widget buildDataRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade400),
          const SizedBox(width: 16),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
