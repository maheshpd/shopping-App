import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_ui/theme/colors.dart';
import 'package:shopping_ui/widgets/custom_slider.dart';

import '../json/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          children: [
              Container(
                width: size.width,
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage(homeImg), fit: BoxFit.cover)
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Icon(
                    Icons.favorite,
                    color: white,
                    size: 28,
                  ),
                  SizedBox(width: 15,),
                  Icon(
                    Feather.search,
                    color: white,
                    size: 25,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Winter Collection", style: TextStyle(
                      fontSize: 25,
                      color: white,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: const <Widget>[
                        Text("DISCOVER ", style: TextStyle(
                            fontSize: 15,
                            color: white,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_forward_ios, color: white,size: 18,)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  <Widget>[
              const Text("Categories ", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              ),
              Row(
                children:  const <Widget>[
                  Text("All", style: TextStyle(color: grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios, color: grey, size: 16,)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index){
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  width: 180,
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(categories[index]['imgUrl'].toString()),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            categories[index]['title'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  <Widget>[
              const Text("Recommended for you ", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              ),
              Row(
                children:  const <Widget>[
                  Text("All", style: TextStyle(color: grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios, color: grey, size: 16,)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recommends.length, (index){
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(recommends[index]['imgUrl'].toString()),
                            fit: BoxFit.cover)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(recommends[index]['title'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: black,
                            height: 1.5
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text("\$ "+recommends[index]['price'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: grey,
                            height: 1.5
                          ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })
          ),
        ),
        const SizedBox(height: 40,),
        const CustomeCarouselHomePage(items: slider),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  <Widget>[
              const Text("Recent viewed ", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              ),
              Row(
                children:  const <Widget>[
                  Text("All", style: TextStyle(color: grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios, color: grey, size: 16,)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(recently.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(recently[index]['imgUrl'].toString()),
                                fit: BoxFit.cover)
                        ),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(recently[index]['title'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                  height: 1.5
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text("\$ "+recently[index]['price'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: grey,
                                  height: 1.5
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
          ),
        ),
        const SizedBox(height: 40,),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
