import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/model/drink.dart';
import 'package:tea/model/shope.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({Key? key, required this.drink}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue=0.5;
  double iceValue=0.5;
  double pearlsValue=0.5;
  customizeSweet(double newValue){
    setState(() {
      sweetValue=newValue;
    });
  }
  customizeIce(double newValue){
    setState(() {
      iceValue=newValue;
    });
  }
  customizePearls(double newValue){
    setState(() {
      pearlsValue=newValue;
    });
  }
  void addToCart(){
    Provider.of<TeaShop>(context,listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(context: context, builder: (context)=>const AlertDialog(
      title: Text("successfully added to cart"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.drink.imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const  SizedBox(
                     width: 100,
                       child:   Text("sweet",style: TextStyle(fontSize: 20,color: Colors.brown),)),
                    Expanded(
                      child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeSweet(value)),
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const  SizedBox(
                     width: 100,
                       child:   Text("ice",style: TextStyle(fontSize: 20,color: Colors.brown),)),
                    Expanded(
                      child: Slider(
                          value: iceValue,
                          label: iceValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeIce(value)),
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const  SizedBox(
                     width: 100,
                       child:   Text("pearls",style: TextStyle(fontSize: 20,color: Colors.brown),)),
                    Expanded(
                      child: Slider(
                          value: pearlsValue,
                          label: pearlsValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizePearls(value)),
                    )

                  ],
                ),

              ],
            ),
          ),
          MaterialButton(
              onPressed: addToCart,
              color: Colors.brown,
              minWidth: 200,

              child:const  Text("Add To Cart",style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
