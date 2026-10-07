import 'package:flutter/material.dart';
import 'userModel.dart';
import 'resultPage.dart';
import 'customTextField.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showConfirmDataDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text('Вы уверены, что хотите зарегистрироваться с этими данными?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                
                final user = UserModel(
                  name: nameController.text,
                  surname: surnameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  login: loginController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(user: user),
                  ),
                );
              },
              child: const Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showConfirmDataDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                label: 'Имя',
                hint: 'Введите имя',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Введите имя';
                  if (!RegExp(r'^[a-zA-Zа-яА-ЯёЁ]+$').hasMatch(value)) return 'Только буквы';
                  return null;
                },
              ),
              CustomTextField(
                controller: surnameController,
                label: 'Фамилия',
                hint: 'Введите фамилию',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Введите фамилию';
                  if (!RegExp(r'^[a-zA-Zа-яА-ЯёЁ]+$').hasMatch(value)) return 'Только буквы';
                  return null;
                },
              ),
              CustomTextField(
                controller: phoneController,
                label: 'Телефон',
                hint: 'Введите номер телефона',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Введите номер телефона';
                  if (!RegExp(r'^\+?[0-9]{9,15}$').hasMatch(value)) return 'Неверный формат номера';
                  return null;
                },
              ),
              CustomTextField(
                controller: emailController,
                label: 'Email',
                hint: 'Введите email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Введите email';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Неверный формат email';
                  return null;
                },
              ),
              CustomTextField(
                controller: loginController,
                label: 'Логин',
                hint: 'Введите логин',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Введите логин';
                  if (value.length < 4) return 'Минимум 4 символа';
                  return null;
                },
              ),
              CustomTextField(
                controller: passwordController,
                label: 'Пароль',
                hint: 'Введите пароль',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите пароль';
                  if (value.length < 6) return 'Пароль должен быть от 6 символов';
                  return null;
                },
              ),
              CustomTextField(
                controller: confirmPasswordController,
                label: 'Повтор пароля',
                hint: 'Повторите пароль',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Повторите пароль';
                  if (value != passwordController.text) return 'Пароли не совпадают';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red.shade900,
                  ),
                  child: const Text('Зарегистрироваться', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
