

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref extends StatefulWidget {
  const MySharedPref({Key? key}) : super(key: key);

  @override
  State<MySharedPref> createState() => _MySharedPrefState();
}

class _MySharedPrefState extends State<MySharedPref> {
  String? data="NA";
  String? email="NA";
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(data!,style:const TextStyle(fontSize: 30),),
          Text(email!,style:const TextStyle(fontSize: 30),),
          TextButton(onPressed: (){
            writedata();
          }, child:const Text("write")),
          TextButton(onPressed: (){
            deletedata();
          }, child:const Text("Delete Key"))
        ],
      ),
    );
  }
  
  void getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("Name")){
      setState(() {
        data = prefs.getString("Name");
      });
      
    }
       if(prefs.containsKey("email")){
      setState(() {
        email = prefs.getString("email");
      });
      
    }
  }
  
  void writedata() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", "Skillqode");
    prefs.setString("email", "Skill@gmail.com");
    getData();
  }
  
  void deletedata() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("Name");
}
}