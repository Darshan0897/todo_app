import 'package:get/get.dart';

class TaskDetailController extends GetxController{

RxList<String> items = <String>[].obs;
RxInt count =0.obs;

void increment() => count++;

  additems() {
    items.add("Item:${items.length+1}");
   
  }
   removeItem(index){
     // items.removeAt(index);
     Get.toNamed('/task_detail',arguments: 'hi');
    }
}