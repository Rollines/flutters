import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

class SecondTab extends StatefulWidget {
  SecondTab({Key key,this.products}):super(key:key);
  final List<Product> products;

  @override
  _SecondTabPage createState()=>new _SecondTabPage();
}

class _SecondTabPage extends State<SecondTab>{
  Set<Product> _shoppingCart = new Set<Product>();
  void _handleCartChanged(Product product,bool inCart){
    setState(() {
      if(inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物清单"),
      ),
      body: new ListView(
        children: widget.products.map(
    (Product product){
      return new ShoppingListItem(
        product: product,
        inCart: _shoppingCart.contains(product),
        onCartChanged: _handleCartChanged,
      );
    }
        ).toList(),
      ),
    );
  }
}
final List<Product> _kproducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '鸭蛋'),
  new Product(name: '啤酒'),
  new Product(name: '巧克力'),
];