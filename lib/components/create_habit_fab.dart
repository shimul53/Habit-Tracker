import 'package:flutter/material.dart';

class CreateHabitFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;
  const CreateHabitFloatingActionButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
    );
  }
}
