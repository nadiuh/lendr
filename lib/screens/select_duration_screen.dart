import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'borrow_details_screen.dart';

class SelectDurationScreen extends StatefulWidget {
  final String itemName;
  final String price;
  final String lender;

  const SelectDurationScreen({
    super.key,
    required this.itemName,
    required this.price,
    required this.lender,
  });

  @override
  State<SelectDurationScreen> createState() => _SelectDurationScreenState();
}

class _SelectDurationScreenState extends State<SelectDurationScreen> {
  int selectedDuration = 1;

  @override
  Widget build(BuildContext context) {
    int dailyPrice = int.parse(
      widget.price.replaceAll('৳', '').replaceAll('/day', ''),
    );

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
          'Select Duration',
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
              style: const TextStyle(color: AppColors.textSecondary),
            ),

            const SizedBox(height: 5),

            Text(
              widget.price,
              style: const TextStyle(color: AppColors.textSecondary),
            ),

            const SizedBox(height: 30),

            const Text(
              'How long do you need this item?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedDuration = 1;
                });
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedDuration == 1
                      ? AppColors.primary
                      : AppColors.cream,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Text(
                  '1 Day',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedDuration == 1
                        ? Colors.white
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedDuration = 3;
                });
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedDuration == 3
                      ? AppColors.primary
                      : AppColors.cream,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Text(
                  '3 Days',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedDuration == 3
                        ? Colors.white
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedDuration = 7;
                });
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedDuration == 7
                      ? AppColors.primary
                      : AppColors.cream,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Text(
                  '7 Days',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedDuration == 7
                        ? Colors.white
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Text(
              '৳$dailyPrice / day',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BorrowDetailsScreen(
                        itemName: widget.itemName,
                        lender: widget.lender,
                        price: widget.price,
                        selectedDuration: selectedDuration,
                        dailyPrice: dailyPrice,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}