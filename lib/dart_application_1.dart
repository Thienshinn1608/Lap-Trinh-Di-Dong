import 'dart:math';

double cau1(int n) {
  if(n > 10){
    return 0.1;
  }else if(n >= 5 && n <=10){
    return 0.05;
  }else{
    return 0;
  }
}

int cau2(int n){
  int dem = 0;
  while(n > 0){
    dem++;
    n = n ~/ 10;
  }
  return dem;
}

int cau2b(int n){
  int Tong = 0;
  while(n > 0){
    int temp = n % 10;
    Tong += temp;
    n = n ~/ 10;
  }
  return Tong;
}

bool cau2c(int n){
  while(n > 0){
    int temp = n % 10;
    if(temp % 2 == 1){
      return true;
    }
    n = n ~/ 10;
  }
  return false;
}

int cau3b(List<int> ds , int n){
  int tong = 0;
  for(int i = 0 ; i < n ; i++){
    tong += ds[i];
  }
  return tong;
}

int snt(int n){
  if(n <= 1) return 0;
  for(int i = 2 ; i <= sqrt(n) ; i++){
    if(n % i == 0) return 0;
  }
  return 1;
} 

void cau3c(List<int> ds , int n){
  for(int i = 0 ; i < n ; i++){
    if(snt(ds[i]) == 1){
      print("Cac so nguyen to la ${ds[i]}");
    }
  }
}

void cau3d(List<int> ds , int n , int x){
  for(int i = 0 ; i < n ; i++){
    if(ds[i] == x){
      print("vi tri cua gia tri x co san la ${i}");
    }else{
      ds.add(x);
      print("vi tri cua gia tri da duoc gan la ${i}");
      break;
    }
  }
}


//bai tap ve nha
void cau1bbt(List<int> ds , int n){
  int tong = 0;
  int dem = 0;
  for(int i = 0 ; i < n; i++){
    if(ds[i] % 2 == 1){
      tong += ds[i];
      dem++;
    }
  }
  if(dem == 0){
    print("Khong co so le trong danh sach");
  }else{
    double tbc = tong / dem;
    print("Tong cac so le = ${tbc}");
  }
}

void cau1cbt(List<int> ds , int n){
  int check = 1;
  for(int i = 0 ; i < n / 2; i++){
    if(ds[i] != ds[n-1-i]){
      check = 0;
      break;
    }
  }

  if(check == 1){
    print("Danh sach nay doi xung");
  }else{
    print("Danh sach nay khong doi xung");
  }
}

void cau1dbt(List<int> ds , int n){
  int check = 1;
  for(int i = 0 ; i < n - 1; i++){
    if(ds[i] > ds[i+1]){
      check = 0;
      break;
    }
  }

  if(check == 1){
    print("Danh sach nay tang dan");
  }else{
    print("Danh sach nay khong tang dan");
  }
}

int cau1ebt(List<int> ds , int n){
  int max = -10^9;
  for(int i = 0 ; i < n; i++){
    if(ds[i] > max){
      max = ds[i];
    }
  }
  return max;
}

int cau1fbt(List<int> ds , int n){
  int max = -10^9;
  for(int i = 0 ; i < n; i++){
    if(ds[i] > max && ds[i] % 2 == 0){
      max = ds[i];
    }
  }
  return max;
}

void cau1gbt(List<int> ds , int n , int x){
  for(int i = 0 ; i < n; i++){
    if(ds[i] == x){
      ds.removeAt(i);
      return;
    }
  }
  print("Khong tim thay gia tri x trong danh sach");
}

void cau2bbt(String s) {
  int dem = 0;
  String nguyenAm = "aeiouAEIOU";

  for (int i = 0; i < s.length; i++) {
    if (nguyenAm.contains(s[i])) {
      dem++;
    }
  }
  print("So ky tu la nguyen am: $dem");
}

void cau2cbt(String s){
  int dem = 0;
  for(int i = 0 ; i < s.length ; i++){
    if(s[i] == " "){
         dem++; 
    }
  }
  print("Tong so tu trong chuoi ${dem+1}");
}

void cau2dbt(String s){
  int check = 1;
  for(int i = 0 ; i < s.length ~/ 2; i++){
    if(s[i] != s[s.length-1-i]){
         check = 0;
         break; 
    }
  }
  if(check == 1){
    print("Chuoi doi xung");
  }else{
    print("Chuoi khong doi xung");
  }
}

void cau2ebt(String s) {
  List<String> a = s.split(' ');

  int l = 0;
  int r = a.length - 1;

  while(l < r){
    String temp = a[l];
   a[l] = a[r];
    a[r] = temp;
    l++;
    r--;
  }
  print(a.join(' '));
}

void menu() {
  print("\n========= MENU =========");
  print("1. Bai tap 1 (Que kem)");
  print("2. Bai tap 2 (So nguyen > 10)");
  print("3. Bai tap 3 (Danh sach so nguyen)");
  print("4. Bai tap ve nha - Bai 1 (Danh sach so nguyen)");
  print("5. Bai tap ve nha - Bai 2 (Chuoi)");
  print("0. Thoat");
  print("========================");
}



