import 'package:flutter/material.dart';
import 'package:replies/onboarding/pages/onboarding_page.dart';
import 'package:replies/styles/widget/buttons.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            Spacer(),

            // Logo
            Image.asset("assets/chats.png"),
            Spacer(),

            // Title
            Text(
              "Send messages when you can't",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 44,
              ),
            ),
            SizedBox(height: 32),

            // Continue
            CustomButtons.primaryButton(
              title: "Get Started",
              icon: Icons.arrow_forward_ios,
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => OnBoardingPage(),
                ),
              ),
            ),
            SizedBox(height: 16),

            // TOS
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "By continuing, you accept our ",
                  ),
                  TextSpan(
                    text: "Terms of Service ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: "and acknowledge receipt of our",
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
