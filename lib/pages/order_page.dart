import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  // customize sweetness
  double sweetValue = 0.5; 
  double iceValue = 0.5;
  double pearlValue = 0.5;

  void customizeSweet(double newValue) {
    //
    setState(() {
      sweetValue = newValue;
    });
  }

  void customizeIce(double newValue) {

    setState(() {
      iceValue = newValue;
    });
  }

  void customizePearl(double newValue) {

    setState(() {
      pearlValue = newValue;
    });
  }

  // add to cart
  void addToCart() {
    // firstlly add to cart
    Provider.of<Shop>(context, listen: false).addToCart(widget.drink);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know it's been successfully added
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title:  Text("Successfully added to cart"),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePagh),

          // sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: const Text("Sweet"),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value)
                      ),
                    ), 
                  ],
                ),
                // ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: const Text("Ice"),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    )
                  ],
                ),
            
                // pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: const Text("Pearl"),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      ),
                    )
                  ],
                ),
            
              ],
            ),
          ),
          // add to cart button
          MaterialButton(
            color: Colors.brown,
            onPressed: addToCart,
            child: const Text(
                "Add to cart", 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),            
          ),

        ],
      ),
    );
  }
}