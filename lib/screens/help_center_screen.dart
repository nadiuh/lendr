import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  final List<Map<String, String>> _faqs = const [
    {
      'question': 'How do I lend an item?',
      'answer':
          'To lend an item, tap the floating "+" button on the Home screen. Provide your item details, upload clear photos, set your rental price and deposit amount, and publish your listing.',
    },
    {
      'question': 'How do I borrow an item?',
      'answer':
          'Browse available items on the Home screen or use the search bar. Tap on any item to view its details and availability, choose your rental duration, and submit a borrow request to the lender.',
    },
    {
      'question': 'How do I add an item?',
      'answer':
          'Navigate to the Home screen and tap the "+" action button. Fill in the item name, category, pricing, and description, then confirm to list it in the community catalog.',
    },
    {
      'question': 'How do I manage my profile?',
      'answer':
          'Go to the Profile tab from the bottom navigation bar. From there, you can view your personal details, monitor active listings, see your lending/borrowing statistics, and update settings.',
    },
    {
      'question': 'How do I contact another user?',
      'answer':
          'When you view an item listing or have an active borrow request, you can communicate directly with the owner through the in-app messaging feature.',
    },
    {
      'question': 'What happens if an item is damaged?',
      'answer':
          'Lendr includes security deposit protection. If an item is damaged or returned late, report it immediately through Contact Support to initiate our dispute resolution process.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          'Help Center',
          style: GoogleFonts.poppins(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryDark.withValues(alpha: 0.25),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.support_agent_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'How can we help you?',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Find answers to frequently asked questions',
                                style: GoogleFonts.poppins(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Frequently Asked Questions',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),

              const SizedBox(height: 12),

              // FAQ List
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _faqs.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.border,
                      height: 1,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = _faqs[index];
                      return Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          iconColor: AppColors.primary,
                          collapsedIconColor: AppColors.textSecondary,
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 4.0,
                          ),
                          childrenPadding: const EdgeInsets.only(
                            left: 18.0,
                            right: 18.0,
                            bottom: 16.0,
                          ),
                          title: Text(
                            item['question']!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          children: [
                            Text(
                              item['answer']!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
