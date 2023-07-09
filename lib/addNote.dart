import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class adpage extends StatefulWidget {
  const adpage({super.key});

  @override
  State<adpage> createState() => _adpageState();
}
Random random = new Random();
int randomNumber = random.nextInt(100);
Map UserDetails={
  'userId':randomNumber.toString(),
  'todo':"",
  'lastUpdate':"",
  'completed':false,

};
class _adpageState extends State<adpage> {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            UserDetails['todo']=titleController.text.toString();
              save(UserDetails);
          },
              child: Text('submit'))
        ],
      ),
    );
  }

  Future<void> save(Map userDetails) async {


    var url = Uri.parse('http://localhost:3000/health/addHealth');
    var body = jsonEncode(userDetails);
    var response = await http.post(url,body: body,headers: { 'Content-type': 'application/json'});



    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Logged In successfully"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("todo saved"),
      ));
    }
  }
}
