import 'package:flutter/material.dart';

class Bai5Page extends StatelessWidget {
  const Bai5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 05 - Ngành học'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // ===== CNTT =====
            Text(
              'Ngành Công nghệ Thông tin (CNTT)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Ngành Công nghệ Thông tin đào tạo sinh viên '
                  'có kiến thức về lập trình, cơ sở dữ liệu, '
                  'mạng máy tính, phát triển phần mềm và '
                  'ứng dụng công nghệ vào thực tế.',
              style: TextStyle(fontSize: 15),
            ),

            SizedBox(height: 16),

            // ===== ATTT =====
            Text(
              'Ngành An toàn Thông tin (ATTT)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Ngành An toàn Thông tin đào tạo sinh viên '
                  'về bảo mật hệ thống, an ninh mạng, '
                  'mã hóa dữ liệu và phòng chống tấn công mạng. '
                  'Đáp ứng nhu cầu bảo mật thông tin trong thời đại số.',
              style: TextStyle(fontSize: 15),
            ),

            SizedBox(height: 20),

            Text(
              'Khoa Công nghệ Thông tin\n'
                  'Trường Đại học Công Thương TP. Hồ Chí Minh',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
