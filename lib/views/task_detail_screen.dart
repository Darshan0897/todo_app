import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_detail_controller.dart';


class TaskDetail extends StatelessWidget {
  TaskDetail({Key? key}) : super(key: key);
 final TaskDetailController _controller = Get.put(TaskDetailController());
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(),
      body: Text(Get.arguments.toString()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.additems(),
        child: const Icon(Icons.add),
      ),
    );
  }
}