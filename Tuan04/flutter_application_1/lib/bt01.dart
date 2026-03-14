import 'package:flutter/material.dart';

class BaiTapStack extends StatefulWidget {
  const BaiTapStack({super.key});

  @override
  State<BaiTapStack> createState() => _BaiTapStackState();
}

class _BaiTapStackState extends State<BaiTapStack> {

  String _hienThi = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standard"),
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      ),
      drawer: Drawer(
        child: ListView(
          children:[
            const ListTile(title: Text("Calculator")),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: Text("Standard") ,
              onTap: () { 
                  print("Standard");
              },
            ),
            ListTile(
              leading: const Icon(Icons.science),
              title: Text("Scientific") ,
              onTap: () { 
              },
            ),

            ListTile(
              leading: const Icon(Icons.graphic_eq),
              title: Text("Graphing") ,
              onTap: () { 
              },
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: Text("Programmer") ,
              onTap: () { 
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text("Date calculation") ,
              onTap: () { 
              },
            ),
           const ListTile(title: Text("Converter")),
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: Text("Currency") ,
              onTap: () { 
              },
            ),   
            ListTile(
              leading: const Icon(Icons.volume_down),
              title: Text("Volume"),
              onTap: () { 
              },
            ),   
            ListTile(
              leading: const Icon(Icons.legend_toggle_sharp),
              title: Text("Length"),
              onTap: () { 
              },
            ),
            ListTile(
              leading: const Icon(Icons.legend_toggle_sharp),
              title: Text("Weight and mass"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.temple_hindu_sharp),
              title: Text("Temperature"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.energy_savings_leaf),
              title: Text("Energy"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.area_chart),
              title: Text("Area"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.run_circle),
              title: Text("Speed"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.timelapse),
              title: Text("Time"),
              onTap: () { 
              },
            ), 
            ListTile(
              leading: const Icon(Icons.power),
              title: Text("Power"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.data_array),
              title: Text("Data"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.precision_manufacturing_sharp),
              title: Text("Pressure"),
              onTap: () { 
              },
            ),  
            ListTile(
              leading: const Icon(Icons.panorama_wide_angle),
              title: Text("Angle"),
              onTap: () { 
              },
            ), 
          ],
        ),
      ),

      body: Column(
        children: [

          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            height: 120,
            color: const Color.fromARGB(255, 245, 245, 245),
            child: Text(
              _hienThi,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 245, 245, 245),
              padding: const EdgeInsets.all(4),

              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.25,
                children: [

                  calcButton("%"),
                  calcButton("CE"),
                  calcButton("C"),
                  calcButton("⌫"),

                  calcButton("1/x"),
                  calcButton("x²"),
                  calcButton("²√x"),
                  calcButton("÷"),

                  calcButton("7"),
                  calcButton("8"),
                  calcButton("9"),
                  calcButton("×"),

                  calcButton("4"),
                  calcButton("5"),
                  calcButton("6"),
                  calcButton("-"),

                  calcButton("1"),
                  calcButton("2"),
                  calcButton("3"),
                  calcButton("+"),

                  calcButton("+/-"),
                  calcButton("0"),
                  calcButton("."),
                  calcButton("="),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget calcButton(String text) {

    Color bgColor = Colors.white;
    Color textColor = Colors.black;

    if (text == "%" ||
        text == "CE" ||
        text == "C" ||
        text == "⌫" ||
        text == "1/x" ||
        text == "x²" ||
        text == "²√x" ||
        text == "÷" ||
        text == "×" ||
        text == "-" ||
        text == "+") {
      bgColor = const Color.fromARGB(255, 240, 240, 240);
    }

    if (text == "=") {
      bgColor = const Color.fromARGB(255, 0, 103, 192);
      textColor = Colors.white;
    }

    return Container(
      margin: const EdgeInsets.all(3),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),

        onPressed: () {
          setState(() {

            if (text == "C" || text == "CE") {
              _hienThi = "0";
            }

            else if (text == "⌫") {
              if (_hienThi.length > 1) {
                _hienThi = _hienThi.substring(0, _hienThi.length - 1);
              } else {
                _hienThi = "0";
              }
            }

            else if (text == "=" ||
                text == "+" ||
                text == "-" ||
                text == "×" ||
                text == "÷" ||
                text == "%" ||
                text == "1/x" ||
                text == "x²" ||
                text == "²√x" ||
                text == "+/-") {

              print("Bạn vừa bấm phép tính: $text");
            }

            else {

              if (_hienThi == "0") {
                _hienThi = text;
              } else {
                _hienThi = _hienThi + text;
              }

            }
          });
        },

        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}