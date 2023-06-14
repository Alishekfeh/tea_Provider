import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/components/drink_tile.dart';
import 'package:tea/model/drink.dart';
import 'package:tea/model/shope.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink){
    git init.of<TeaShop>(context,listen: false).removeToCart(drink);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TeaShop>(builder: (context, value, child) =>
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text("Your Cart", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                  itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      Drink drink = value.cart[index];
                      return DrinkTile(
                        onTap: () => removeFromCart(drink),
                          drink: drink, trailing: const Icon(Icons.delete,));
                    })),
                MaterialButton(
                    onPressed: (){},
                    color: Colors.brown,
                    minWidth: 200,

                    child:const  Text("PAY",style: TextStyle(color: Colors.white),))

              ],
            ),
          ),
        ));
  }
}
