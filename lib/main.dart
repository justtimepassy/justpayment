import 'package:flutter/material.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';
import 'models/item.dart';
import 'widgets/item_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> menuItems = [
    Item(name: 'Burger', price: 12),
    Item(name: 'Pizza', price: 20),
    Item(name: 'Pasta', price: 15),
    Item(name: 'Salad', price: 10),
  ];

  List<Item> cartItems = [];

  void _addToCart(Item item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void _removeFromCart(Item item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  double getTotalBill() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    removeFromCart: _removeFromCart,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  item: menuItems[index],
                  addToCart: _addToCart,
                );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Total Bill: ₹${getTotalBill()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}