class Task {
  String title;
  bool isCompleted;

  Task({this.isCompleted = false, required this.title});

  factory Task.fromJson(Map<String, dynamic> task) =>
      Task(title: task['title'], isCompleted: task['isCompleted']);

  Map<String, dynamic> toJson() => {'title': title, 'isCompleted' : isCompleted};
}
