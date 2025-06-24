import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool _showImage = false;
  final List<bool> _taskStatus = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('1. Counter'),
            const SizedBox(height: 8),
            Text('Count: $_counter', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Increment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() => _counter++);
              },
            ),
            const Divider(height: 40, thickness: 1.5),

            sectionTitle('2. Show/Hide Image'),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text("Show Image"),
              value: _showImage,
              activeColor: Colors.deepPurple,
              onChanged: (val) {
                setState(() => _showImage = val);
              },
            ),
            const SizedBox(height: 8),
            if (_showImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1508780709619-79562169bc64',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const Divider(height: 40, thickness: 1.5),

            sectionTitle('3. Task List'),
            const SizedBox(height: 8),
            ...List.generate(_taskStatus.length, (index) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Task ${index + 1}: ${taskText(index)}'),
                value: _taskStatus[index],
                activeColor: Colors.deepPurple,
                onChanged: (val) {
                  setState(() => _taskStatus[index] = val!);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  String taskText(int index) {
    switch (index) {
      case 0:
        return 'Finish Flutter UI';
      case 1:
        return 'Submit assignment';
      case 2:
        return 'Call friend';
      default:
        return '';
    }
  }
}
