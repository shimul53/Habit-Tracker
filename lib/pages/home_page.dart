import 'package:flutter/material.dart';
import 'package:habit_traker_app/components/habit_tile.dart';

import '../components/create_habit_fab.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data structure for today's list
  List todaysHabitList = [
    //[habitName, habitCompleted]
    ["Morning Walk", false],
    ["Read Book", false],
    ["Flutter learning", false],
  ];


  //checkbox was tapped
  void checkBoxTapped(bool? value, int index){
   setState(() {
     todaysHabitList[index][1] = value;
   });
  }

  //create a new habit
  void createNewHabit(){

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: const CreateHabitFloatingActionButton(),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
          itemBuilder: (context,index){
        return HabitTile(
          habitName: todaysHabitList[index][0],
          habitCompleted: todaysHabitList[index][1],
          onChange: (value)=> checkBoxTapped(value,index),
        );
      })

    );
  }
}
