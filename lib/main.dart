import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Dog(name: 'dog05', bread: 'breed05', age: 5),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyhomePage(),
      ),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final dog = Dog(name: 'dog05', bread: 'bread05');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 05'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
            Text(
              '- name: ${context.watch<Dog>().name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            BreandAndAge(
              dog: dog,
            )
          ])),
    );
  }
}

class BreandAndAge extends StatelessWidget {
  const BreandAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${context.select<Dog, String>((Dog dog) => dog.bread)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () => context.read<Dog>().grow(),
            child: const Text(
              'Grow',
              style: TextStyle(fontSize: 20.0),
            ))
      ],
    );
  }
}
