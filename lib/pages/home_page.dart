import 'package:flutter/material.dart';
import 'package:habit_traker_app/components/habit_tile.dart';

import '../components/create_habit_fab.dart';
import '../components/alert_box.dart';
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
  final _newHabitNameController = TextEditingController();
  void createNewHabit(){
   //show alert dialog for user to enter the new habit details
    showDialog(context: context, builder: (context){
        return AlertBox(controller: _newHabitNameController,onSave: saveNewHabit,onCancel: cancelDialogBox,hintText: "Enter Habit Name...",);
    });
  }

  //save new habit
 void saveNewHabit(){
    //add new habit to todays habit list
   setState(() {
     todaysHabitList.add([_newHabitNameController.text,false]);
   });

   //clear textField
   _newHabitNameController.clear();
   //pop dialog box
   Navigator.of(context).pop();
 }
  //cancel new habit
  void cancelDialogBox(){
    //clear textField
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  //open habit settings to edit
  void openHabitSettings(int index){
    showDialog(context: context, builder: (context){
      return AlertBox(controller: _newHabitNameController, onSave: () => saveExistingHabit(index), onCancel: cancelDialogBox,hintText: todaysHabitList[index][0],);
    });
  }

  //save existing habit with a new name
  void saveExistingHabit(int index){
   setState(() {
     todaysHabitList[index][0] = _newHabitNameController.text;
   });
   _newHabitNameController.clear();
   Navigator.pop(context);
  }

  //delete habit
  void deleteHabit (int index){
    setState(() {
      todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton:  CreateHabitFloatingActionButton(onPressed:createNewHabit,),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
          itemBuilder: (context,index){
        return HabitTile(
          habitName: todaysHabitList[index][0],
          habitCompleted: todaysHabitList[index][1],
          onChange: (value)=> checkBoxTapped(value,index),
          settingsTapped: (context) => openHabitSettings(index),
          deleteTapped: (context) =>  deleteHabit(index),
        );
      })

    );
  }
}
