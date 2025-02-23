import 'package:flutter/material.dart';
import '../models/item.dart';
import './payment_screen.dart';

class CartScreen extends StatelessWidget {
  final List<Item> cartItems;
  final Function(Item) removeFromCart;

  CartScreen({required this.cartItems, required this.removeFromCart});

  double getTotalBill() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].name),
                  subtitle: Text('₹${cartItems[index].price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeFromCart(cartItems[index]),
                  ),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(amount: getTotalBill()),
                ),
              );
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}