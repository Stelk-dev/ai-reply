import 'package:flutter/material.dart';
import 'package:replies/onboarding/price_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final List<Map> _pages = [
    {
      "img": "assets/onboarding_1.png",
      "title": "Your Personal Assistent",
      "desc":
          "Train your AI to reflect your style for personalised responses across all your favorite messaging apps!",
    },
    {
      "img": "assets/onboarding_2.png",
      "title": "Choose Numbers and Apps to Reply on",
      "desc":
          "You can select to use AI assistent only on specific applications or only on specific phone numbers. Or all of them!",
    },
    {
      "img": "assets/onboarding_3.png",
      "title": "Add Delays for Realistic Response Timing",
      "desc":
          "You can select an instant reply or a specific/randomically delay for the reply",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => _onboardingPage(
          image: _pages[i]["img"],
          title: _pages[i]["title"],
          description: _pages[i]["desc"],
          onTap: () {
            if (i == (_pages.length - 1)) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => PricePage(),
                ),
              );
              return;
            }

            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        itemCount: _pages.length,
      ),
    );
  }

  Widget _onboardingPage({
    required String image,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .5,
            margin: EdgeInsets.symmetric(vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromRGBO(240, 240, 240, 1),
                width: 16,
              ),
              image: DecorationImage(image: AssetImage(image)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 24),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PricePage(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(20),
                      onPressed: onTap,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
