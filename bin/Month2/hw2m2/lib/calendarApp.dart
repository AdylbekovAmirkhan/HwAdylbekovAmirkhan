import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => CalendarAppState();
}

class CalendarAppState extends State<CalendarApp> {
  Locale locale = const Locale('ru');

  void toggleLang() {
    setState(() {
      locale = locale.languageCode == 'ru' ? const Locale('en') : const Locale('ru');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      supportedLocales: const [Locale('ru'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: CalendarPage(
        onToggleLanguage: toggleLang,
        currentLanguageCode: locale.languageCode,
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;
  final String currentLanguageCode;

  const CalendarPage({
    super.key, 
    required this.onToggleLanguage, 
    required this.currentLanguageCode,
  });

  @override
  State<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Map<DateTime, List<String>> _events = {};

  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key] ?? [];
  }

  void addEvent() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(widget.currentLanguageCode == 'ru' ? 'Новое событие' : 'New Event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: widget.currentLanguageCode == 'ru' ? 'введите название события' : 'enter event title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(widget.currentLanguageCode == 'ru' ? 'Отменить' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                final key = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
                setState(() {
                  _events.putIfAbsent(key, () => []);
                  _events[key]!.add(controller.text.trim());
                });
              }
              Navigator.pop(context);
            },
            child: Text(widget.currentLanguageCode == 'ru' ? 'Готово' : 'Done'),
          ),
        ],
      ),
    );
  }

  void editEvent(int index, String oldText) {
    final controller = TextEditingController(text: oldText);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(widget.currentLanguageCode == 'ru' ? 'Редактировать' : 'Edit Event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: widget.currentLanguageCode == 'ru' ? 'измените название' : 'change title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(widget.currentLanguageCode == 'ru' ? 'Отменить' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                final key = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
                setState(() {
                  _events[key]![index] = controller.text.trim();
                });
              }
              Navigator.pop(context);
            },
            child: Text(widget.currentLanguageCode == 'ru' ? 'Сохранить' : 'Save'),
          ),
        ],
      ),
    );
  }

  void deleteEvent(int index) {
    final key = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    setState(() {
      _events[key]!.removeAt(index);
      if (_events[key]!.isEmpty) {
        _events.remove(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEventsForDay(_selectedDay);
    final isRu = widget.currentLanguageCode == 'ru';

    return Scaffold(
      appBar: AppBar(
        title: Text(isRu ? 'Календарь' : 'Calendar'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLanguage,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: widget.currentLanguageCode, 
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2019),
            lastDay: DateTime.utc(2030),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
              selectedDecoration: BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
              markerDecoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            isRu
                ? 'Выбрано: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}'
                : 'Selected: ${_selectedDay.month}/${_selectedDay.day}/${_selectedDay.year}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: events.isEmpty
                ? Center(child: Text(isRu ? 'событий нет' : 'No events'))
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        leading: const Icon(Icons.event, color: Colors.blue),
                        title: Text(events[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () => editEvent(index, events[index]),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteEvent(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
