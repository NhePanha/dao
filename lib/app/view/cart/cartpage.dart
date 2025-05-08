import 'package:applications_dao/app/model/product_list.dart';
import 'package:applications_dao/app/util/bottomsheet.dart';
import 'package:applications_dao/app/util/message.dart';
import 'package:applications_dao/app/view/home/hoempage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  const CartPage({required this.cartItems, super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      double price = double.tryParse(item.price.toString()) ?? 0.0;
      total += price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.green,
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var product = cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.image, width: 50),
                        title: Text(product.title),
                        subtitle: Text("\$${product.price}"),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 26,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                BottomSheetExample(total: calculateTotalPrice()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
