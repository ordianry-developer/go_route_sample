
class Task {
  final String name;
  final int id;
  bool isDone;
  final String? detail;

  Task({required this.name,this.isDone = false,required this.id,this.detail});

  void toggleDone(){
    isDone = !isDone;
  }
}
