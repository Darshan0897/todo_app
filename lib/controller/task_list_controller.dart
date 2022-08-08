import 'package:get/get.dart';



class TaskListController extends GetxController{

RxList<String> items = <String>[].obs;
RxInt count =0.obs;

void increment() => count++;

  additems() {
  
   
  }
   removeItem(index){
     items.removeAt(index);
   // Get.toNamed('/task_detail',arguments: "hi");
  //Get.to(TaskDetail(),arguments: "hi");
 // Get.snackbar("hi", "my name is $index");
    }
}