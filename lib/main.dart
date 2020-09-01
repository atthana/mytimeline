import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/pages/new_post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atthana Personal Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Personal Post'),
    );
  }
}

//===================================================

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('---------------');
    print(widget.title);
    print(widget);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return NewPostPage();
                  }));
                })
          ],
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text('10 min ago'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hello Q',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                )
              ],
            );
          },
        ));
  }
}
