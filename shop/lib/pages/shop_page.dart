import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/toy_models.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/toys.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add toy to cart
  void addToyToCart(Toy toy) {
    Provider.of<Cart>(context, listen: false).addItemToCart(toy);
    // alert the user
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text(
                'Succefully added!',
                style: TextStyle(
                  color: Color.fromARGB(255, 107, 3, 234),
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                'Check your cart to see the item added',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // Categories
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Category
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Icon(Icons.call),
                    Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Category
              Column(
                children: [
                  Icon(Icons.gps_fixed_rounded),
                  Text(
                    'Location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 107, 3, 234),
                  ),
                ),
              ],
            ),
          ),
          // Products for sale
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                // Get a toy
                Toy toy = value.getToyList()[index];
                // Return the toy

                return ToyModels(
                  toy: toy,
                  onTap: () => addToyToCart(toy),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Divider(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          // Footer
        ],
      ),
    );
  }
}
