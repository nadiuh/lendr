import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Save screen visit to Firebase Firestore
    FirebaseFirestore.instance.collection('screen_visits').add({
      'screen': 'notifications',
      'visitedAt': DateTime.now().toIso8601String(),
    });

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Notification card container
        Card(
          color: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.border.withValues(alpha: 0.6)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground,
                  border: Border(bottom: BorderSide(color: AppColors.border)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: AppColors.primaryDark),
                    SizedBox(width: 6),
                    Text(
                      '2 Unread Notifications',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // Today section
              _sectionTitle('TODAY'),
              _notificationTile(
                icon: Icons.handshake_rounded,
                title: 'Lending Request',
                message: 'Anika wants to borrow your Power Drill.',
                time: '2m ago',
                isUnread: true,
              ),
              _notificationTile(
                icon: Icons.chat_bubble_rounded,
                title: 'Message Received',
                message: 'Tasdiq sent a message regarding the Camping Tent.',
                time: '45m ago',
                isUnread: true,
              ),
              _notificationTile(
                icon: Icons.schedule_rounded,
                title: 'Return Reminder',
                message: 'Your Mountain Bike is due back tomorrow.',
                time: '3h ago',
              ),

              const Divider(height: 1, color: AppColors.border),

              // Yesterday section
              _sectionTitle('YESTERDAY'),
              _notificationTile(
                icon: Icons.task_alt_rounded,
                title: 'Lending Confirmed',
                message: 'Zami has accepted your request for the Lawn Mower.',
                time: '1d ago',
              ),
              _notificationTile(
                icon: Icons.info_outline_rounded,
                title: 'System Update',
                message: 'New community guidelines are now active.',
                time: '1d ago',
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),

        // Footer
        const SizedBox(height: 16),
        const Text(
          'Lendr Notifications • Real-time alerts',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: AppColors.textLight),
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.eco, size: 14, color: AppColors.primary),
            SizedBox(width: 4),
            Text(
              'Together saving resources through community sharing',
              style: TextStyle(fontSize: 11, color: AppColors.primaryDark),
            ),
          ],
        ),
      ],
    );
  }

  // Section title (TODAY, YESTERDAY)
  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  // Single notification tile
  static Widget _notificationTile({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    bool isUnread = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.inputBackground : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          CircleAvatar(
            radius: 20,
            backgroundColor: isUnread ? AppColors.primaryLight.withValues(alpha: 0.4) : AppColors.cream,
            child: Icon(icon, size: 20, color: isUnread ? AppColors.primaryDark : AppColors.textSecondary),
          ),
          const SizedBox(width: 12),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 11,
                            color: isUnread ? AppColors.primaryDark : AppColors.textLight,
                          ),
                        ),
                        if (isUnread) ...[
                          const SizedBox(width: 6),
                          const Icon(Icons.circle, size: 6, color: AppColors.primaryDark),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}