import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool IsDarkTheme = false;

  void _OnSave() {
    Navigator.of(context).pop(IsDarkTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IsDarkTheme
          ? const Color(0xFF1E1E2C)
          : Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text("Настройки"),
        foregroundColor: IsDarkTheme ? Colors.white : Colors.black,
        backgroundColor: IsDarkTheme
            ? const Color(0xFF1E1E2C)
            : Color(0xFFF5F5F7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Card(
              color: IsDarkTheme
                  ? const Color(0xFF2D2D3F)
                  : Color(0xFFF5F5F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: IsDarkTheme ? 0 : 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SwitchListTile(
                  title: Text('Темная тема', style: TextStyle(fontWeight: FontWeight.bold,
                      color: IsDarkTheme ? Colors.white : Colors.black,),),
                  subtitle: Text(
                    IsDarkTheme ? "Использовать светлое\nоформление приложения" : "Использовать тёмное\nоформление приложения",
                    style: TextStyle(
                      color: IsDarkTheme ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  value: IsDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      IsDarkTheme = value;
                    }
                  );
                  
                    
                  },
                ),
              ),
            ),
            TextButton(onPressed: _OnSave, child: Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}
