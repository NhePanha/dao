class Product {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  Product(this.image, this.title, this.subtitle, this.price);
}

List<Product> allProducts = [
  Product(
      'assets/images/banana.png', 'Organic Bananas', '7pcs, Priceg', '\$4.99'),
  Product('assets/images/apple.png', 'Red Apple', '1kg, Priceg', '\$4.99'),
  Product('assets/images/pepper.png', 'Red Pepper', '1kg, Priceg', '\$4.99'),
  Product('assets/images/ginger.png', 'Ginger', '500g, Priceg', '\$2.99'),
  Product(
      'assets/images/tomato.png', 'Fresh Tomatoes', '1kg, Priceg', '\$3.49'),
  Product('assets/images/potato.png', 'Potatoes', '2kg, Priceg', '\$2.99'),
  Product('assets/images/onion.png', 'Red Onions', '1kg, Priceg', '\$2.79'),
  Product('assets/images/lettuce.png', 'Lettuce', '1pc, Priceg', '\$1.49'),
];
