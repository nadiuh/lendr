import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'home_screen.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  bool _agreed = false;

  final List<Map<String, String>> _terms = const [
    {
      'title': '1. Acceptance of Terms',
      'body': 'By using Lendr, you agree to these Terms and our Privacy Policy.',
    },
    {
      'title': '2. User Accounts',
      'body': 'You must be at least 18 years old and provide accurate information.',
    },
    {
      'title': '3. Lending & Borrowing',
      'body': 'Treat borrowed items with care and return them on time in original condition.',
    },
    {
      'title': '4. Payments & Deposits',
      'body': 'All fees and security deposits are shown before confirmation.',
    },
    {
      'title': '5. Prohibited Items',
      'body': 'Illegal, hazardous, or counterfeit items are strictly prohibited.',
    },
    {
      'title': '6. Liability',
      'body': 'Users borrow and lend at their own risk. Use our dispute center if issues arise.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Scrollable Terms List
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: ListView.separated(
                    itemCount: _terms.length,
                    separatorBuilder: (_, __) => const Divider(color: AppColors.border, height: 24),
                    itemBuilder: (context, index) {
                      final item = _terms[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['body']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Agreement Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _agreed,
                    activeColor: AppColors.primary,
                    onChanged: (val) => setState(() => _agreed = val ?? false),
                  ),
                  const Expanded(
                    child: Text(
                      'I have read and agree to the Terms & Conditions',
                      style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Accept Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _agreed
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.border,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Accept & Continue',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
