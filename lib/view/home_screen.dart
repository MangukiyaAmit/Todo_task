import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:todo/view/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home Screen",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TodoScreen());
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<TodoController>(
        builder: (controller) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                print(controller.todoList[index].hashCode);
                var item = controller.todoList[index].title;
                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ),
                  key: Key(item.hashCode.toString()),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    print(controller.todoList[index].hashCode);
                    todoController.removeTodo(controller.todoList[index]);

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$item dismissed')));
                  },
                  child: ListTile(
                    title: Text(controller.todoList[index].title),
                    subtitle: Text(controller.todoList[index].content),
                  ),
                );
                // return ListTile(
                //   title: Text(controller.todoList[index].title),
                //   subtitle: Text(controller.todoList[index].content),
                //   trailing: IconButton(
                //       onPressed: () {
                //         print(controller.todoList[index].runtimeType);
                //         todoController.removeTodo(controller.todoList[index]);
                //       },
                //       icon: Icon(Icons.delete)),
                // );
              },
              itemCount: controller.todoList.length);
        },
      ),
    );
  }
}
