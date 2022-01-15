import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';

TasksController tasksController = Get.find();

class ProfileController extends GetxController {

late int currentTasks;
late int completedTasks;


int countCurrentTasks() {
  currentTasks = tasksController.tasks.length;
  return currentTasks;
}
int countCompletedTasks() {
  completedTasks = tasksController.tasks.where((e) => (e.isCompleted == true)).toList().length;
  return completedTasks;
}

int countPendingTasks() {
 return currentTasks - completedTasks;
}

String calcCompletionRate() {
  return (completedTasks/currentTasks * 100).toStringAsFixed(0);
}

}