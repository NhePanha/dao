import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                        'assets/images/profile.jpg'), // Replace with your image
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dao Dao',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.edit, color: Colors.green, size: 16),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'daodao168@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Menu List
            Expanded(
              child: ListView(
                children: [
                  _buildProfileTile('Orders', Icons.shopping_bag_outlined),
                  _buildProfileTile('My Details', Icons.person_outline),
                  _buildProfileTile(
                      'Delivery Address', Icons.location_on_outlined),
                  _buildProfileTile(
                      'Payment Methods', Icons.credit_card_outlined),
                  _buildProfileTile(
                      'Promo Code', Icons.local_activity_outlined),
                  _buildProfileTile('Notifications', Icons.notifications_none),
                  _buildProfileTile('Help', Icons.help_outline),
                  _buildProfileTile('About', Icons.info_outline),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add logout functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4F4F4),
                  foregroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Log Out', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation or functionality here
      },
    );
  }
}
