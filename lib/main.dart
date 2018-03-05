import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物清单"),
      ),
      body: new ListView(
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

final List<Product> _kProducts = <Product>[
  new Product(name: "鸡蛋🥚"),
  new Product(name: "香蕉🍌"),
  new Product(name: "西瓜🍉"),
  new Product(name: "苹果🍎")
];

void main() {
  runApp(new MaterialApp(
    title: "Shop",
    home: new ShoppingList(
      products: _kProducts,
    ),
  ));
}
