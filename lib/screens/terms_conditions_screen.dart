import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

/// Screen displaying the Terms & Conditions for the Lendr application,
/// optimized for Android devices including Google Pixel 7 (20:9 ratio, 90Hz, gesture insets).
class TermsConditionsScreen extends StatefulWidget {
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final bool showAcceptActions;

  const TermsConditionsScreen({
    super.key,
    this.onAccept,
    this.onDecline,
    this.showAcceptActions = true,
  });

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  bool _agreedToTerms = false;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _sections = const [
    {
      'icon': Icons.description_outlined,
      'title': '1. Acceptance of Terms',
      'content':
          'By accessing, browsing, or using the Lendr mobile application, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree to these terms, please do not use our services.',
    },
    {
      'icon': Icons.account_circle_outlined,
      'title': '2. User Accounts & Eligibility',
      'content':
          'You must be at least 18 years old to create an account on Lendr. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account. You agree to provide accurate, current, and complete registration information.',
    },
    {
      'icon': Icons.handshake_outlined,
      'title': '3. Lending & Borrowing Guidelines',
      'content':
          'Lendr acts as a platform connecting lenders and borrowers. All users agree to treat borrowed items with utmost care, return items on time in their original condition, and promptly report any damages or delays to the item owner and Lendr support.',
    },
    {
      'icon': Icons.payments_outlined,
      'title': '4. Payments, Fees & Security Deposits',
      'content':
          'Rental rates, deposits, and platform transaction fees are clearly displayed prior to booking confirmation. Security deposits are held during the rental duration and refunded upon safe and timely return of the item, subject to damage inspection.',
    },
    {
      'icon': Icons.block_outlined,
      'title': '5. Prohibited Items & Activities',
      'content':
          'Listing illegal items, hazardous materials, weapons, counterfeit goods, or unauthorized services is strictly prohibited. Lendr reserves the right to remove any listing or terminate accounts that violate this policy.',
    },
    {
      'icon': Icons.gavel_outlined,
      'title': '6. Liability & Dispute Resolution',
      'content':
          'While Lendr provides tools and verification to facilitate safe transactions, users interact at their own risk. In case of disputes, users must first attempt good-faith resolution through our built-in resolution center before seeking external remedies.',
    },
    {
      'icon': Icons.privacy_tip_outlined,
      'title': '7. Privacy & Data Protection',
      'content':
          'Your personal data is handled in accordance with our Privacy Policy. We implement standard security measures to protect your information and will never sell your personal data to third parties.',
    },
    {
      'icon': Icons.update_outlined,
      'title': '8. Modifications & Termination',
      'content':
          'We reserve the right to modify these terms at any time. Continued use of Lendr after updates constitutes acceptance of the modified terms. We may suspend or terminate your account for violations of these terms.',
    },
    {
      'icon': Icons.contact_support_outlined,
      'title': '9. Contact Us',
      'content':
          'If you have any questions or concerns regarding these Terms and Conditions, please reach out to our support team at support@lendr.app.',
    },
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pixel 7 has light theme with transparent status & navigation bar
    final SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: widget.showAcceptActions ? AppColors.cream : AppColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textPrimary,
                    size: 20,
                  ),
                  tooltip: 'Back',
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          title: const Text(
            AppStrings.termsAndConditionsTitle,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
        ),
        body: SafeArea(
          top: false, // AppBar already accounts for top padding
          bottom: true, // Accounts for Pixel 7 gesture navigation bar
          child: Column(
            children: [
              // Header Summary Card (Pixel 7 20:9 viewport optimized)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.verified_user_rounded,
                          color: AppColors.primaryDark,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Terms of Service',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Last updated: August 2026',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable Terms Content Card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.border, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Scrollbar(
                      controller: _scrollController,
                      interactive: true,
                      radius: const Radius.circular(8),
                      child: ListView.separated(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                        itemCount: _sections.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: AppColors.border,
                          height: 28,
                          thickness: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final section = _sections[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      section['icon'] as IconData,
                                      size: 18,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      section['title'] as String,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryDark,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  section['content'] as String,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    height: 1.55,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Action Footer with Pixel Gesture Bar Insets
              if (widget.showAcceptActions)
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                  decoration: const BoxDecoration(
                    color: AppColors.cream,
                    border: Border(
                      top: BorderSide(color: AppColors.border, width: 1),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Interactive Checkbox Row
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _agreedToTerms = !_agreedToTerms;
                            });
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _agreedToTerms,
                                    activeColor: AppColors.primary,
                                    checkColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.textSecondary,
                                      width: 1.6,
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _agreedToTerms = val ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'I have read and agree to the Terms & Conditions',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Action Buttons with Pixel 7 touch target sizing (>= 48dp height)
                      Row(
                        children: [
                          if (widget.onDecline != null || Navigator.canPop(context))
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 48,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (widget.onDecline != null) {
                                      widget.onDecline!();
                                    } else if (Navigator.canPop(context)) {
                                      Navigator.of(context).pop(false);
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.textSecondary,
                                    side: const BorderSide(color: AppColors.border, width: 1.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  child: const Text(
                                    'Decline',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.onDecline != null || Navigator.canPop(context))
                            const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _agreedToTerms
                                    ? () {
                                        if (widget.onAccept != null) {
                                          widget.onAccept!();
                                        } else if (Navigator.canPop(context)) {
                                          Navigator.of(context).pop(true);
                                        }
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  disabledBackgroundColor: AppColors.border.withValues(alpha: 0.7),
                                  foregroundColor: Colors.white,
                                  disabledForegroundColor: AppColors.textLight,
                                  elevation: _agreedToTerms ? 2 : 0,
                                  shadowColor: AppColors.primaryDark.withValues(alpha: 0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const Text(
                                  'Accept & Continue',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
