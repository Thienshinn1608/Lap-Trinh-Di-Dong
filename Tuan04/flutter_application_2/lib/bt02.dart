import 'package:flutter/material.dart';

class BaiTapStack extends StatelessWidget {
  const BaiTapStack({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage('assets/1.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 180,
              child: const Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "Trường Đại học Công Thương Thành phố Hồ Chí Minh",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "là một là một cơ sở giáo dục đại học công lập trực thuộc Bộ Công Thương.",
                      maxLines: 4,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyButtonNavigationBar extends StatefulWidget {
  const MyButtonNavigationBar({super.key});
  @override
  State<MyButtonNavigationBar> createState() => _MyButtonNavigationBarState();
}

class _MyButtonNavigationBarState extends State<MyButtonNavigationBar> {
  int _selectedIndex = 0;
  
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  
  // Thay thế Text('Cơ sở vật chất') bằng Widget BaiTapStack()
  static const List<Widget> _widgetOptions = <Widget>[
    BaiTapStack(), // <--- Hiển thị BaiTapStack ở tab số 0
    Text('Giới Thiệu', style: optionStyle),
    Text('Liên Hệ', style: optionStyle),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar chung của toàn bộ ứng dụng
      appBar: AppBar(title: const Text("Demo"), backgroundColor: Colors.cyan),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Cơ sở vật chất',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Giới Thiệu',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Liên Hệ',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}