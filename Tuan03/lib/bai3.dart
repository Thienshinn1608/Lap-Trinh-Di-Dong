import 'package:flutter/material.dart';

class Bai3Page extends StatelessWidget {
  const Bai3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 03 - Thông tin sản phẩm'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HÌNH ẢNH SẢN PHẨM =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ProductImage(
                  imageUrl: 'https://picsum.photos/200?1',
                ),
                ProductImage(
                  imageUrl: 'https://picsum.photos/200?2',
                ),
                ProductImage(
                  imageUrl: 'https://picsum.photos/200?3',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ===== THÔNG TIN SẢN PHẨM =====
            const Text(
              'Mã sản phẩm: SP001',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tên sản phẩm: Điện thoại thông minh XYZ',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Nhà sản xuất: Công ty ABC',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Giá bán: 15.000.000 VNĐ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ===== MÔ TẢ =====
            const Text(
              'Mô tả sản phẩm:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Sản phẩm có thiết kế hiện đại, hiệu năng cao, '
                  'phù hợp cho học tập, làm việc và giải trí. '
                  'Pin dung lượng lớn, camera chất lượng cao.',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== WIDGET ẢNH SẢN PHẨM =====
class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
