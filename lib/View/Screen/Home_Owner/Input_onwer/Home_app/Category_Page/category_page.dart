import 'package:flutter/material.dart';

import '../../../../../Widgets/Custom_App_bar.dart';
import '../../../../../Widgets/Custom_Card_Widget.dart';

class CategoryPage extends StatefulWidget {
  final String email;
  final String number;
  final String name;
  final String category;
  final String local;

  CategoryPage({
    required this.email,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  });

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
 @override
  void initState() {
    super.initState();
    }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body:  SingleChildScrollView(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomCard(
                    image: Image.asset('assets/2.png'),
                    email: "asfssafsafsfasfasf",
                    desc: 'This is an example description for , working for 20 years.',
                    number: "152100",
                    name: "safsa",
                    category: "SAf",
                    local: "asfasf",
                  ),
 ].toList(),
 )
              ),
            );
        }
}
