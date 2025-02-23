import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function(Item) addToCart;

  ItemCard({required this.item, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('₹${item.price}'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => addToCart(item),
        ),
      ),
    );
  }
}