import 'package:flutter/foundation.dart';

// สร้าง provider มารับข้อมุลเก็บไว้ใน List
class PostProvider with ChangeNotifier {
  // keyword 'this' เป็นการทำให้ class นี้ใช้คุณสมบัติของ ChangeNotifier แต่ต้องมาจาก foundation นะ
  // นี่คือ PostProvider ที่จะเป็นตัวที่ทำหน้าที่ share ข้อมูลให้กับ application ของเรา
  List<String> _posts = ['Atthana', 'Phiphat'];
  // PostProvder class จะมีการเก็บ list ของ _posts ที่เป็น String ไว้

  // function posts นี้จะทำหน้าที่นำข้อมูลที่อยู่ใน list ส่งออกไปยัง widget ที่ต้องการได้
  // เราไม่ได้ส่งออก _posts ของเราโดยตรง แต่ทำผ่านตัว function get นี่แหละ
  // โดย Function ก้อ return ออกไปเป็น List ที่เป็น String นั่นเอง
  // เวลา consumer ต้องการข้อมูลจาก provider ก้อจะทำผ่าน function นี้นั่นเอง

  // List<String> get posts {
  //   return _posts;
  // }

  List<String> get posts => _posts; // เราเขียนสั้นๆแบบนี้แทนอันบนได้เลย

  addNewHost(String post) {
    // ตัวนี้ทำหน้าที่รับ String เข้ามาแล้วไปเพิ่มเข้าไปใน List _posts
    // _posts.add(post);  // ถ้าใช้ .add มันจะเพิ่มเข้าไปที่ส่วนท้ายของ List นะ ถ้าเราอยากให้มันเป็นตัวแรก จะต้องใช้ insert แทน
    _posts.insert(0, post);  // ถ้ากำหนดแบบนี้ จะทำให้ post ไปอยู่ที่ index 0 เสมอ

    notifyListeners(); // Function นี้มาจาก ChangeNotifier นะ
    // โดยมันจะทำการแจ้งเตือน คนที่คอยรับการเปลี่ยนแปลงของข้อมูลจาก provier ตัวนี้อยุ่
    // ซึ่งจะทำให้ consumer ที่รอข้อมูลรับรู้การเปลี่ยนแปลงและดึงข้อมุลไปใช้ได้นะ
  }
}
