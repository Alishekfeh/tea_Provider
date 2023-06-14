import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/model/drink.dart';
import 'package:tea/model/shope.dart';

import '../components/drink_tile.dart';
import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void gotoOrderPage(Drink drink) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  OrderPage(drink: drink,)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeaShop>(
      builder: (context, value, child) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "Bubble Tea Shop",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      Drink teaDrink = value.shop[index];
                      return DrinkTile(
                        drink: teaDrink,
                        trailing:const  Icon(Icons.arrow_forward_outlined),
                        onTap: () => gotoOrderPage(teaDrink),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
