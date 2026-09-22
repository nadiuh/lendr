import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 30,
                    ),

                    SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How can we help you?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Find answers to common questions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                '1. How do I lend an item?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Tap the "+" button on the Home screen. Add your item details, photos, rental price and deposit, then publish your listing.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),

              const Text(
                '2. How do I borrow an item?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Browse the available items on the Home screen. Select an item, check its details and submit a borrow request.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),

              const Text(
                '3. How do I add an item?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Tap the "+" button and enter the item name, category, price and description to create a listing.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),

              const Text(
                '4. How do I manage my profile?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Go to the Profile section to view your information, listings and account settings.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),

              const Text(
                '5. How do I contact another user?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'You can communicate with the item owner through the available contact or messaging feature.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),

              const Text(
                '6. What happens if an item is damaged?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Report the damaged item through Contact Us so that the issue can be reviewed.',
                style: TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
