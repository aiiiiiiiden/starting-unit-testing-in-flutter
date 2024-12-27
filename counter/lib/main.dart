import 'package:counter/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late final Future<Counter> _counterFuture;

  @override
  void initState() {
    super.initState();
    _counterFuture = Counter.create();
  }

  void _incrementCounter() async {
    final counter = await _counterFuture;
    setState(counter.increment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Counter>(
          future: _counterFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                '${snapshot.data!.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
