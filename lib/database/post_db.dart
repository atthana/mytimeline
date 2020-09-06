import 'dart:io';
import 'package:nextflow_personal_post/models/post_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PostDB {
  String databaseName;

  PostDB({this.databaseName});

  Future<Database> openDatabase() async {
    Directory appDocumentDirectory =
        await getApplicationDocumentsDirectory(); // อันนี้เป็นคำสั่งจาก path_provider นะ เพื่อเข้าถึง path ใน directory และคืนค่าออกมาเป็น Future<Directory>
    // สรุปคำสั่งข้างบนคือ การหาที่อยุ่ของ folder Documents ในระบบของเรา เหมือนเราหา c:\Users\My Document แบบนี้ใน Windows นั่นแหละ
    String databaseLocationInapp = join(appDocumentDirectory.path,
        this.databaseName); // join มาจาก path.dart นะ เราต้อง import เอง
    // ข้างบนคือ การนำที่อยุ่ของ folder Document กับชื่อ database มารวมกัน เพื่อให้ได้ path ทั้งหมดที่เราจะเรียกใช้

    DatabaseFactory dbFactory =
        databaseFactoryIo; // dbfactory จะเปิดการเชื่อมต่อไปที่ database นะ (เป็นระบบจัดการของ sembast)
    Database db = await dbFactory.openDatabase(
        databaseLocationInapp); // ทำการ open db จิงๆล่ะนะ คืนค่ากลับมาเป็น Future
    // คือ ถ้าไม่มี db จะสร้างให้นะ ถ้ามีแล้วก้อจะไปเปิดมันขึ้นมา
    return db;
  }

  Future<int> save(Post post) async {
    var database = await this.openDatabase();
    var postStore = intMapStoreFactory.store('posts');
    // intMapStoreFactory เป็นคำสั่งที่ใช้ชี้ไปที่ store ที่ใช้เก็บข้อมูล โดยเราตั้งชื่อว่า posts นะ
    // พอเราจะเรียกออกมาใช้งาน ก้อเอาตัวแปรมารับชื่อว่า postStore นะ
    // อ่อ intMapStoreFactory เป็นระบบรันเลขด้วยนะ เมื่อมีข้อมูลใหม่ๆมาก้อจะรันเลขให้เพิ่มขึ้นไปเรื่อยๆและส่งเลขตัวนั้นไปที่ dataId คือเลขที่ไม่ซ้ำกันนั้นแหละ

    var dataId = await postStore.add(database, Post.toJson(post));
    // จริงๆ อันนี้ Post.toJson(post) แค่ย้ายกลไกในการสร้าง json ไปไว้ใน class แค่นั้นเอง

    await database.close();
    // ปิดการเชื่อมต่อ เพื่อความปลอดภัยและประสิทธิภาพของแอฟ
    return dataId;
  }

  Future<List<Post>> loadAllPosts() async {
    var database = await this.openDatabase(); // open database ก่อนเลย
    var postStore = intMapStoreFactory.store('posts');
    // บอกให้sambast เข้าไปยุ่งกับฐานข้อมูลที่ชื่อว่า posts ชื่อเดียวกับตอน add อ่ะนะ

    var snapshots = await postStore.find(database);

    //==========================
    var postsList = List<Post>();
    for (var record in snapshots) {
      var post = Post.fromRecord(record);
      postsList.add(post);
      // เป็นการแปลงข้อมูล Record Snapshots เป็นข้อมูล Post
    }

    //==========================
    return postsList;
  }
}
