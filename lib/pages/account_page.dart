import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_ui/json/constant.dart';
import 'package:shopping_ui/theme/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody(){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(image: NetworkImage(profileUrl), fit: BoxFit.cover)
                ),
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                     const Text("Daniel", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                     ),
                  const SizedBox(height: 10,),
                  Text("Member since 2019", style: TextStyle(
                      fontSize: 13,
                      color: black.withOpacity(0.7)
                  ),
                  ),
                  const SizedBox(height: 10,),
                   Container(
                     decoration: BoxDecoration(
                       color: black, borderRadius: BorderRadius.circular(5)
                     ),
                     child: const Padding(
                       padding:  EdgeInsets.all(12.0),
                       child:  Center(child: Text("EDIT ACCOUNT", style: TextStyle(fontSize: 13, color: Colors.white),)),
                     ),
                   ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const <Widget>[
                  Icon(FontAwesomeIcons.box,
                  color: black,),
                  SizedBox(width: 10,),
                  Text("Orders", style: TextStyle(fontSize: 15),)
                ],
              ),
              Row(
                children: const <Widget>[
                  Icon(FontAwesomeIcons.mapMarkerAlt,
                    color: black,),
                  SizedBox(width: 10,),
                  Text("My Address", style: TextStyle(fontSize: 15),)
                ],
              ),
              Row(
                children: const <Widget>[
                  Icon(FontAwesomeIcons.cog,
                    color: black,),
                  SizedBox(width: 10,),
                  Text("Settings", style: TextStyle(fontSize: 15),)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: List.generate(accountList.length, (index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(accountList[index],style: const TextStyle(fontSize: 16),),
                        Icon(Icons.arrow_forward_ios, color: black.withOpacity(0.5),size: 17,)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Divider(
                      color: grey.withOpacity(0.8),
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
