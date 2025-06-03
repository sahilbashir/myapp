import 'package:flutter/material.dart';
import 'package:myapp/presentation/pages/car_list_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    final titleFontSize = isTablet ? 42.0 : screenSize.width * 0.08;
    final bodyFontSize = isTablet ? 20.0 : screenSize.width * 0.045;
    final buttonHeight = isTablet ? 64.0 : 50.0;

    return Scaffold(
      backgroundColor: const Color(0xff2C2B34),
      body: Column(
        children: [
          // Top image (2/3 of screen)
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding.png'), // ✅ update path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom content (1/3 of screen)
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.08,
                vertical: screenSize.height * 0.02,
              ),
              child: LayoutBuilder(
  builder: (context, constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible( // Use Flexible
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Premium Cars\nEnjoy the luxury',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Flexible( // Use Flexible
          child: Text(
            'Experience the thrill at a lower price.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: bodyFontSize,
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.08),
        SizedBox(
          width: double.infinity,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => CarListScreen()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Let\'s Go',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  },
),

            ),
          ),
        ],
      ),
    );
  }
}
