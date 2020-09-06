import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final postMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('สร้างโพสต์ใหม่'),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: postMessageController,
                  validator: (String text) {
                    if (text.isEmpty) {
                      return 'กรอกข้อมุลก่อนนะจ๊ะ';
                    }
                    if (text.length < 5) {
                      return 'ข้อความที่พิมพ์ ต้องไม่ต่ำกว่า 5 ตัวอักษร';
                    }
                    return null;
                  },
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
                        // ถ้า validate หรือเช็คข้อมูลใน Form Widget แล้วผ่าน
                        // validate() จะคืนค่าเป็น true
                        // คือ ถ้า validator: ด้านบนทำงาน validate() ตรงนี้จะเป็น false และจะไม่ pop กลับไปนะ
                        if (formKey.currentState.validate()) {
                          // ถ้าผ่านแล้ว มีค่าค่อยทำด้านล่างนะ
                          var message = postMessageController.text;
                          print('Message is $message');
                          var postProvider =
                              Provider.of<PostProvider>(context, listen: false);
                          // PostProvider ก้อคือ class ที่เราได้สร้างไว้เป็น Provider, กำหนด listen เป็น false
                          // และนำตัวแปรตัวนึงเข้าไปรับ
                          postProvider.addNewPost(message); // เป็นการเพิ่มข้อมูลเข้าไปใน List Provider ของเรา

                          Navigator.pop(context);
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
