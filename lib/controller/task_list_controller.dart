import 'package:get/get.dart';
import 'package:todo_app/views/task_detail_screen.dart';


class TaskListController extends GetxController{

RxList<String> items = <String>[].obs;
RxInt count =0.obs;

void increment() => count++;

  additems() {
    items.add("Item:${items.length+1}");
   
  }
   removeItem(index){
     items.removeAt(index);
   // Get.toNamed('/task_detail',arguments: "hi");
  //Get.to(TaskDetail(),arguments: "hi");
 // Get.snackbar("hi", "my name is $index");
    }
}