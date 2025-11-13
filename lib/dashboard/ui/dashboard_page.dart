import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web3 Bank'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Text(
              '1 Eth',
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
