import 'package:applications_dao/app/view/home/hoempage.dart';
import 'package:flutter/material.dart';

Widget buildCheckoutRow(String label, String value, IconData icon,
    {Widget? trailingIcon}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(icon, color: Colors.black87),
    title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
      if (value.isNotEmpty)
        Text(value, style: const TextStyle(color: Colors.black54)),
      if (trailingIcon != null) trailingIcon,
      const SizedBox(width: 5),
      const Icon(Icons.arrow_forward_ios, size: 16),
    ]),
    onTap: () {},
  );
}

class CartScreen extends StatelessWidget {
  final List<dynamic> cartItems;
  final Map<dynamic, int> quantities;

  CartScreen({required this.cartItems, required this.quantities});

  void showCheckoutSheet(BuildContext context) {
    // Implement your checkout sheet logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: const Color.fromARGB(105, 151, 151, 151),
        foregroundColor: const Color.fromARGB(70, 0, 0, 0),
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainScreen()),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.separated(
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      final qty = quantities[product] ?? 1;
                      return ListTile(
                        leading: Image.asset(product.image, width: 50),
                        title: Text(product.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(product.subtitle),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    // Decrease quantity logic
                                  },
                                ),
                                Text('$qty'),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    // Increase quantity logic
                                  },
                                ),
                              ],
                            ),
                            Text(
                                '\$${(double.parse(product.price) * qty).toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => showCheckoutSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Proceed to Payment',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }
}
