import 'package:flutter/material.dart';
import 'package:fryo/src/screens/SpendingDetails.dart';
import 'package:fryo/src/widgets/featuerd_prods.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProductPage.dart';
import './cart.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      CartScreen(),
      // Text('Tab3'),
      HomeScreen(),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
      backgroundColor: bgColor,
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Fryo.shop),
              title: Text(
                'Store',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.cart),
              title: Text(
                'My Cart',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.user_1),
              title: Text(
                'Account',
                style: tabLinkStyle,
              )),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: highlightColor,
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {
  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    // Product(
    //     name: "Hamburger",
    //     image: "images/3.png",
    //     price: "\R25.00",
    //     userLiked: true,
    //     discount: 10),
    // Product(
    //     name: "Pasta",
    //     image: "images/5.png",
    //     price: "\R150.00",
    //     userLiked: false,
    //     discount: 7.8),
    // Product(
    //   name: "Akara",
    //   image: 'images/2.png',
    //   price: '\R10.99',
    //   userLiked: false,
    // ),
    // Product(
    //     name: "Strawberry",
    //     image: "images/1.png",
    //     price: '\R50.00',
    //     userLiked: true,
    //     discount: 14),

    Product(
        name: "Organic Spelt Noodles",
        image: "images/spelt_noodles.png",
        price: '\R60.00',
        userLiked: true,
        discount: 3),

    Product(
        name: "Organic Spelt Fusili Brown",
        image: "images/spelt_italian.png",
        price: " \R45",
        userLiked: false,
        discount: 6),
    Product(
        name: "Organic Whole Spelt Spaghetti",
        image: "images/spelt_spaghetti.png",
        price: " \R70.0",
        userLiked: false,
        discount: 7),

    Product(
        name: "Biona Organic Spelt Spinach Artisan Tagliatelle",
        image: "images/spelt_tagliatelle.png",
        price: "\R34.99",
        userLiked: false,
        discount: 0.0),
    Product(
        name: "Organic Whole Spelt Penne",
        image: "images/spelt_penne.png",
        price: "\R55.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Spelt Spinach Artisan Tagliatelle",
        image: "images/spelt_tagliatelle.png",
        price: "\R88.00",
        userLiked: true,
        discount: 17),
    Product(
        name: "Organic Spelt Fusilli Tricolore",
        image: "images/spelt_fusilli.png",
        price: "\R99.99",
        userLiked: false,
        discount: 30)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\R45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\R28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\R78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\R168.99",
        userLiked: true,
        discount: 3.4),
    Product(
        name: "Biona Organic Spelt Noodles",
        image: "images/spelt_noodles.png",
        price: '\R60.00',
        userLiked: true,
        discount: 3),
    Product(
        name: "Biona Organic Spelt Fusili Brown",
        image: "images/spelt_italian.png",
        price: " \R45",
        userLiked: false,
        discount: 6),
    Product(
        name: "Biona Organic Whole Spelt Spaghetti",
        image: "images/spelt_spaghetti.png",
        price: " \R70.0",
        userLiked: false,
        discount: 7),
    Product(
        name: "Biona Organic Spelt Spinach Artisan Tagliatelle",
        image: "images/spelt_tagliatelle.png",
        price: "\R34.99",
        userLiked: false,
        discount: 0.0),
    Product(
        name: "Organic Whole Spelt Penne",
        image: "images/spelt_penne.png",
        price: "\R55.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Organic Spelt Spinach Artisan Tagliatelle",
        image: "images/spelt_tagliatelle.png",
        price: "\R88.00",
        userLiked: true,
        discount: 17),
    Product(
        name: "Organic Spelt Fusilli Tricolore",
        image: "images/spelt_fusilli.png",
        price: "\R99.99",
        userLiked: false,
        discount: 30)
  ];

  return ListView(children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(right: 50.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            fillColor: white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(width: 0.8, color: highlightColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(width: 0.8),
            ),
            hintText: "What are you looking for",
            prefixIcon: Icon(
              Icons.search,
              size: 25.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, size: 25.0),
              onPressed: () {},
            ),
          ),
        ),
      ),
    ),
    headerTopCategories(),
    deals('For You', onViewMore: () {}, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, imgWidth: 250, onLike: () {}),
      foodItem(foods[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {}),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ]),
    deals('Groceries', onViewMore: () {}, items: <Widget>[
      foodItem(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[0],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      foodItem(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[1],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 75),
      foodItem(drinks[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[2],
              );
            },
          ),
        );
      }, imgWidth: 110, onLike: () {}),
      foodItem(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ]),
//    Featured()
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Row(
            children: <Widget>[
              Text('See all ›', style: contrastText),
            ],
          ),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Groceries', Fryo.shop, onPressed: () {}),
            headerCategoryItem('Clothing', Fryo.shirt, onPressed: () {}),
            headerCategoryItem('Electronics', Fryo.camera, onPressed: () {}),
            headerCategoryItem('Cosmetics', Fryo.pencil, onPressed: () {}),
            headerCategoryItem('Fresh Produce', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 65,
            height: 65,
            child: FloatingActionButton(
              elevation: 0.0,
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 30, color: Colors.black87),
            )),
        Text(name, style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
