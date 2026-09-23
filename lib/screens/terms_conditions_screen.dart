import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'home_screen.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text('Terms & Conditions'),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      '1. Acceptance of Terms',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'By using Lendr, you agree to these Terms and our Privacy Policy.',
                    ),

                    SizedBox(height: 20),

                    Text(
                      '2. User Accounts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'You must provide accurate information when creating an account.',
                    ),

                    SizedBox(height: 20),

                    Text(
                      '3. Lending and Borrowing',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Treat borrowed items with care and return them on time.',
                    ),

                    SizedBox(height: 20),

                    Text(
                      '4. Payments and Deposits',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Fees and security deposits are shown before confirmation.',
                    ),

                    SizedBox(height: 20),

                    Text(
                      '5. Prohibited Items',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Illegal, hazardous, or counterfeit items are not allowed.',
                    ),

                    SizedBox(height: 20),

                    Text(
                      '6. Liability',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Users are responsible for the items they lend and borrow.',
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('I Agree'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
