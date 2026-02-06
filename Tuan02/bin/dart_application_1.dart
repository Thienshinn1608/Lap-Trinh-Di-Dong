import 'dart:io';
import 'package:dart_application_1/dart_application_1.dart';

void main(List<String> arguments) {
  print('===== MENU =====');
  print('1. BTTL: Tính tiền phòng');
  print('2. BTTL: Quản lý môn học');
  print('3. BTVN: Quản lý hóa đơn');
  stdout.write('Chọn bài (1/2/3): ');

  int chon = int.parse(stdin.readLineSync()!);

  switch (chon) {
    case 1:
      bai1();
      break;
    case 2:
      bai2();
      break;
    case 3:
      bai3();
      break;
    default:
      print('Lựa chọn không hợp lệ');
  }
}

void bai1() {
  print('\n===== BTTL: TÍNH TIỀN PHÒNG =====');

  List<Phong> dsPhong = [];
  final file = File('phongthue.txt');

  if (!file.existsSync()) {
    print('Không tìm thấy file phongthue.txt');
    return;
  }

  final lines = file.readAsLinesSync();

  for (var line in lines) {
    var parts = line.split('#');

    // Phòng loại A
    if (parts[0].startsWith('A')) {
      LoaiA phongA = LoaiA();
      phongA.maPhong = parts[0];
      phongA.soNguoi = int.parse(parts[1]);
      phongA.soDien = int.parse(parts[2]);
      phongA.soNuoc = int.parse(parts[3]);
      phongA.soNguoiThan = int.parse(parts[4]);
      dsPhong.add(phongA);
      continue;
    }

    // Phòng loại B
    if (parts[0].startsWith('B')) {
      LoaiB phongB = LoaiB();
      phongB.maPhong = parts[0];
      phongB.soNguoi = int.parse(parts[1]);
      phongB.soDien = int.parse(parts[2]);
      phongB.soNuoc = int.parse(parts[3]);
      phongB.giatUi = int.parse(parts[4]);
      phongB.soMay = int.parse(parts[5]);
      dsPhong.add(phongB);
      continue;
    }
  }

  // In danh sách phòng
  print('=== DANH SÁCH CÁC PHÒNG THUÊ ===');
  for (var phong in dsPhong) {
    phong.thongTin();
  }

  // Phòng có số người > 2
  print('\n=== PHÒNG CÓ SỐ NGƯỜI > 2 ===');
  for (var phong in dsPhong) {
    if (phong.soNguoi > 2) {
      phong.thongTin();
    }
  }

  // Tổng tiền phòng
  print('\n=== TỔNG TIỀN PHÒNG ===');
  int tongTien = 0;
  for (var phong in dsPhong) {
    tongTien += phong.TinhTien();
  }
  print('Tổng tiền: $tongTien');

  // Sắp xếp theo số điện giảm dần
  print('\n=== DANH SÁCH SẮP XẾP THEO SỐ ĐIỆN GIẢM DẦN ===');
  dsPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  for (var phong in dsPhong) {
    phong.thongTin();
  }

  // Danh sách phòng loại A
  print('\n=== DANH SÁCH PHÒNG LOẠI A ===');
  for (var phong in dsPhong) {
    if (phong is LoaiA) {
      phong.thongTin();
    }
  }
}

