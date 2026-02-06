// ===================================================
// Bai 1 Tren Lop
// ===================================================
class Phong
{
  late String maPhong;
  late int soNguoi;
  late int soDien;
  late int soNuoc;
  

  Phong(){}

  Phong.full(String maPhong, int soNguoi, int soDien, int soNuoc, int parse)
  {
    this.maPhong = maPhong;
    this.soDien = soDien;
    this.soNguoi = soNguoi;
    this.soNuoc = soNuoc;
    
  }

  int TinhTien()
  {
    int total = 2 * soDien +8 * soNuoc;
    return total;
  }
  void thongTin()
  {
    print('Mã phòng: $maPhong, Số người: $soNguoi, Số điện: $soDien, Số nước: $soNuoc');
  }
}

class LoaiA extends Phong
{
    late int soNguoiThan;

 
    @override
    int TinhTien()
    {
      int total = super.TinhTien() + 1400 + 50 * soNguoiThan;
      return total;
    }
    @override
  void thongTin()
  {
    print('Mã phòng: $maPhong, Số người: $soNguoi, Số điện: $soDien, Số nước: $soNuoc, Số người thân: $soNguoiThan');
  }
}

class LoaiB extends Phong
{
    late int giatUi;
    late int soMay;
    @override
    int TinhTien()
    {
      int total = super.TinhTien() + 2000 + 5*giatUi + soMay * 100;

      return total;
    }

    @override
    void thongTin()
  {
    print('Mã phòng: $maPhong, Số người: $soNguoi, Số điện: $soDien, Số nước: $soNuoc, Giặt ủi: $giatUi, Số máy: $soMay');
  }
}

// ===================================================
// Bai 2 Tren Lop
// ===================================================
abstract class Course {
  String courseId;
  String courseName;
  int credits;

  Course(this.courseId, this.courseName, this.credits);

  double calculateGPA();
  String getLetterGrade();
}

class TheoryCourse extends Course {
  double essayScore;
  double finalExamScore;

  TheoryCourse(
    String courseId,
    String courseName,
    int credits,
    this.essayScore,
    this.finalExamScore,
  ) : super(courseId, courseName, credits);

  @override
  double calculateGPA() {
    return essayScore * 0.3 + finalExamScore * 0.7;
  }

  @override
  String getLetterGrade() {
    double gpa = calculateGPA();
    if (gpa >= 3.8) return 'A';
    if (gpa >= 3.4) return 'A-';
    if (gpa >= 3.0) return 'B+';
    if (gpa >= 2.6) return 'B';
    if (gpa >= 2.2) return 'B-';
    if (gpa >= 1.8) return 'C+';
    if (gpa >= 1.4) return 'C';
    if (gpa >= 1.0) return 'D+';
    if (gpa >= 0.6) return 'D';
    return 'F';
  }
}

class PracticeCourse extends Course {
  List<double> examScores;

  PracticeCourse(
    String courseId,
    String courseName,
    int credits,
    this.examScores,
  ) : super(courseId, courseName, credits);

  @override
  @override
double calculateGPA() {
  return examScores.fold(0.0, (a, b) => a + b) / (examScores.isEmpty ? 1 : examScores.length);
}

  @override
  String getLetterGrade() {
    double gpa = calculateGPA();
    if (gpa >= 3.8) return 'A';
    if (gpa >= 3.4) return 'A-';
    if (gpa >= 3.0) return 'B+';
    if (gpa >= 2.6) return 'B';
    if (gpa >= 2.2) return 'B-';
    if (gpa >= 1.8) return 'C+';
    if (gpa >= 1.4) return 'C';
    if (gpa >= 1.0) return 'D+';
    if (gpa >= 0.6) return 'D';
    return 'F';
  }
}

class ThesisCourse extends Course {
  double advisorScore;
  double reviewerScore;

  ThesisCourse(
    String courseId,
    String courseName,
    int credits,
    this.advisorScore,
    this.reviewerScore,
  ) : super(courseId, courseName, credits);

  @override
  double calculateGPA() {
    return (advisorScore + reviewerScore) / 2;
  }

  @override
  String getLetterGrade() {
    double gpa = calculateGPA();
    if (gpa >= 3.8) return 'A';
    if (gpa >= 3.4) return 'A-';
    if (gpa >= 3.0) return 'B+';
    if (gpa >= 2.6) return 'B';
    if (gpa >= 2.2) return 'B-';
    if (gpa >= 1.8) return 'C+';
    if (gpa >= 1.4) return 'C';
    if (gpa >= 1.0) return 'D+';
    if (gpa >= 0.6) return 'D';
    return 'F';
  }
}


class Student {
  String studentId;
  String studentName;
  List<Course> courses = [];

  Student(this.studentId, this.studentName);

  void addCourse(Course course) {
    courses.add(course);
  }

  double calculateCumulativeGPA() {
    if (courses.isEmpty) return 0;
    double totalWeightedScore = 0;
    int totalCredits = 0;
    for (var course in courses) {
      totalWeightedScore += course.calculateGPA() * course.credits;
      totalCredits += course.credits;
    }
    return totalWeightedScore / totalCredits;
  }
}

// ===================================================
// Bai Tap Ve Nha
// ===================================================
class HoaDon {
  String maKH;
  String tenKH;
  int soLuong;
  double giaBan;

