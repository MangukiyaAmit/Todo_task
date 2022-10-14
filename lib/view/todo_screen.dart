import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/model/todo_model.dart';

import '../controller/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  final title = TextEditingController();
  final content = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Add New Task",
            ),
          ),
          actions: [
            GetBuilder<TodoController>(
              builder: (TodoController controller) {
                return Center(child: Text("${controller.todoList.length}"));
              },
            ),
            SizedBox(
              width: 20,
            ),
          ]),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: content,
                decoration: InputDecoration(hintText: 'Content'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 80,
                    color: Colors.blue,
                    onPressed: () {
                      var todoModel = TodoModel(
                          id: todoController.todoList.length,
                          title: title.text,
                          content: content.text);
                      todoController.addTodo(todoModel);
                      title.clear();
                      content.clear();
                      FocusScope.of(context).unfocus();
                      Get.back();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 80,
                    color: Colors.blue,
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
