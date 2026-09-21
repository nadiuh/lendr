import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BorrowDetailsScreen extends StatefulWidget {
  final String itemName;
  final String lender;
  final String price;
  final String duration;
  final String dates;
  final String image;

  const BorrowDetailsScreen({
    super.key,
    this.itemName = 'Sony Alpha DSLR Camera',
    this.lender = 'Taseen Ehfaz',
    this.price = '৳7000',
    this.duration = '3 Days',
    this.dates = 'Oct 20, 2026 - Oct 23, 2026',
    this.image = 'assets/images/camera.png',
  });

  @override
  State<BorrowDetailsScreen> createState() => _BorrowDetailsScreenState();
}

class _BorrowDetailsScreenState extends State<BorrowDetailsScreen> {
  bool _isSubmitting = false;

  Future<void> _confirmBorrow() async {
    setState(() {
      _isSubmitting = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      final userEmail = user?.email ?? 'user@lendr.com';

      // 1. Add record to borrow_history collection in Firebase Firestore
      await FirebaseFirestore.instance.collection('borrow_history').add({
        'itemName': widget.itemName,
        'lender': widget.lender,
        'price': widget.price,
        'duration': widget.duration,
        'dates': widget.dates,
        'image': widget.image,
        'borrowerEmail': userEmail,
        'status': 'Confirmed',
        'createdAt': DateTime.now().toIso8601String(),
      });

      // 2. Add notification to notifications collection in Firebase Firestore
      await FirebaseFirestore.instance.collection('notifications').add({
        'title': 'Borrow Confirmed',
        'message': 'You successfully borrowed ${widget.itemName} from ${widget.lender}.',
        'time': 'Just now',
        'isUnread': true,
        'createdAt': DateTime.now().toIso8601String(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Borrow request confirmed and saved to Firebase!'),
          backgroundColor: AppColors.primary,
        ),
      );

      // Navigate back
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Firebase error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Borrow Details',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Card summary
            Card(
              color: const Color(0xFFFFF8E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lender: ${widget.lender}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Divider(height: 24),
                    _detailRow('Rental Duration', widget.duration),
                    const SizedBox(height: 8),
                    _detailRow('Dates', widget.dates),
                    const SizedBox(height: 8),
                    _detailRow('Total Price', widget.price, isBold: true),
                    const SizedBox(height: 8),
                    _detailRow(
                      'Borrower Account',
                      user?.email ?? 'guest@lendr.com',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Safety Notice
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.shield_outlined, color: AppColors.primary),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Your transaction is protected under the Lendr Community Agreement.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _isSubmitting ? null : _confirmBorrow,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Confirm & Save to Firebase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: isBold ? AppColors.primaryDark : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
