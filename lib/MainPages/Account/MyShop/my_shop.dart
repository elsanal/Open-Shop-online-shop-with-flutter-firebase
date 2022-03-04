import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openshop/Components/MenuBar/menu_bar.dart';

class MyShop extends StatefulWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  int menuIndex = 0;
  String menuItem = "All";
  final menuItems = ["All","Electronics","Clothes","Shoes","Foods",
    "Electronics","Clothes","Shoes","Foods"];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              top: 0,
              child: menuBar(context, menu())),
          Positioned(
              top: 100,
              bottom: 2,
              child: Center(child: Text(menuItems[menuIndex]),)),
        ],),
      ),
    );
  }


  Widget menu(){
    final width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.green,
      height: ScreenUtil().setHeight(90),
      width: width,
      padding: EdgeInsets.only(
          left: ScreenUtil().setHeight(20),
          right: ScreenUtil().setHeight(20)
      ),
      child: ListView.builder(
          itemCount: menuItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>Container(
              padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
              child: GestureDetector(
                onTap: (){setState(() {
                  menuIndex = index;
                  menuItem = menuItems[index];
                });},
                child: Text(menuItems[index],
                  style: TextStyle(
                    color: menuIndex==index?Colors.orange:Colors.white,
                    // backgroundColor: menuIndex==index?Colors.white:Colors.black
                  ),),
              ))
      ),
    );
  }


}
