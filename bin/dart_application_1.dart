import 'dart:ffi';

import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;
import 'dart:io';

void main() {
  int chon;

  do {
    dart_application_1.menu();
    chon = int.parse(stdin.readLineSync()!);

    switch (chon) {

      case 1:
        print("Nhap so que kem:");
        int n = int.parse(stdin.readLineSync()!);

        print("Nhap gia 1 que kem:");
        double gia = double.parse(stdin.readLineSync()!);

        double giam = dart_application_1.cau1(n);
        double tongTien = n * gia * (1 - giam);

        print("So tien phai tra: $tongTien");
        break;

      case 2:
        print("Nhap so nguyen duong > 10:");
        int n = int.parse(stdin.readLineSync()!);

        print("So chu so: ${dart_application_1.cau2(n)}");
        print("Tong cac chu so: ${dart_application_1.cau2b(n)}");
        print(dart_application_1.cau2c(n)
            ? "So co chua chu so le"
            : "So khong chua chu so le");
        break;

      case 3:
        print("Nhap so phan tu:");
        int n = int.parse(stdin.readLineSync()!);

        List<int> ds = [];
        for (int i = 0; i < n; i++) {
          print("Nhap phan tu thu ${i + 1}:");
          ds.add(int.parse(stdin.readLineSync()!));
        }

        print("Danh sach vua nhap:");
        print(ds);

        print("Tong cac phan tu: ${dart_application_1.cau3b(ds, n)}");

        print("Cac so nguyen to:");
        dart_application_1.cau3c(ds, n);

        print("Nhap gia tri x:");
        int x = int.parse(stdin.readLineSync()!);
        dart_application_1.cau3d(ds, n, x);
        print(ds);
        break;

      case 4:
        print("Nhap so phan tu:");
        int n = int.parse(stdin.readLineSync()!);

        List<int> ds = [];
        int m;

        for(int i = 0 ; i < n ; i++){
        do{
          print("Nhap vao danh sach phan tu ${i+1}");
          m = int.parse(stdin.readLineSync()!);
          }while(m <= 5 || m >= 100);
          ds.add(m);
        }

        print("Nhap vao danh sach :");
        print(ds);

        dart_application_1.cau1bbt(ds, n);
        dart_application_1.cau1cbt(ds, n);
        dart_application_1.cau1dbt(ds, n);

        print("Gia tri lon nhat: ${dart_application_1.cau1ebt(ds, n)}");
        print("So chan lon nhat: ${dart_application_1.cau1fbt(ds, n)}");

        print("Nhap x:");
        int x = int.parse(stdin.readLineSync()!);
        dart_application_1.cau1gbt(ds, n, x);
        print(ds);
        break;

      case 5:
        print("Nhap chuoi:");
        String s = stdin.readLineSync()!;

        print("Chuoi vua nhap: $s");
        dart_application_1.cau2bbt(s);
        dart_application_1.cau2cbt(s);
        dart_application_1.cau2dbt(s);
        dart_application_1.cau2ebt(s);
        break;

      case 0:
        print("Thoat chuong trinh!");
        break;

      default:
        print("Lua chon khong hop le!");
    }
  } while (chon != 0);
}
