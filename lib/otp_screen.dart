import 'package:flutter/material.dart';
import 'home_screen.dart';

class OTPScreen extends StatelessWidget {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Local Skill Connect",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("We sent the OTP to your mobile number xxxxxx4321."),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  otpControllers.map((controller) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text("Verify"),
            ),
            const SizedBox(height: 10),
            Text("OTP will expire in 10 sec."),
            Text.rich(
              TextSpan(
                text: "Is OTP expired? ",
                children: [
                  TextSpan(
                    text: "Resend OTP",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