void bai2() {
  print('\n===== BTTL: QUẢN LÝ MÔN HỌC =====');

  List<Course> subjects = [];

  // Nhập vào danh sách các môn học từ bàn phím
  print('Nhập vào số lượng môn học:');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print('--- Môn ${i + 1} ---');
    print('Nhập mã môn học:');
    String courseId = stdin.readLineSync()!;
    print('Nhập tên môn học:');
    String courseName = stdin.readLineSync()!;
    print('Nhập số tín chỉ:');
    int credits = int.parse(stdin.readLineSync()!);

    if (courseId.startsWith('LT')) {
      subjects.add(TheoryCourse(courseId, courseName, credits, 0.0, 0.0));
    } else if (courseId.startsWith('TH')) {
      subjects.add(PracticeCourse(courseId, courseName, credits, []));
    } else if (courseId.startsWith('KH')) {
      subjects.add(ThesisCourse(courseId, courseName, credits, 0.0, 0.0));
    } else {
      print('Loại môn học không hợp lệ. Vui lòng nhập lại.');
      i--;
    }
  }

  // Xuất danh sách các môn học
  print('\nDanh sách môn học đã nhập:');
  for (var subject in subjects) {
    print('${subject.courseName} - ${subject.credits} tín chỉ');
  }

  // Kiểm tra danh sách tăng dần theo tên môn học
  bool isSortedByName = true;
  for (int i = 1; i < subjects.length; i++) {
    if (subjects[i].courseName
            .compareTo(subjects[i - 1].courseName) <
        0) {
      isSortedByName = false;
      break;
    }
  }
  print(
      'Danh sách môn học có được sắp xếp tăng dần theo tên môn học: $isSortedByName');

  // Sắp xếp danh sách môn học theo số tín chỉ
  subjects.sort((a, b) => a.credits.compareTo(b.credits));
  print('\nDanh sách môn học sau khi sắp xếp theo số tín chỉ:');
  for (var subject in subjects) {
    print('${subject.courseName} - ${subject.credits} tín chỉ');
  }

  // Tìm các môn học có số tín chỉ cao nhất
  int maxCredits = subjects
      .map((subject) => subject.credits)
      .reduce((a, b) => a > b ? a : b);

  print('\nCác môn học có số tín chỉ cao nhất:');
  for (var subject
      in subjects.where((subject) => subject.credits == maxCredits)) {
    print('${subject.courseName} - ${subject.credits} tín chỉ');
  }

  // Nhập vào tên môn học để kiểm tra
  print('\nNhập tên môn học để kiểm tra:');
  String searchName = stdin.readLineSync()!;

  Course? foundSubject;
  for (var subject in subjects) {
    if (subject.courseName == searchName) {
      foundSubject = subject;
      break;
    }
  }

  if (foundSubject == null) {
    print('Môn học không có trong danh sách. Thêm vào danh sách.');
    print('Nhập mã môn học mới:');
    String courseId = stdin.readLineSync()!;
    print('Nhập số tín chỉ cho môn học mới:');
    int newCredits = int.parse(stdin.readLineSync()!);

    if (courseId.startsWith('LT')) {
      subjects.add(
          TheoryCourse(courseId, searchName, newCredits, 0.0, 0.0));
    } else if (courseId.startsWith('TH')) {
      subjects.add(PracticeCourse(courseId, searchName, newCredits, []));
    } else if (courseId.startsWith('KH')) {
      subjects.add(
          ThesisCourse(courseId, searchName, newCredits, 0.0, 0.0));
    }
  } else {
    print(
        'Thông tin môn học: ${foundSubject.courseName} - ${foundSubject.credits} tín chỉ');
  }

  // Đọc dữ liệu từ file monhoc.txt
  File file = File('monhoc.txt');
  if (file.existsSync()) {
    List<String> lines = file.readAsLinesSync();
    for (var line in lines) {
      List<String> parts = line.split('-');
      String courseId = parts[0];
      String courseName = parts[1];
      int credits = int.parse(parts[2]);

      if (courseId.startsWith('LT')) {
        subjects.add(
            TheoryCourse(courseId, courseName, credits, 0.0, 0.0));
      } else if (courseId.startsWith('TH')) {
        subjects.add(PracticeCourse(courseId, courseName, credits, []));
      } else if (courseId.startsWith('KH')) {
        subjects.add(
            ThesisCourse(courseId, courseName, credits, 0.0, 0.0));
      }
    }
  }

  print('\nDanh sách môn học từ file monhoc.txt:');
  for (var subject in subjects) {
    print('${subject.courseName} - ${subject.credits} tín chỉ');
  }

  // Tính số tín chỉ trung bình
  double averageCredits = subjects
          .map((subject) => subject.credits)
          .reduce((a, b) => a + b) /
      subjects.length;
  print('Số tín chỉ trung bình: $averageCredits');
}

void bai3() {
  print('\nBTVN: QUẢN LÝ HÓA ĐƠN');

  QuanLyHoaDon ql = QuanLyHoaDon();

  ql.themHoaDon(CaNhan('KH0001', 'Nguyen Van A', 4, 10000000, 8));
  ql.themHoaDon(DaiLyCap1('KH0002', 'Dai Ly B', 10, 9500000, 7));
  ql.themHoaDon(CongTy('KH0003', 'Cong ty C', 20, 9000000, 6000));

  print('--- Danh sách hóa đơn ---');
  ql.xuatDanhSach();

  print('Tổng thành tiền: ${ql.tongThanhTien()}');
  print('Tổng trợ giá: ${ql.tongTroGia()}');

  var max = ql.khachMuaNhieuNhat();
  if (max != null) {
    print('Khách mua nhiều nhất: ${max.tenKH}');
  }

  print('Tổng chiết khấu công ty: ${ql.tongChietKhauCongTy()}');

  print('\nSau khi sắp xếp:');
  ql.sapXep();
  ql.xuatDanhSach();

  print('\nTìm KH0002:');
  ql.timHoaDonTheoMa('KH0002');
}
