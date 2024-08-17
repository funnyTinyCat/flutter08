import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove drink from cart
  void removeFromCart(Drink drink) {

    Provider.of<Shop>(context, listen: false).removeFromCart(drink);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // heading
              const Text(
                "Your Cart",
                style: TextStyle(fontSize: 20,),
              ),
          
              const SizedBox(height: 12,),
              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in cart first
                    Drink drink = value.cart[index];
                
                    // return as a nice tile
                    return DrinkTile(
                      drink: drink, 
                      onTap: () => removeFromCart(drink), 
                      trailing: const Icon(Icons.delete)
                    );
                
                  }
                ),
              ),
          
              // pay button
              MaterialButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(color: Colors.white,),
                ),
                color: Colors.brown,
                onPressed: () {},
              ),
              // 
          
            ],
          ),
        ),
      ),
        
    );
  }
}