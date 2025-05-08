import 'package:applications_dao/app/model/product_list.dart';
import 'package:applications_dao/app/util/message.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  final VoidCallback onAdd;

  const DetailPage({required this.product, required this.onAdd});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  bool showDetail = true;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(product.image, height: 220),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: ListView(
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text("1kg, Price", style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => setState(() {
                              if (quantity > 1) quantity--;
                            }),
                            icon: const Icon(Icons.remove, color: Colors.green),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text('$quantity',
                                style: const TextStyle(fontSize: 18)),
                          ),
                          IconButton(
                            onPressed: () => setState(() => quantity++),
                            icon: const Icon(Icons.add, color: Colors.green),
                          ),
                        ],
                      ),
                      Text(
                        '\$${(double.parse(product.price.toString()) * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ExpansionTile(
                    title: const Text("Product Detail",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, bottom: 8, right: 16),
                        child: Text(
                          "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                  const ListTile(
                    title: Text("Nutritions",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("100gr", style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Review",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child:
                  const Text("Add to Basket", style: TextStyle(fontSize: 16)),
              onPressed: () {
                widget.onAdd();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         // Change the button shape temporarily
          //       });
          //       widget.onAdd();
          //       Navigator.pop(context);
          //     },
          //     // style: ElevatedButton.styleFrom(
          //     //   backgroundColor: Colors.green,
          //     //   padding: const EdgeInsets.symmetric(vertical: 16),
          //     //   shape: RoundedRectangleBorder(
          //     //     borderRadius: BorderRadius.circular(16),
          //     //   ),
          //     // ),
          //     child: Center(
          //       child: BottomSheetExample(),
          //       // child: Text("Add To Basket", style: TextStyle(fontSize: 18)),
          //     ),
          // ),
          // )