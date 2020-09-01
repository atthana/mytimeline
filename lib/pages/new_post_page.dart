import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('สร้างโพสต์ใหม่'),
        ),
        body: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  autofocus: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'คุณกำลังทำอะไรคับ'),
                ),
              ),
              Expanded(
                  child:
                      SizedBox()), // expanded ช่วยกันให้ปุ่มลงไปอยู่ล่างสุดนะ
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                      child: Text('Post'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
