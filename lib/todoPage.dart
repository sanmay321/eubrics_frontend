import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t0d0/addNote.dart';
import 'package:http/http.dart' as http;

class tpage extends StatefulWidget {
  const tpage({super.key});

  @override
  State<tpage> createState() => _tpageState();
}

class _tpageState extends State<tpage> {
  List items = [
      // 'todo'= "ss",

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder:(context,index){
          final item = items[index] as Map;
        return ListTile(
          title: Text(item['todo']),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const adpage(),
              ),
            );
          },
          label: Text('Add Note')),
    );
  }
  void navigateToAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const adpage(),
      ),
    );
  }

  Future<void> fetchData() async{
    final url = "http://localhost:3000/health/getAll";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
  }
}


