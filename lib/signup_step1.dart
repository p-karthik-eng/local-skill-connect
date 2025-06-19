import 'package:flutter/material.dart';
import 'signup_step2.dart';

class SignupStep1 extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String gender = "Male";

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
              "Sign Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Gender: "),
                Radio(value: "Male", groupValue: gender, onChanged: (value) {}),
                Text("Male"),
                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {},
                ),
                Text("Female"),
              ],
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupStep2()),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 48),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
