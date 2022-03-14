import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/bottom_navigation.dart';
import 'package:flutter_chat_app/common/search_bar.dart';
import 'package:flutter_chat_app/constants/constants.dart';
import 'package:flutter_chat_app/constants/ui_constant.dart';
import 'package:flutter_chat_app/widgets/home/chatter_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(controller: TextEditingController())),
        Expanded(
          child: ListView(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ChatterCard(
                  isRead: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ChatterCard(
                  isRead: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ChatterCard(
                  isRead: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ChatterCard(
                  isRead: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ChatterCard(
                  isRead: false,
                ),
              ),
            ],
          ),
        )
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: UIConstant.white,
          ),
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(BottomNavigationIndex.home.index),
    );
  }
}
