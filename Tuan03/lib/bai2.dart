import 'package:flutter/material.dart';

class Bai2Page extends StatelessWidget {
  const Bai2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 02 - Đề tài đồ án'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mã đề tài: DT001',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Tên đề tài: Xây dựng ứng dụng quản lý sinh viên bằng Flutter',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Số lượng sinh viên tối đa: 3',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Chuyên ngành: Công nghệ thông tin',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Giảng viên hướng dẫn: ThS. Nguyễn Văn B',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  'Yêu cầu đề tài:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '- Sinh viên nắm vững Flutter cơ bản\n'
                      '- Biết sử dụng Widget, Layout\n'
                      '- Kết nối dữ liệu giả lập\n'
                      '- Giao diện rõ ràng, dễ sử dụng',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
