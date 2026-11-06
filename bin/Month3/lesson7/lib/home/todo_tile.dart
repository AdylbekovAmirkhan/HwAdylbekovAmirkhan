import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String title;
  final String date;
  final bool isDone;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onTap;

  const TodoTile({
    super.key,
    required this.title,
    required this.date,
    required this.isDone,
    this.onChanged,
    this.onTap
  });

  @override
  State<TodoTile> createState() => TodoTileState();
}

class TodoTileState extends State<TodoTile> {
  // bool isDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 40),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.isDone,
              onChanged: widget.onChanged,
              fillColor: const MaterialStatePropertyAll(Colors.white),
              checkColor: Colors.black,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.date,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}