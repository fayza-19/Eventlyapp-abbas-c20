import 'package:evently/features/main_layout/tabs/favtab.dart';
import 'package:evently/features/main_layout/tabs/hometab.dart';
import 'package:evently/features/main_layout/tabs/profiletab.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout ({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
 int TappedIndex = 0 ;
  List<Widget> tabs = [
   Hometab(),
   Favtab(),
   Profiletab()
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[TappedIndex],
      bottomNavigationBar: _buildBottomnavbar,
    );
  }
  void _onTap(int newIndex){
    setState(() {
        TappedIndex = newIndex ;
      });

  }
  BottomNavigationBar get _buildBottomnavbar {
    return BottomNavigationBar(
        currentIndex: TappedIndex ,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(TappedIndex == 0 ? Icons.home : Icons.home_outlined),label:"Home" ),
          BottomNavigationBarItem(icon:Icon(TappedIndex == 1 ? Icons.favorite : Icons.favorite_outline) ,label:"Favorite" ),
          BottomNavigationBarItem(icon:Icon(TappedIndex == 2? Icons.person_2 : Icons.person_2_outlined ) ,label:"Profile" ),

        ]);
  }
}
