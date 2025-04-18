import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Validator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Math Validator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkAnswer(String value) {
    setState(() {
      _isCorrect = value == '9';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isCorrect ? Colors.green : Colors.black,
                  width: 2.0,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 60,
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: _checkAnswer,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor:
                        _isCorrect ? Colors.green.withOpacity(0.3) : null,
                    filled: _isCorrect,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              '3*3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
