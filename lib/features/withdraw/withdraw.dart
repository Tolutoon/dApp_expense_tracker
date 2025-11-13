import 'package:flutter/material.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
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
              'Withdrawal Details',
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
                  color: const Color.fromARGB(255, 255, 152, 152)),
              child: Center(
                child: Text(
                  "- WITHDRAW",
                  style: TextStyle(
                      color: Colors.red,
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
