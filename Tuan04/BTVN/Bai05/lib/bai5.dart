import 'package:flutter/material.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans-serif'),
      home: const MedicalHomeScreen(),
    );
  }
}

class MedicalHomeScreen extends StatelessWidget {
  const MedicalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Hello,", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Mitch Koko", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Container(height: 100, width: 100, decoration: BoxDecoration(color: Colors.deepPurple[200], borderRadius: BorderRadius.circular(15))),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("How do you feel?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const Text("Fill out your medical card right now", style: TextStyle(fontSize: 14)),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[400], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                            child: const Text("Get Started", style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "How can we help you?",
                  filled: true,
                  fillColor: Colors.deepPurple[50],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 25),

              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryItem(Icons.medical_services_outlined, "Dentist"),
                    _categoryItem(Icons.person_outline, "Surgeon"),
                    _categoryItem(Icons.local_pharmacy_outlined, "Pharmacy"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Doctor list", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  _doctorCard("Dr. Mitch Koko", "Psychologist 7 y.e.", "4.4"),
                  const SizedBox(width: 15),
                  _doctorCard("Dr. Steve Jobs", "Surgeon 7 y.e.", "5.0"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.deepPurple[50], borderRadius: BorderRadius.circular(12)),
      child: Row(children: [Icon(icon, color: Colors.deepPurple), const SizedBox(width: 8), Text(title)]),
    );
  }

  Widget _doctorCard(String name, String job, String rating) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.deepPurple[50], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.pink[200]), 
            const SizedBox(height: 10),
            Row(children: [Icon(Icons.star, color: Colors.yellow[700], size: 16), Text(rating, style: const TextStyle(fontWeight: FontWeight.bold))]),
            const SizedBox(height: 5),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
            Text(job, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}