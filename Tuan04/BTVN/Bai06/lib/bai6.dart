import 'package:flutter/material.dart';

void main() {
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  NeuBox(child: Icon(Icons.arrow_back)),
                  Text('P L A Y L I S T', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
                  NeuBox(child: Icon(Icons.menu)),
                ],
              ),
              const SizedBox(height: 25),

              NeuBox(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/image/123.jpg",
                        width: 150,
                        height: 200,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kota The Friend', style: TextStyle(color: Colors.grey.shade700, fontSize: 18)),
                              const Text('Birdie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                            ],
                          ),
                          const Icon(Icons.favorite, color: Colors.red, size: 32),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('0:00'),
                    Icon(Icons.shuffle),
                    Icon(Icons.repeat),
                    Text('4:22'),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              NeuBox(
                child: LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.transparent,
                  color: Colors.green.shade400,
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 40),

              Row(
                children: const [
                  Expanded(child: NeuBox(child: Icon(Icons.skip_previous, size: 32))),
                  SizedBox(width: 20),
                  Expanded(flex: 2, child: NeuBox(child: Icon(Icons.play_arrow, size: 32))),
                  SizedBox(width: 20),
                  Expanded(child: NeuBox(child: Icon(Icons.skip_next, size: 32))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}