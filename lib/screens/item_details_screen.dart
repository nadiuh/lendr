import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'select_duration_screen.dart';


class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

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
          )
      ),

      body: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),

            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(15),
            ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/Product_images/DSLR.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          ),

          const SizedBox(height: 15),

          // Main information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      "Canon DSLR Camera",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: AppColors.primary,
                    ),

                    SizedBox(width: 5),

                    Text(
                      "4.8",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 55),

                Row(
                  children: [

                    const CircleAvatar(
                      radius: 22,
                      child: Icon(Icons.person),
                    ),

                    const SizedBox(width: 5),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shawon Haque",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        Text(
                          "Dhaka, Bangladesh",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                const Text(
                  "About this item",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "High-quality DSLR camera. Perfect for photography, "
                      "college events and special occasions.",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary,
                        ),

                        SizedBox(height: 0),

                        Text(
                          "Dhaka",
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),

                    Column(
                      children: const [
                        Icon(
                          Icons.verified_outlined,
                          color: AppColors.primary,
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Verified",
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 100),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      "৳550 / day",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectDurationScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),

                      child: const Text(
                        "Select Duration",
                        style: TextStyle(
                          color: Colors.white,
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
    );
  }
}