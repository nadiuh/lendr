import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'select_duration_screen.dart';

class RequestItemScreen extends StatefulWidget {
  final String name;
  final String lender;
  final String price;
  final String distance;

  const RequestItemScreen({
    super.key,
    required this.name,
    required this.lender,
    required this.price,
    required this.distance,
  });

  @override
  State<RequestItemScreen> createState() => _RequestItemScreenState();
}

class _RequestItemScreenState extends State<RequestItemScreen> {
  String errorMessage = '';

  void confirmRequest() async {
    try {
      await FirebaseFirestore.instance.collection('borrow_requests').add({
        'itemName': widget.name,
        'lender': widget.lender,
        'price': widget.price,
        'distance': widget.distance,
        'requestedAt': DateTime.now().toIso8601String(),
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectDurationScreen(
            itemName: widget.name,
            price: widget.price,
            lender: widget.lender,
          ),
        ),
      );
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Could not confirm request';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Borrow Request',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item details card
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
                      widget.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 4),
                    Text(
                      widget.distance,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Divider(height: 24, color: AppColors.border),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (errorMessage.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(errorMessage, style: const TextStyle(color: Colors.red)),
            ],

            const SizedBox(height: 24),

            // Confirm button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: confirmRequest,
                child: const Text(
                  'Confirm Request',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
