import 'package:app/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/model/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "s20 ultra", price: 1200),
    Item(name: "iphone13", price: 1340),
    Item(name: "iphone15 pro", price: 1740)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckOut()),
                  );
                },
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text(
                        "${cart.totalprice}",
                        style: const TextStyle(color: Colors.black),
                      );
                    },
                  )),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return Card(child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListTile(
                    title: Text(items[index].name!),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cart.add(items[index]);
                      },
                    ));
              },
            ));
          })),
    );
  }
}

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
      ),
      body: Card(child: Consumer<Cart>(builder: (context, cart, child) {
        return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: ((context, index) {
              return ListTile(
                  title: Text("${cart.items[index].name}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.minimize),
                    onPressed: () {
                      cart.delet(cart.items[index]);
                    },
                  ));
            }));
      })),
    );
  }
}
