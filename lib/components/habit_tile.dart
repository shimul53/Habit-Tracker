import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChange;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChange, required this.settingsTapped, required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane:  ActionPane(
          motion: const StretchMotion(),
          children: [
            const SizedBox(width: 5,),
            //settings option
            SlidableAction(onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),
           const SizedBox(width: 5,),
            //delete action
            SlidableAction(onPressed:deleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],),

        child: Container(
          padding: const EdgeInsets.all(24),
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
      ),
    );
  }
}
