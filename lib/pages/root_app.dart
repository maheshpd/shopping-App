import 'package:flutter/material.dart';
import 'package:shopping_ui/json/constant.dart';
import 'package:shopping_ui/pages/account_page.dart';
import 'package:shopping_ui/pages/cart_page.dart';
import 'package:shopping_ui/pages/home_page.dart';
import 'package:shopping_ui/pages/more_page.dart';
import 'package:shopping_ui/pages/store_page.dart';
import 'package:shopping_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  int activeTab = 0;
  //appbar
  // AppBar appBar = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: const <Widget>[
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        MorePage()
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
   switch (activeTab) {
     case 0:
       return PreferredSize(child: AppBar(
         elevation: 0.8,
         backgroundColor: white,
       ), preferredSize: const Size.fromHeight(0));
       break;
     case 1:
       return PreferredSize(child: AppBar(
         elevation: 0.0,
         backgroundColor: white,
       ), preferredSize: const Size.fromHeight(50));
       break;
     case 2:
       return PreferredSize(child: AppBar(
         elevation: 0.8,
         backgroundColor: white,
         title: const Text("ACCOUNT", style: TextStyle(color: black),),
       ), preferredSize: const Size.fromHeight(50));
    break;
     case 3:
       return PreferredSize(child: AppBar(
         elevation: 0.8,
         backgroundColor: white,
         title: const Text("CART", style: TextStyle(color: black),),
       ), preferredSize: const Size.fromHeight(50));
       break;
     case 4:
       return PreferredSize(child: AppBar(
         elevation: 0.8,
         backgroundColor: white,
         title: const Text("MORE", style: TextStyle(color: black),),
       ), preferredSize: const Size.fromHeight(50));
       break;

     default:
       return const PreferredSize(preferredSize: Size.fromHeight(0),
       child: Text(""),);
   }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration:  BoxDecoration(color: white, border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemsTab.length, (index){
            return IconButton(onPressed: (){
                setState(() {
                  activeTab = index;
                });
            }, icon: Icon(itemsTab[index]['icon'], size: itemsTab[index]['size'],
              color: activeTab == index ? accent : black,
            ));
          })
        ),
      ),
    );
  }
}
