import 'package:applications_dao/app/model/product_list.dart';
import 'package:applications_dao/app/util/buildcheckout.dart';
import 'package:applications_dao/app/util/message.dart';
import 'package:applications_dao/app/view/home/hoempage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  const CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double? totalprice;
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

  double calculateTotal() {
    return cartItems.fold(
        0.0, (total, item) => total + double.parse(item.price));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var product = cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.image, width: 50),
                        title: Text(product.title),
                        subtitle: Text(product.price),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 26,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Row(
            children: [],
          ),
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Showmessage(context, 'buy successful ${totalprice}',
                      icon: Icons.done,
                      backgroundColor: const Color.fromARGB(61, 2, 255, 61));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // show report

                child: Center(
                  child: Text(
                    'Proceed to Payment',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const DetailPage({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(product.image, height: 200)),
            SizedBox(height: 16),
            Text(product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(product.subtitle, style: TextStyle(color: Colors.black54)),
            SizedBox(height: 16),
            Text(product.price,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                onAdd();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Center(
                  child: Text('Add to Cart', style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }
}
