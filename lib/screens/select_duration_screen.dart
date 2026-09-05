import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'borrow_details_screen.dart';

class SelectDurationScreen extends StatefulWidget {
  const SelectDurationScreen({super.key});

  @override
  State<SelectDurationScreen> createState() => _SelectDurationScreenState();
}

class _SelectDurationScreenState extends State<SelectDurationScreen> {
  int _selectedDuration = 8;
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> _tiers = [
    {
      'label': '1 – 2 Days',
      'price': 800,
      'rangeText': 'Total ৳800 – ৳1,600',
      'isPopular': false,
    },
    {
      'label': '3 – 7 Days',
      'price': 650,
      'rangeText': 'Total ৳1,950 – ৳4,550',
      'isPopular': true,
    },
    {
      'label': '8 – 14 Days',
      'price': 550,
      'rangeText': 'Total ৳4,400 – ৳7,700',
      'isPopular': false,
    },
    {
      'label': '15 – 30 Days',
      'price': 450,
      'rangeText': 'Total ৳6,750 – ৳13,500',
      'isPopular': false,
    },
  ];

  int _getTierIndex(int days) {
    if (days <= 2) {
      return 0;
    } else if (days <= 7) {
      return 1;
    } else if (days <= 14) {
      return 2;
    } else {
      return 3;
    }
  }

  int get _dailyPrice {
    if (_selectedDuration <= 2) {
      return 800;
    } else if (_selectedDuration <= 7) {
      return 650;
    } else if (_selectedDuration <= 14) {
      return 550;
    } else {
      return 450;
    }
  }

  int get _totalPayable {
    return _dailyPrice * _selectedDuration;
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }

  String _getCurrentDate() {
    final now = DateTime.now();

    return '${now.day} ${_getMonthName(now.month)} ${now.year}';
  }

  void _selectTier(int? index) {
    if (index == null) {
      return;
    }

    int defaultDuration;

    switch (index) {
      case 0:
        defaultDuration = 2;
        break;
      case 1:
        defaultDuration = 7;
        break;
      case 2:
        defaultDuration = 8;
        break;
      case 3:
        defaultDuration = 15;
        break;
      default:
        defaultDuration = 8;
    }

    setState(() {
      _selectedIndex = index;
      _selectedDuration = defaultDuration;
    });
  }

  void _changeDuration(int? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _selectedDuration = value;
      _selectedIndex = _getTierIndex(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Select Duration',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How long do you need it?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose the number of days you want to borrow this item.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Duration',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          DropdownButton<int>(
                            value: _selectedDuration,
                            underline: const SizedBox(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primary,
                            ),
                            items: List.generate(
                              30,
                                  (index) {
                                final days = index + 1;

                                return DropdownMenuItem<int>(
                                  value: days,
                                  child: Text(
                                    '$days ${days == 1 ? 'Day' : 'Days'}',
                                    style: const TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                );
                              },
                            ),
                            onChanged: _changeDuration,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Pricing Tiers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    RadioGroup<int>(
                      groupValue: _selectedIndex,
                      onChanged: _selectTier,
                      child: Column(
                        children: List.generate(
                          _tiers.length,
                              (index) {
                            final tier = _tiers[index];
                            final bool isSelected =
                                _selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                _selectTier(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.cream
                                      : AppColors.surface,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.borderFocused
                                        : AppColors.border,
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Radio<int>(
                                      value: index,
                                      activeColor: AppColors.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  tier['label'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    color:
                                                    AppColors.textPrimary,
                                                  ),
                                                ),
                                              ),
                                              if (tier['isPopular'])
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                    AppColors.primary,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      8,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Popular',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '৳${tier['price']} / day',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                              AppColors.primaryDark,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            tier['rangeText'],
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color:
                                              AppColors.textSecondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Breakdown',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildRow(
                            'Start Date',
                            _getCurrentDate(),
                          ),
                          _buildRow(
                            'Duration',
                            '$_selectedDuration ${_selectedDuration == 1 ? 'Day' : 'Days'}',
                          ),
                          _buildRow(
                            'Daily Price',
                            '৳$_dailyPrice',
                          ),
                          const Divider(
                            height: 24,
                            color: AppColors.border,
                          ),
                          _buildRow(
                            'Total Payable',
                            '৳$_totalPayable',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColors.surface,
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BorrowDetailsScreen(
                            selectedDuration: _selectedDuration,
                            dailyPrice: _dailyPrice,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String title,
      String value, {
        bool isTotal = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight:
                isTotal ? FontWeight.w600 : FontWeight.normal,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight:
              isTotal ? FontWeight.bold : FontWeight.w600,
              color: isTotal
                  ? AppColors.primaryDark
                  : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}