import 'package:flutter/material.dart';

class Bai4Page extends StatelessWidget {
  const Bai4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 04 - Thông tin nhóm'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mã nhóm: N01',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Tên nhóm: Nhóm Flutter',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              'Số lượng thành viên: 3',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            // ===== THÀNH VIÊN =====
            const MemberCard(
              mssv: '2001220001',
              name: 'Nguyễn Văn A',
              role: 'Nhóm trưởng',
            ),
            const MemberCard(
              mssv: '2001220002',
              name: 'Trần Thị B',
              role: 'Thành viên',
            ),
            const MemberCard(
              mssv: '2001220003',
              name: 'Lê Văn C',
              role: 'Thành viên',
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String mssv;
  final String name;
  final String role;

  const MemberCard({
    super.key,
    required this.mssv,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text('MSSV: $mssv'),
        trailing: Text(
          role,
          style: TextStyle(
            color: role == 'Nhóm trưởng' ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
