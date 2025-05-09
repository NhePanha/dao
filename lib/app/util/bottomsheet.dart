import 'package:applications_dao/app/util/message.dart';
import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  final double total;

  const BottomSheetExample({required this.total, super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 235, 235, 235),
          padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text("Add to Basket", style: TextStyle(fontSize: 16)),
        onPressed: () {
          showModalBottomSheet<void>(
            anchorPoint: Offset(0, 50),
            backgroundColor: const Color.fromARGB(245, 255, 255, 255),
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  children: [
                    const Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ListTile(
                      title: Text("Delivery"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Select Method"),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        showPaymentDialog(context, widget.total);
                      },
                      child: const ListTile(
                        title: Text("Payment"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.credit_card, color: Colors.indigo),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text("Promo Code"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Pick discount"),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Total Cost"),
                      trailing: Text(
                        "\$${widget.total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "By placing an order you agree to our Terms And Conditions",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 198, 198, 198),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Showmessage(
                            context, "Payment Successfully thank so much",
                            icon: Icons.shopify,
                            backgroundColor:
                                const Color.fromARGB(175, 204, 204, 204));
                      },
                      child: const Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void showPaymentDialog(BuildContext context, double total) {
  String selectedMethod = "visa_6444";
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (_) {
                    print("hello");
                  },
                ),
                const Icon(Icons.account_balance_wallet),
                const SizedBox(width: 8),
                const Text("€50.04 credit applied",
                    style: TextStyle(color: Colors.green)),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Edit"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _paymentOption(
                    "New card", Icons.add_card, selectedMethod == "new", () {
                  selectedMethod = "new";
                }),
                _paymentOption("•••• 1788", Icons.credit_card,
                    selectedMethod == "visa_1788", () {
                  selectedMethod = "visa_1788";
                }),
                _paymentOption("•••• 6444", Icons.credit_card,
                    selectedMethod == "visa_6444", () {
                  selectedMethod = "visa_6444";
                }),
                SizedBox(
                  height: 50,
                ),
                _paymentOption("PayPal", Icons.account_balance_wallet_outlined,
                    selectedMethod == "paypal", () {
                  selectedMethod = "paypal";
                }),
                _paymentOption("Google Pay", Icons.account_balance_wallet,
                    selectedMethod == "gpay", () {
                  selectedMethod = "gpay";
                }),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Visa •••• 6444",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Cardholder's Name *"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Showmessage(
                  context, "payment succesfully \$${total.toStringAsFixed(2)}",
                  icon: Icons.card_giftcard, backgroundColor: Colors.green);
            },
            child: const Text("Pay"),
          ),
        ],
      );
    },
  );
}

Widget _paymentOption(
    String label, IconData icon, bool selected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border:
              Border.all(color: selected ? Colors.blue : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: selected ? Colors.blue.shade50 : Colors.white,
        ),
        child: Column(
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}
