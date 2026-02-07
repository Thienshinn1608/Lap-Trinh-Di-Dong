import 'package:flutter/material.dart';
import 'bai1.dart';
import 'bai2.dart';
import 'bai3.dart';
import 'bai4.dart';
import 'bai5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, 'Bài 01 - Sinh viên', const ThongTinPage()),
            buildButton(context, 'Bài 02 - đồ án khóa luận', const Bai2Page()),
            buildButton(context, 'Bài 03 - sản phẩm trong cửa hàng', const Bai3Page()),
            buildButton(context, 'Bài 04 - thông tin của một nhóm gồm', const Bai4Page()),
            buildButton(context, 'Bài 05 - giới thiệu thông tin về ngành học CNTT và ngành học ATTT', const Bai5Page()),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          child: Text(text),
        ),
      ),
    );
  }
}
