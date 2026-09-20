import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'select_duration_screen.dart';

class ItemScreen extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String price;
  final String lender;

  const ItemScreen({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.price,
    required this.lender,
  });

  String getItemDescription() {
    if (itemName == 'Camera') {
      return 'High-quality camera, perfect for photography, college events and special occasions.';
    } else if (itemName == 'Drill Machine') {
      return 'Useful drill machine, perfect for home repairs, DIY projects and construction work.';
    } else if (itemName == 'Pressure Washer') {
      return 'Powerful pressure washer, perfect for cleaning cars, floors and outdoor areas.';
    } else if (itemName == 'Tent') {
      return 'Comfortable tent, perfect for camping, outdoor trips and special occasions.';
    } else {
      return 'High-quality $itemName, perfect for personal use, events and special occasions.';
    }
  }

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
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemName,
                      style: const TextStyle(
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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lender,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Text(
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

                Text(
                  getItemDescription(),
                  style: const TextStyle(
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
                    Text(
                      price,
                      style: const TextStyle(
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
                            builder: (context) => SelectDurationScreen(
                              itemName: itemName,
                              price: price,
                              lender: lender,
                            ),
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