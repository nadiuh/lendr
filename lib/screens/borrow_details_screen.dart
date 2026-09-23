import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BorrowDetailsScreen extends StatefulWidget {
  final int selectedDuration;
  final int dailyPrice;
  final String itemName;
  final String price;
  final String lender;

  const BorrowDetailsScreen({
    super.key,
    required this.selectedDuration,
    required this.dailyPrice,
    required this.itemName,
    required this.price,
    required this.lender,
  });

  @override
  State<BorrowDetailsScreen> createState() => _BorrowDetailsScreenState();
}

class _BorrowDetailsScreenState extends State<BorrowDetailsScreen> {
  String errorMessage = '';
  String message = '';

  void sendBorrowRequest() async {
    try {
      await FirebaseFirestore.instance.collection('borrow_requests').add({
        'itemName': widget.itemName,
        'lender': widget.lender,
        'price': widget.price,
        'duration': widget.selectedDuration,
        'dailyPrice': widget.dailyPrice,
        'totalPrice': widget.selectedDuration * widget.dailyPrice,
        'requestedAt': DateTime.now().toIso8601String(),
      });

      if (!mounted) return;
      setState(() {
        message = 'Borrow request sent successfully!';
        errorMessage = '';
      });
    } on FirebaseException catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.message ?? 'Could not send borrow request';
        message = '';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not send borrow request';
        message = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.selectedDuration * widget.dailyPrice;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Borrow Details',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

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

            const SizedBox(height: 5),

            Text(
              'Lender: ${widget.lender}',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Borrowing Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Item'),
                Text(widget.itemName),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Price'),
                Text(widget.price),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Duration'),
                Text('${widget.selectedDuration} day(s)'),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Daily Price'),
                Text('৳${widget.dailyPrice}'),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '৳$totalPrice',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Message',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            if (message.isNotEmpty)
              Text(
                message,
                style: const TextStyle(color: Colors.green),
              ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sendBorrowRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),
                child: const Text(
                  'Send Borrow Request',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}