import 'package:flutter/material.dart';

class ThemePracticeApp extends StatefulWidget {
  const ThemePracticeApp({super.key});
  @override
  State<ThemePracticeApp> createState() => _ThemePracticeAppState();
}

class _ThemePracticeAppState extends State<ThemePracticeApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Drawer & Themes',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorSchemeSeed: const Color(0xFF2AABEE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2AABEE),
          foregroundColor: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212121),
          foregroundColor: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF1C1C1C),
        ),
      ),
      home: HomePage(
        onToggleTheme: toggleTheme,
        themeMode: _themeMode,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Чаты', style: TextStyle(fontSize: 22))),
    const CallPage(),
    const ContactPage(),
    const SettingsPage(),
  ];

  final List<String> _titles = [
    'Чаты',
    'Звонки',
    'Контакты',
    'Настройки',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: AppDrawer(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
        onPageSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2AABEE),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Чаты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Звонки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Контакты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  final ValueChanged<int> onPageSelected;

  const AppDrawer({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final telegramBlue = const Color(0xFF2AABEE);
    final isDark = themeMode == ThemeMode.dark;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 170,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF212121) : telegramBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 34,
                        color: isDark ? Colors.white : telegramBlue,
                      ),
                    ),
                    IconButton(
                      onPressed: onToggleTheme,
                      icon: Icon(
                        isDark ? Icons.light_mode : Icons.dark_mode,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Иван Иванов',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  '+996 700 123 456',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          drawerItem(
            context,
            icon: Icons.chat,
            title: 'Чаты',
            onTap: () {
              Navigator.pop(context);
              onPageSelected(0);
            },
          ),
          drawerItem(
            context,
            icon: Icons.call,
            title: 'Звонки',
            onTap: () {
              Navigator.pop(context);
              onPageSelected(1);
            },
          ),
          drawerItem(
            context,
            icon: Icons.person_2,
            title: 'Контакты',
            onTap: () {
              Navigator.pop(context);
              onPageSelected(2);
            },
          ),
          const Divider(),
          drawerItem(
            context,
            icon: Icons.settings,
            title: 'Настройки',
            onTap: () {
              Navigator.pop(context);
              onPageSelected(3);
            },
          ),
          drawerItem(
            context,
            icon: Icons.help_outline,
            title: 'Помощь',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      horizontalTitleGap: 8,
    );
  }
}

class CallPage extends StatelessWidget {
  const CallPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Список звонков',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Список контактов',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Уведомления и звуки'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Конфиденциальность'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('Папки с чатами'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.phone_android),
          title: const Text('Устройства'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Язык'),
          onTap: () {},
        ),
      ],
    );
  }
}
