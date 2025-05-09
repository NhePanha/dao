import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage(BuildContext context, {Key? key, required})
      : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                        'assets/images/profile.jpg'), // Replace with your image
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dao Dao',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.edit, color: Colors.green, size: 16),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'daodao@gmail.com',
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
                  _buildProfileTile(
                      'Orders', Icons.shopping_bag_outlined, context),
                  _buildProfileTile('My Details', Icons.person_outline, context,
                      navigateToDetails: true),
                  _buildProfileTile(
                      'Delivery Address', Icons.location_on_outlined, context),
                  _buildProfileTile(
                      'Payment Methods', Icons.credit_card_outlined, context),
                  _buildProfileTile(
                      'Promo Code', Icons.local_activity_outlined, context),
                  _buildProfileTile(
                      'Notifications', Icons.notifications_none, context),
                  _buildProfileTile('Help', Icons.help_outline, context),
                  _buildProfileTile('About', Icons.info_outline, context),
                  _buildProfileTile('Log out', Icons.info_outline, context),
                ],
              ),
            ),
            // Logout Button
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(String title, IconData icon, BuildContext context,
      {bool navigateToDetails = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (navigateToDetails) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountDetail()),
          );
        }
        // Add other navigation or functionality here if needed
      },
    );
  }
}
class AccountDetail extends StatefulWidget {
  const AccountDetail({super.key});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.jpg')),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dao Dao',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'daodao@gmail.com',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Account Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.green),
              title: const Text('Name'),
              subtitle: const Text('Dao Dao'),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Add edit functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.green),
              title: const Text('Email'),
              subtitle: const Text('daodao@gmail.com'),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Add edit functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone_outlined, color: Colors.green),
              title: const Text('Phone'),
              subtitle: const Text('+123 456 7890'),
              trailing: const Icon(Icons.edit, color: Colors.grey),
              onTap: () {
                // Add edit functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
