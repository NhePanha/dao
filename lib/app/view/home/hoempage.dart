import 'package:applications_dao/app/model/product_list.dart';
import 'package:applications_dao/app/util/message.dart';
import 'package:applications_dao/app/view/account/buildaccountpage.dart';
import 'package:applications_dao/app/view/cart/cartpage.dart';
import 'package:applications_dao/app/view/detailpage.dart/detailpage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> displayedProducts = [];
  List<Product> cartItems = [];
  List<Product> favoriteItems = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    displayedProducts = allProducts;
  }

  void updateSearch(String query) {
    setState(() {
      displayedProducts = allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void toggleFavorite(Product product) {
    setState(() {
      if (favoriteItems.contains(product)) {
        favoriteItems.remove(product);
      } else {
        favoriteItems.add(product);
      }
    });
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildHomePage(),
      const Center(child: Text('Explore Page')),
      CartPage(cartItems: cartItems),
      buildFavoritePage(),
      AccountPage(context),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black54),
                const SizedBox(width: 8),
                const Text('Phnom Penh', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart, size: 28),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2; // Navigate to Cart Page
                        });
                      },
                    ),
                    if (cartItems.isNotEmpty)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Text('${cartItems.length}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        ),
                      ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black54),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: updateSearch,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Store',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Exclusive Offer',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('See all', style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
              children: displayedProducts.map((product) {
                return _buildProductCard(product);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailPage(product: product, onAdd: () => addToCart(product)),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(product.image, height: 80)),
              Text(product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(product.subtitle,
                  style: const TextStyle(color: Colors.black54)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          favoriteItems.contains(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteItems.contains(product)
                              ? Colors.red
                              : Colors.black54,
                        ),
                        onPressed: () {
                          toggleFavorite(product);
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            Showmessage(context, "please check cart thank you",
                                icon: Icons.shopify,
                                backgroundColor:
                                    const Color.fromARGB(150, 89, 89, 89));
                            addToCart(product);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFavoritePage() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: favoriteItems.map((product) {
          return ListTile(
            leading: Image.asset(product.image, width: 50),
            title: Text(product.title),
            subtitle: Text(product.subtitle),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                toggleFavorite(product);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
