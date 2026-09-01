import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';

class UserProfile {
  final String displayName;
  final String username;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String location;
  final String dateJoined;
  final String avatarAsset;
  final int itemsLent;
  final int itemsBorrowed;
  final int activeListings;

  const UserProfile({
    required this.displayName,
    required this.username,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.location,
    required this.dateJoined,
    required this.avatarAsset,
    required this.itemsLent,
    required this.itemsBorrowed,
    required this.activeListings,
  });

  factory UserProfile.placeholder() {
    return const UserProfile(
      displayName: 'User Name',
      username: '@username',
      email: 'user@gmail.com',
      fullName: 'User Name',
      phoneNumber: '+880 12 3456 7890',
      location: 'Dhaka, Bangladesh',
      dateJoined: 'August 2026',
      avatarAsset: 'assets/images/Profile_screen/pfp_icon.png',
      itemsLent: 0,
      itemsBorrowed: 0,
      activeListings: 0,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final UserProfile? userProfile;

  const ProfileScreen({
    super.key,
    this.userProfile,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfile _profile;
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _profile = widget.userProfile ?? UserProfile.placeholder();
  }

  void _showActionFeedback(String actionName) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$actionName selected',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
        ),
        backgroundColor: AppColors.primaryDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.cream,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Log Out',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              fontSize: 18,
            ),
          ),
          content: Text(
            'Are you sure you want to log out of your Lendr account?',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Logging out',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                    ),
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: Text(
                'Log Out',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 20),

              _buildActivitySection(),
              const SizedBox(height: 20),

              _buildSectionTitle('Profile Information'),
              const SizedBox(height: 8),
              _buildProfileInfoCard(),
              const SizedBox(height: 20),

              _buildSectionTitle('Account Settings'),
              const SizedBox(height: 8),
              _buildAccountSection(),
              const SizedBox(height: 20),

              _buildSectionTitle('Support & Legal'),
              const SizedBox(height: 8),
              _buildSupportSection(),
              const SizedBox(height: 28),

              _buildLogoutButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cream,
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryDark.withValues(alpha: 0.15),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      _profile.avatarAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.cream,
                          child: const Icon(
                            Icons.person_rounded,
                            size: 56,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: InkWell(
                    onTap: () => _showActionFeedback('Change Profile Picture'),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          Text(
            _profile.displayName,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 3),

          Text(
            _profile.username,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 3),

          Text(
            _profile.email,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            count: _profile.itemsLent.toString(),
            label: 'Items Lent',
            icon: Icons.upload_rounded,
            badgeColor: const Color(0xFFE8F2E6),
            iconColor: AppColors.primary,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            count: _profile.itemsBorrowed.toString(),
            label: 'Items Borrowed',
            icon: Icons.download_rounded,
            badgeColor: const Color(0xFFF6EFE6),
            iconColor: const Color(0xFFC08A4E),
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            count: _profile.activeListings.toString(),
            label: 'Active Listings',
            icon: Icons.storefront_rounded,
            badgeColor: const Color(0xFFEAF0F6),
            iconColor: const Color(0xFF5A8AA8),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 42,
      width: 1,
      color: AppColors.border.withValues(alpha: 0.6),
    );
  }

  Widget _buildStatItem({
    required String count,
    required String label,
    required IconData icon,
    required Color badgeColor,
    required Color iconColor,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => _showActionFeedback(label),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
              const SizedBox(height: 6),
              Text(
                count,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.person_outline_rounded,
            title: 'Full Name',
            value: _profile.fullName,
          ),
          _buildInnerDivider(),
          _buildInfoRow(
            icon: Icons.alternate_email_rounded,
            title: 'Username',
            value: _profile.username,
          ),
          _buildInnerDivider(),
          _buildInfoRow(
            icon: Icons.mail_outline_rounded,
            title: 'Email Address',
            value: _profile.email,
          ),
          _buildInnerDivider(),
          _buildInfoRow(
            icon: Icons.phone_outlined,
            title: 'Phone Number',
            value: _profile.phoneNumber,
          ),
          _buildInnerDivider(),
          _buildInfoRow(
            icon: Icons.location_on_outlined,
            title: 'Location',
            value: _profile.location,
          ),
          _buildInnerDivider(),
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            title: 'Date Joined',
            value: _profile.dateJoined,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.lock_outline_rounded,
            title: 'Change Password',
            onTap: () => _showActionFeedback('Change Password'),
          ),
          _buildInnerDivider(),
          _buildSettingsTile(
            icon: Icons.language_rounded,
            title: 'Language Settings',
            trailingText: 'English',
            onTap: () => _showActionFeedback('Language Settings'),
          ),
          _buildInnerDivider(),
          _buildSwitchTile(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
              _showActionFeedback(value ? 'Notifications Enabled' : 'Notifications Disabled');
            },
          ),
          _buildInnerDivider(),
          _buildSwitchTile(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
              _showActionFeedback(value ? 'Dark Mode Enabled' : 'Dark Mode Disabled');
            },
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.help_outline_rounded,
            title: 'Help Center',
            onTap: () => _showActionFeedback('Help Center'),
          ),
          _buildInnerDivider(),
          _buildSettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () => _showActionFeedback('Privacy Policy'),
          ),
          _buildInnerDivider(),
          _buildSettingsTile(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () => _showActionFeedback('Terms & Conditions'),
          ),
          _buildInnerDivider(),
          _buildSettingsTile(
            icon: Icons.contact_support_outlined,
            title: 'Contact Us',
            onTap: () => _showActionFeedback('Contact Us'),
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: _handleLogout,
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          'Log Out',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: AppColors.primaryDark.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 2.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          letterSpacing: -0.2,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? trailingText,
    bool isLast = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          bottom: isLast ? const Radius.circular(20) : Radius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.cream,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Text(
                  trailingText,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.textLight.withValues(alpha: 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: AppColors.primary,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.border,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 52,
      endIndent: 16,
      color: AppColors.border.withValues(alpha: 0.35),
    );
  }
}
