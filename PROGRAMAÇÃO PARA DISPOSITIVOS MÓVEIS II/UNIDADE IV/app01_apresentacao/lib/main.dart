import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  return runApp(const MaterialApp(title: 'Apresentação', home: MyHome()));
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apresentação',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00903A),
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[300],
        child: const Column(children: [Text('Menu 1'), Text('Menu 2')]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(180), // Image radius
              child: Image.asset(
                'assets/images/profile.jpg',
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_2_rounded),
              Text(' Lucas Rêgo Araújo')
            ],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.work), Text(' Software Enginneer')],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.badge), Text(' Capgemini S.A.')],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.cake), Text(' 25')],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu 3'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu 3')
      ]),
    );
  }
}
