import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Apresentação'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final String title;
 const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'Lucas Rêgo Araújo',style: TextStyle(color: Color.fromARGB(255, 171, 81, 169), fontSize: 18.0) ),
            Text('29 anos de idade', style: TextStyle(color: Color.fromARGB(255, 171, 81, 169), fontSize: 18.0)),
            Text('Engenheiro de Software', style: TextStyle(color: Color.fromARGB(255, 171, 81, 169), fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}