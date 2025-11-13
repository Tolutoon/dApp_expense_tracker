import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Deposit Details',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter the Address'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter the Amount'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter the Reason'),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 170, 255, 214)),
              child: Center(
                child: Text(
                  "+ DEPOSIT",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
