import 'package:get/get.dart';

import '../model/todo_model.dart';

class TodoController extends GetxController {
  List<TodoModel> todoList = [];

  void addTodo(TodoModel model) {
    todoList.add(model);
    update();
  }

  void removeTodo(TodoModel model) {
    print(todoList.length);
    todoList.remove(model);
    print(todoList.length);
    update();
  }
}
