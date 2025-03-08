import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:shoes_app/core/app_constants.dart';
import 'package:shoes_app/features/bottom_app_bar/bottom_app_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  List<Map<String, dynamic>> onboardingList = [
    {
      "image": AppConstants.onboardingImage1,
      "title": "Follow Latest Style Shoes to Follow the Trend",
      "description":
          "Step into a world of style with our revolutionary fashion app - your ultimate destination for trendsetting looks and curated collections."
    },
    {
      "image": AppConstants.onboardingImage2,
      "title": "Discover Exclusive Shoe Collections",
      "description":
          "Unveil a curated selection of exclusive shoes designed to elevate your wardrobe with unmatched elegance and comfort."
    },
    {
      "image": AppConstants.onboardingImage3,
      "title": "Stay Ahead with Fashion Updates",
      "description":
          "Get the latest fashion insights and shoe trends delivered to you, ensuring you’re always one step ahead in style."
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Create fade animation from 0 to 1
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Start the animation initially
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  // Function to trigger fade animation on index change
  void _changeIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
      // Reset and replay the animation
      _fadeController.reset();
      _fadeController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            height: height * 0.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      onboardingList[selectedIndex]["image"],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Image.asset(
                      AppConstants.appLogo,
                      color: selectedIndex == 2 ? Colors.white : null,
                      height: 60,
                      width: 120,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffFEE78E),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      onboardingList[selectedIndex]["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.notable().fontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      onboardingList[selectedIndex]["description"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 125,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                selectedIndex == 0
                    ? Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (selectedIndex > 0 && selectedIndex < 3) {
                            _changeIndex(selectedIndex - 1);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(
                              IconlyLight.arrow_left,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                const Spacer(),
                Image.asset(
                  AppConstants.appLogo,
                  color: Colors.grey.shade300,
                  height: 60,
                  width: 120,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (selectedIndex < onboardingList.length - 1) {
                      _changeIndex(selectedIndex + 1);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomBottomAppBar(
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        IconlyLight.arrow_right,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
