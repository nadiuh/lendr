import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'borrow_details_screen.dart';

class SelectDurationScreen extends StatefulWidget {
  const SelectDurationScreen({super.key});

  @override
  State<SelectDurationScreen> createState() => _SelectDurationScreenState();
}

class _SelectDurationScreenState extends State<SelectDurationScreen> {

  int selectedDuration = 1;

  @override
  Widget build(BuildContext context) {
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
          "Select Duration",
          style: TextStyle(
            color: AppColors.textPrimary,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "How long do you need this item?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Choose the number of days you want to borrow it.",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Select Duration",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDuration = 1;
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedDuration == 1
                        ? AppColors.primary
                        : AppColors.cream,
                  ),

                  child: Text(
                    "1 Day",
                    style: TextStyle(
                      color: selectedDuration == 1
                          ? Colors.white
                          : AppColors.textPrimary,
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDuration = 3;
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedDuration == 3
                        ? AppColors.primary
                        : AppColors.cream,
                  ),

                  child: Text(
                    "3 Days",
                    style: TextStyle(
                      color: selectedDuration == 3
                          ? Colors.white
                          : AppColors.textPrimary,
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDuration = 7;
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedDuration == 7
                        ? AppColors.primary
                        : AppColors.cream,
                  ),

                  child: Text(
                    "7 Days",
                    style: TextStyle(
                      color: selectedDuration == 7
                          ? Colors.white
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Selected Duration",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "$selectedDuration day(s)",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "৳550 per day",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BorrowDetailsScreen(
                        selectedDuration: selectedDuration,
                        dailyPrice: 550,
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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