import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

import 'add_item_screen.dart';
import 'history_screen.dart';
import 'notifications_screen.dart';
import 'item_details_screen.dart';
import 'my_bookings_screen.dart';
import 'profile_screen.dart';
import 'request_item_screen.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int _currentNavIndex = 0;

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: _currentNavIndex == 1
? null
: AppBar(
centerTitle: true,
backgroundColor: AppColors.background,
title: Text(
_getTitle(),
style: const TextStyle(
color: AppColors.primaryDark,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
),

body: _getBody(),

floatingActionButton: _currentNavIndex == 0
? FloatingActionButton(
backgroundColor: AppColors.primary,
foregroundColor: Colors.white,
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => AddItemScreen(),
),
);
},
child: const Icon(Icons.add),
)
: null,

bottomNavigationBar: BottomNavigationBar(
currentIndex: _currentNavIndex,
backgroundColor: AppColors.surface,
selectedItemColor: AppColors.primaryDark,
unselectedItemColor: AppColors.primary,
onTap: (index) {
setState(() {
_currentNavIndex = index;
});
},
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: 'Home',
),
BottomNavigationBarItem(
icon: Icon(Icons.list),
label: 'Requests',
),
BottomNavigationBarItem(
icon: Icon(Icons.notifications),
label: 'Alerts',
),
BottomNavigationBarItem(
icon: Icon(Icons.history),
label: 'Borrowing History',
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: 'Profile',
),
],
),
);
}

String _getTitle() {
if (_currentNavIndex == 0) {
return 'Lendr';
} else if (_currentNavIndex == 1) {
return 'Requests';
} else if (_currentNavIndex == 2) {
return 'Notifications';
} else if (_currentNavIndex == 3) {
return 'Borrowing History';
} else {
return 'Profile';
}
}

Widget _getBody() {
if (_currentNavIndex == 0) {
return SingleChildScrollView(
child: Column(
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.all(20),
margin: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: AppColors.primary,
borderRadius: BorderRadius.circular(15),
),
child: const Text(
'Borrow what you need, share what you have.',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),

Padding(
padding: const EdgeInsets.symmetric(horizontal: 16),
child: TextField(
decoration: InputDecoration(
hintText: 'Search for an item',
prefixIcon: const Icon(Icons.search),
filled: true,
fillColor: AppColors.inputBackground,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
borderSide: BorderSide.none,
),
),
),
),

const SizedBox(height: 20),

Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(horizontal: 16),
child: const Text(
'Featured Nearby',
style: TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
),

const SizedBox(height: 10),

_itemCard(
name: 'Camera',
lender: 'Taseen Ehfaz',
distance: '1.2 km away',
price: '৳7000/day',
image: 'assets/images/camera.png',
),

_itemCard(
name: 'Drill Machine',
lender: 'Sajid Arefin Mahin',
distance: '2.0 km away',
price: '৳1500/day',
image: 'assets/images/drill.png',
),

_itemCard(
name: 'Pressure Washer',
lender: 'Maisara Khan Rupai',
distance: '2.5 km away',
price: '৳2500/day',
image: 'assets/images/Pressure_Washer.jpeg',
),

_itemCard(
name: 'Tent',
lender: 'Samin Yasar',
distance: '3.1 km away',
price: '৳2800/day',
image: 'assets/images/Tent.jpeg',
),

const SizedBox(height: 20),
],
),
);
} else if (_currentNavIndex == 1) {
return const MyBookingsScreen();
} else if (_currentNavIndex == 2) {
return const NotificationsScreen();
} else if (_currentNavIndex == 3) {
return const HistoryScreen();
} else {
return const ProfileScreen();
}
}

Widget _itemCard({
required String name,
required String lender,
required String distance,
required String price,
required String image,
}) {
return Card(
margin: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 8,
),
color: const Color(0xFFFFF8E7),
clipBehavior: Clip.antiAlias,
child: InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => ItemScreen(
imagePath: image,
itemName: name,
price: price,
lender: lender,
),
),
);
},
child: Column(
children: [
Image.asset(
image,
width: double.infinity,
fit: BoxFit.cover,
),

Padding(
padding: const EdgeInsets.all(12),
child: Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
name,
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
Text(
'Lender: $lender',
),
Text(
distance,
),
],
),
),

Column(
children: [
Text(
price,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 6),

ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: AppColors.primary,
foregroundColor: Colors.white,
),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => RequestItemScreen(
name: name,
lender: lender,
price: price,
distance: distance,
),
),
);
},
child: const Text('Request'),
),
],
),
],
),
),
],
),
),
);
}
}