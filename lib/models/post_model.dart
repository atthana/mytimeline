import 'package:timeago/timeago.dart' as timeago;

// เราเอา class Post มาใช้แทนส่วนที่เป็น String นะ เพราะจะได้รับค่าได้มากกว่าแค่ String ไง

class Post {
  // เราจะสร้าง class นี้ขึ้นมาเป้น model เพื่อใช้ในการจัดการข้อมูลในหน้า post นะ
  String message; // เรากำหนด 2 ตัวแบบนี้้ เพราะเป็น type ที่แสดงในหน้า post ไง
  DateTime createdDate;

  Post({this.message, this.createdDate});

  String get timeagoMessage {
    // สร้าง method ขึ้นมาให้เป็น function get และคืนค่าเป็น String เราสร้าง method แทนพวก property เพราะต้องใ้หมันทำงานบางอย่างก่อนที่จะมีการคืนค่าออกไปนะ
    var now = DateTime.now();
    var duration = now.difference(this.createdDate);
    var ago = now.subtract(duration);
    var message = timeago.format(ago, locale: 'th_short');

    return message;
  }
}
