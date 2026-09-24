import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FeedbackScreen()));

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Обратная связь')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Обратная связь',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Пожалуйста, заполните форму ниже, чтобы отправить нам свое сообщение.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Expanded(child: FeedbackForm()),
          ],
        ),
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _controller = TextEditingController();
  String _name = "";
  String _submittedName = "";
  bool _isSent = false;
  String? _errorText;

  void _submit() {
    if (_name.trim().isEmpty) {
      setState(() {
        _errorText = "Имя не должно быть пустым";
        _isSent = false;
      });
      return;
    }

    setState(() {
      _submittedName = _name;
      _isSent = true;
      _errorText = null;
      _name = "";
    });
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            errorText: _errorText,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) => _name = value,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Отправить'),
        ),
        const SizedBox(height: 24),
        if (_isSent)
          Text(
            'Отправлено! Спасибо, $_submittedName',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
      ],
    );
  }
}


