import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_list_controller.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);

  final TaskListController _controller = Get.put(TaskListController());
  final Stream<QuerySnapshot> _tasks =
      FirebaseFirestore.instance.collection('tasks').snapshots();
      String? task='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: Obx(() => ListView.builder(
      //     itemCount: _controller.items.length,
      //     itemBuilder: ((context, index) => ListTile(
      //           title: Text(_controller.items[index]),
      //           trailing:  GestureDetector(onTap: ()=>
      //             _controller.removeItem(index),

      //             child: const Icon(Icons.delete,color: Colors.red,
      //             ),
      //           ),
      //         )))),
      body: StreamBuilder(
          stream: _tasks,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // print(snapshot.connectionState);
            // print(snapshot.hasData);
            if (snapshot.hasError) {
              return const Text("something went wrong");
            }
            return ListView(
              
                children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
              return ListTile(
                onLongPress: ()=>update(context:context,docId:doc.id,oldTask:data['taskTitle']),
                title: Text(data['taskTitle']),
                subtitle: Text(data['taskDesc']),
                trailing: IconButton(onPressed: ()async{
                    await FirebaseFirestore.instance.collection('tasks').doc(doc.id).delete();
                }, icon:const Icon(Icons.delete)),
              );
            }).toList());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          task='';
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: TextFormField(onChanged: (v){
                      task =v;
                    },
                    decoration:const InputDecoration(hintText: 'Enter Task'),),
                    actions: [TextButton(onPressed:  ()async{
                      //Add task logic on firebase
                      await FirebaseFirestore.instance.collection('tasks').add({
                        'taskTitle':task,
                        'taskDesc':'NA',
                       });
                       Get.back();
                    }, child:const Text("Add Task"))],
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  update({ context,docId,oldTask}) {
    task='oldTask';
    showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: TextFormField(
                      initialValue: oldTask,
                      onChanged: (v){
                      task =v;
                    },
                    decoration:const InputDecoration(hintText: 'Enter Task'),),
                    actions: [TextButton(onPressed: ()async{
                      //Add task logic on firebase
                      await FirebaseFirestore.instance.collection('tasks').doc(docId).update({
                        'taskTitle':task,
                        'taskDesc':'NA',
                       });
                       Get.back();
                    }, child:const Text("Update Task"))],
                  ));
  }
}
