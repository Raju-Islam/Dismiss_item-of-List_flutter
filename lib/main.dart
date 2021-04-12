import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData.light(),
      ),
    );

class HomePage extends StatelessWidget {
  List<String> items =
      new List<String>.generate(30, (index) => "items ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(centerTitle: true, title: Text("Dismissble")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return new Dismissible(
           
            key: new Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                  content: new Text("Item dismissed"),
                ),
              );
            },
            background: new Container(
              color: Colors.red,
              child:new ListTile(trailing: Icon(Icons.delete,color: Colors.white,),
              )
            ),
            child: Container(
                child: Padding(
                  padding: EdgeInsets.all(2),
                   child: Card(
                    elevation: 13,
                    child: new ListTile(
                    title:new Text("${items[index]}")
              ),
                  ),
                ),
            ),
          );
        },
      ),
    );
  }
}