  HoaDon({this.maKH = '', this.tenKH = '', this.soLuong = 0, this.giaBan = 0});

  HoaDon.dayDu(this.maKH, this.tenKH, this.soLuong, this.giaBan) {
    if (!RegExp(r'^KH\d{4}$').hasMatch(maKH)) {
      throw Exception('Mã khách hàng sai định dạng');
    }
    if (tenKH.isEmpty) throw Exception('Tên khách hàng không được để trống');
    if (soLuong <= 0) throw Exception('Số lượng phải > 0');
    if (giaBan <= 0) throw Exception('Giá bán phải > 0');
  }

  double getVAT() => 0.1 * soLuong * giaBan;

  double tinhChietKhau() => 0;
  double tinhTroGia() => 0; 

  double thanhTien() {
    return soLuong * giaBan - tinhChietKhau() + getVAT() - tinhTroGia();
  }

  void xuatThongTin() {
    print('Mã KH: $maKH, Tên KH: $tenKH, SL: $soLuong, Giá: $giaBan');
    print('Chiết khấu: ${tinhChietKhau()}');
    print('Trợ giá: ${tinhTroGia()}');
    print('Thành tiền: ${thanhTien()}');
  }
}
class CaNhan extends HoaDon {
  double khoangCach;

  CaNhan(String maKH, String tenKH, int soLuong, double giaBan, this.khoangCach)
      : super.dayDu(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double ck = 0;
    if (soLuong >= 3) ck += 0.05 * giaBan * soLuong;
    if (khoangCach < 10) ck += 50000 * soLuong;
    return ck;
  }

  @override
  double tinhTroGia() {
    double tg = 0.02 * giaBan * soLuong;
    if (soLuong > 2) tg += 100000;
    return tg;
  }
}
class DaiLyCap1 extends HoaDon {
  int namHopTac;

  DaiLyCap1(String maKH, String tenKH, int soLuong, double giaBan, this.namHopTac)
      : super.dayDu(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double tile = 0.3;
    if (namHopTac > 5) {
      tile += (namHopTac - 5) * 0.01;
      if (tile > 0.35) tile = 0.35;
    }
    return tile * giaBan * soLuong;
  }
}
class CongTy extends HoaDon {
  int soNhanVien;

  CongTy(String maKH, String tenKH, int soLuong, double giaBan, this.soNhanVien)
      : super.dayDu(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    if (soNhanVien > 5000) return 0.07 * giaBan * soLuong;
    if (soNhanVien > 1000) return 0.05 * giaBan * soLuong;
    return 0;
  }

  @override
  double tinhTroGia() {
    return (120000 * soLuong).toDouble();
  }
}
class QuanLyHoaDon {
  List<HoaDon> dsHoaDon = [];

  void themHoaDon(HoaDon hd) => dsHoaDon.add(hd);

  // Xuất danh sách theo dạng bảng gọn gàng
  void xuatDanhSach() {
    print('MãKH   | TênKH         | SL | Giá bán   | CK       | TG       | Thành tiền');
    print('----------------------------------------------------------------------------');
    for (var hd in dsHoaDon) {
      print('${hd.maKH.padRight(6)} | '
            '${hd.tenKH.padRight(12)} | '
            '${hd.soLuong.toString().padLeft(2)} | '
            '${hd.giaBan.toStringAsFixed(0).padLeft(8)} | '
            '${hd.tinhChietKhau().toStringAsFixed(0).padLeft(8)} | '
            '${hd.tinhTroGia().toStringAsFixed(0).padLeft(8)} | '
            '${hd.thanhTien().toStringAsFixed(0).padLeft(10)}');
    }
  }

  // 1. Tổng thành tiền
  double tongThanhTien() =>
      dsHoaDon.fold(0, (sum, hd) => sum + hd.thanhTien());

  // 2. Tổng trợ giá
  double tongTroGia() =>
      dsHoaDon.fold(0, (sum, hd) => sum + hd.tinhTroGia());

  // 3. Khách mua nhiều nhất (không sort danh sách gốc)
  HoaDon? khachMuaNhieuNhat() {
    if (dsHoaDon.isEmpty) return null;
    return dsHoaDon.reduce((a, b) => a.soLuong >= b.soLuong ? a : b);
  }

  // 4. Tổng chiết khấu cho khách hàng công ty
  double tongChietKhauCongTy() {
    return dsHoaDon.where((hd) => hd is CongTy)
        .fold(0, (sum, hd) => sum + hd.tinhChietKhau());
  }

  // 5. Sắp xếp theo yêu cầu
  void sapXep() {
    dsHoaDon.sort((a, b) {
      if (a.soLuong == b.soLuong) {
        return b.thanhTien().compareTo(a.thanhTien());
      }
      return a.soLuong.compareTo(b.soLuong);
    });
  }

  // 6. Tìm hóa đơn theo mã
  void timHoaDonTheoMa(String ma) {
    var ketQua = dsHoaDon.where((hd) => hd.maKH == ma).toList();
    if (ketQua.isEmpty) {
      print('Khách hàng lạ');
    } else {
      for (var hd in ketQua) {
        print('Hóa đơn của $ma: '
              '${hd.tenKH}, SL: ${hd.soLuong}, Thành tiền: ${hd.thanhTien()}');
      }
    }
  }
}