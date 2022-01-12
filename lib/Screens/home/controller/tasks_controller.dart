import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management_app/Screens/home/models/task_model.dart';

class TasksController extends GetxController {
  var tasks = <Task>[].obs;
  TextEditingController taskController = TextEditingController();
  final addTaskFormKey = GlobalKey<FormState>();
  GetStorage tasksRepo = GetStorage();

  @override
  void onInit() {
    List? storedTasks = tasksRepo.read<List>('tasks');
    if (storedTasks != null) {
      tasks = storedTasks.map((e) => Task.fromJson(e)).toList().obs;
    }
    ever(tasks, (_) {
      tasksRepo.write('tasks', tasks.toList());
    });
    super.onInit();
  }

  void addTask(Task task, BuildContext context) {
    if (addTaskFormKey.currentState!.validate()) {
      tasks.add(task);
      update();
      addTaskFormKey.currentState!.reset();
      Navigator.pop(context);
    }
    ;
  }

  String? validateTask(String? val) {
    if (taskController.text.isEmpty || taskController.text == null) {
      return 'Please add a title to your task';
    }
    ;
    return null;
  }

  void dissmissTask(int index) {
    Task? removed = tasks[index];
    tasks.removeAt(index);
    update();
    Get.snackbar(
      'Task Removed',
      '✔ ${removed.title}',
      backgroundColor: Colors.white,
      mainButton: TextButton(
        child: Text('Undo'),
        onPressed: () {
          tasks.insert(index, removed!);
          update();
          removed = null;
        },
      ),
    );
  }

  void toggleTasktile(Task task) {
    int index = tasks.indexOf(task);
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
    update();
  }
}
