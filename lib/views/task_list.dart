import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_list_controller.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);

  final TaskListController _controller = Get.put(TaskListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => ListView.builder(
          itemCount: _controller.items.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(_controller.items[index]),
                trailing:  GestureDetector(onTap: ()=>
                  _controller.removeItem(index),
                
                  child: const Icon(Icons.delete,color: Colors.red,
                  ),
                ),
              )))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.additems(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
