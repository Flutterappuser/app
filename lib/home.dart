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
                    MaterialPageRoute(builder: (context) => const Second()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  "${Provider.of<Cart>(context).totalprice}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
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

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
      ),
      body: ListView.builder(
          itemCount: Provider.of<Cart>(context).items.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                  title:
                      Text("${Provider.of<Cart>(context).items[index].name}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.minimize),
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).delet(
                          Provider.of<Cart>(context, listen: false)
                              .items[index]);
                    },
                  )),
            );
          })),
    );
  }
}
