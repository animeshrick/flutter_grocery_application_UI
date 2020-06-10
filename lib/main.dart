import 'package:flutter/material.dart';
import 'package:flutter_grocery_shopping/Side_Bar_pages/help_support.dart';
import 'package:flutter_grocery_shopping/Side_Bar_pages/order_history.dart';
import 'package:flutter_grocery_shopping/Side_Bar_pages/track_your_order.dart';
import 'package:flutter_grocery_shopping/Side_Bar_pages/user_proflie.dart';
import 'package:flutter_grocery_shopping/Side_Bar_pages/your_cart.dart';
import 'package:flutter_grocery_shopping/SizeConfig.dart';
import 'package:share/share.dart';

import 'Diary/dairy.dart';
import 'Fruits/fruits.dart';
import 'Nuts_Seeds/nuts.dart';
import 'Offers/Offers.dart';
import 'Vegitables/vegetables.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: MyMainPage(),
            );
          },
        );
      },
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              YourCart();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: DrawerHeader(
                  child: Text("User"),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/user.png"),
                          fit: BoxFit.fitHeight)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'User Profile',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Home ',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) =>HomeView ()),
//                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.business_center,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Shop By Category ',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) =>HomeView ()),
//                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Your Cart',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourCart()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.gps_not_fixed,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Tract Your Order',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackYourOrder()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_mall,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Order History',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderHistory()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Help & Support',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    HelpAndSupport();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'Share me',
                    style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  onTap: () {
                    Share.share('Share with friends !');
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => InviteAFriend(context)),
//                );
                  },
                ),
              ]),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    // hintText: 'What do people call you?',
                    labelText: 'Search Here ->',
                  ),
                  onSaved: (String value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String value) {
                    return value.contains('number')
                        ? 'Do not use the number !'
                        : null;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5 * SizeConfig.heightMultiplier,
          ),
          TabBar(
              controller: tabController,
              indicatorColor: Colors.blue,
              //indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Fruits",
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Vegetables",
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Nuts & Seeds",
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Dairy",
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Offers",
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ]),
          Expanded(
            child: Container(
              child: TabBarView(controller: tabController, children: <Widget>[
                Fruits(),
                Vegetables(),
                Nuts(),
                Dairy(),
                Offers(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
