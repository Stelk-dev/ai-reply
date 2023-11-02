import 'package:flutter/material.dart';
import 'package:replies/styles/widget/buttons.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 64,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Start using your personal AI assistant anywhere and anytime",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 24),
            // Continue
            CustomButtons.primaryButton(
              title: "Continue",
              onPressed: () {},
            ),
            SizedBox(height: 8),
            // Continue
            CustomButtons.primaryButton(
              title: "Start 7 days free trial",
              onPressed: () {},
            ),
            SizedBox(height: 8),
            Text(
              "Renews automatically. Cancel anytime",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
