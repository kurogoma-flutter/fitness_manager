import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  static const routeName = 'tips';
  static const routePath = '/tips';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Tips1'),
            onTap: () {
              Navigator.of(context).pushNamed('tips1');
            },
          ),
          ListTile(
            title: const Text('Tips2'),
            onTap: () {
              Navigator.of(context).pushNamed('tips2');
            },
          ),
          ListTile(
            title: const Text('Tips3'),
            onTap: () {
              Navigator.of(context).pushNamed('tips3');
            },
          ),
        ],
      ),
    );
  }
}
