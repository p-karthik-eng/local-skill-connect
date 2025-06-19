import 'package:flutter/material.dart';
import 'login_screen.dart';

class OTPVerificationScreen extends StatelessWidget {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Text(
              "Local Skill Connect",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("We sent the OTP to your mobile number xxxxxx4321."),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  otpControllers.map((controller) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        controller: controller,
                        maxLength: 1,
                        decoration: InputDecoration(counterText: ""),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        content: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            SizedBox(width: 10),
                            Text("OTP Verified Successfully."),
                          ],
                        ),
                      ),
                );
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
                  );
                });
              },
              child: Text('Verify'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 48),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "OTP will expire in 10 sec.\nIs OTP expired? Resend OTP",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
