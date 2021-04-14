import 'package:bicycle_app_ui/model.dart';
import 'package:bicycle_app_ui/styles.dart';
import 'package:bicycle_app_ui/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  final product = products[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 470,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double w = constraints.maxWidth;
                double h = constraints.maxHeight;

                return Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Hero(
                        tag: 'bg',
                        child: Container(
                          width: w * .9,
                          height: h * .75,
                          color: Color(0xFFFFC5C5),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.type,
                            style: AppStyle.appbarStyle,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            product.name,
                            style: AppStyle.headingStyle,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: h * .32,
                      left: -50,
                      child: Hero(
                        tag: product.name,
                        child: Image.asset(
                          product.imgUrl,
                          width: 370,
                          height: 350,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Amazing Speed',
                  style: AppStyle.headingStyle2,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Incredible Power',
                  style: AppStyle.headingStyle2,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The Top Fuel 9.9 XX1 AXS is built for Speed and Capability on Any terrein',
                  style: AppStyle.descStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      CustomIcons.arrow,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(product: product),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'bg',
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFFC5C5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                      top: 50,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.type,
                          style: AppStyle.appbarStyle,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            CustomIcons.cart,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: product.name,
                    child: Image.asset(
                      product.imgUrl,
                      width: 280,
                      height: 250,
                    ),
                  ),
                  Text(
                    product.name,
                    style: AppStyle.headingStyle,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Top fuel 9.9 XX1 AXS is top tiew full auto"
                    "suspension carbon mountain bike.",
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "It's also spec'd with high—end ROCkShox"
                    "suspension and lots of carbon—including"
                    "the wheels, bars, and shift levers. You'll fly"
                    "through singletrack and rip descents on"
                    "this bike",
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$${product.price}",
                        style: AppStyle.headingStyle,
                      ),
                      FlatButton(
                        child: Text(
                          "Add to cart".toUpperCase(),
                          style: AppStyle.flatButtonStyle,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
