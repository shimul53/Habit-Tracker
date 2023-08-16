import 'package:flutter/material.dart';
class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChange;
  const HabitTile({super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChange});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: habitCompleted, onChanged: onChange),

            //habit name
             Text(habitName),
          ],
        ),
      ),
    );
  }
}
