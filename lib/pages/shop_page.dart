import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // user selected a drink, go to order page
  void goToOrderPage(Drink drink) {

    // navigate to order page
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => OrderPage(drink: drink,),
    ),
    
    
    );
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
              Text(
                "Bubble Tea Shop",
                style: TextStyle(fontSize: 20),
              ),
          
              SizedBox(height: 12,),
              // list of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    // get individual drink from shop
                    Drink individualDrink = value.shop[index];

                    // return that list as a nice tile
                    return DrinkTile(
                      drink: individualDrink, 
                      onTap: () => goToOrderPage(individualDrink),
                      trailing: const Icon(Icons.arrow_forward,),
                    );
                  }
                ),
              ),
              
              //
            ],
          ),
        ),
      ),

      
    );
  }
}