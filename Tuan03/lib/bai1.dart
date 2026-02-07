import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThongTinPage(),
    );
  }
}

class ThongTinPage extends StatelessWidget {
  const ThongTinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin sinh viên'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // ===== SINH VIÊN =====
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'data:image/jpeg;base64,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',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Họ và tên: Nguyễn Văn A',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'MSSV: 2001221234',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Lớp: 13DHTH02',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Khóa: 13 Đại học',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Ngành: Công nghệ thông tin',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Trường: ĐH Công Thương TP.HCM',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 8),

            // ===== GIẢNG VIÊN =====
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'data:image/jpeg;base64,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',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Giảng viên: Trần Thị A',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Khoa: Công nghệ Thông tin',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Học hàm: Thạc sĩ',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Chuyên ngành: CNPM',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'Giảng dạy: Nhập môn lập trình, Lập trình Web',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
