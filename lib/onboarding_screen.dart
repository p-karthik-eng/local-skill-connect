import 'package:flutter/material.dart';
import 'language_selection_screen.dart';
import 'login_screen.dart'; // if needed for navigation

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboarding1.png",
      "text":
          "Find trusted professionals near you for any service from repairs to events.",
    },
    {
      "image": "assets/onboarding2.png",
      "text":
          "Choose your service, select a time, and get matched with available professionals in seconds.",
    },
    {
      "image": "assets/onboarding3.png",
      "text":
          "We verify all professionals so you get quality, safe, and dependable service every time.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]['image']!, height: 300),
                      const SizedBox(height: 30),
                      Text(
                        onboardingData[index]['text']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 8,
                width: currentPage == index ? 20 : 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                if (currentPage < onboardingData.length - 1) {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  // Navigate to home or login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
