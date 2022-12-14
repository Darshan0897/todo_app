import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/views/my_shared_pref.dart';
import 'package:todo_app/views/task_detail_screen.dart';
import 'package:todo_app/views/task_list.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/sp',
     getPages: [
      GetPage(name: '/sp', page: ()=>const MySharedPref()),
     // GetPage(name: '/task_detail', page: ()=>TaskDetail()),
      GetPage(name: '/task_list', page: ()=>TaskList()),
      GetPage(name: '/task_detail', page: ()=>TaskDetail()),
     ],
    );
  }
}


