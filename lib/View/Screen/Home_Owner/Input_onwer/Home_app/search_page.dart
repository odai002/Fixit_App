//import 'package:flutter/material.dart';
// ignore: unused_import

//import '../../../../Widgets/Custom_App_bar.dart';
//import '../../../../Widgets/Custom_Bottom_naf_Bar.dart';
//import '../../../../Widgets/Custom_Card_Widget.dart';
//import '../Home_app/Category_Page/Category_Page_Components/Custom_Sorting_Text_B.dart';


//class SearchPage extends StatefulWidget {
  //final String data;
  

  //SearchPage({
  //  required this.data,
 // });

  //@override
  //// ignore: library_private_types_in_public_api
  //_SearchPageState createState() => _SearchPageState();
//}

/*class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContractorProvider>(context, listen: false).fetchContractors(widget.category);
    });*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
final List<CustomCard> exampleCards = [
      CustomCard(
        image: Image.asset('assets/2.png'),
        email: 'john.doe@example.com',
        desc: 'This is an example description for John Doe, working for 20 years.',
        number: '123-456-7890',
        name: 'John Doe',
        category: 'Plumbing',
        local: '123 Elm St.',
      ),
      CustomCard(
        image: Image.asset('assets/2.png'),
        email: 'jane.smith@example.com',
        desc: 'This is an example description for Jane Smith, working for 15 years.',
        number: '987-654-3210',
        name: 'Jane Smith',
        category: 'Electrician',
        local: '456 Oak Ave.',
      ),
      CustomCard(
        image: Image.asset('assets/2.png'),
        email: 'mark.jones@example.com',
        desc: 'This is an example description for Mark Jones, working for 10 years.',
        number: '555-123-4567',
        name: 'Mark Jones',
        category: 'Carpenter',
        local: '789 Pine Rd.',
      ),
    ];
    void _sortItems(int index) {
    // Sort items based on the selection
      /*if (index == 0) {
        exampleCards.sort((a, b) => a.compareTo(b)); // Alphabetical A-Z
      } else if (index == 1) {
        exampleCards.sort((a, b) => b.compareTo(a)); // Reverse Alphabetical Z-A
      }*/
  }
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      bottomNavigationBar: SnackBarBody(),
      resizeToAvoidBottomInset: false,
      body: Consumer<ContractorProvider>(
        builder: (context, contractorProvider, child) {
            return Column(
              children: [
                Padding (
                  padding: const EdgeInsets.only(top: 20),
                  child:SortingSegmentedControl(
                    title: "Sort By",
                    buttonCaption: "Rating",
                    onSelectionChanged: _sortItems,
                  )
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                    exampleCards,
                  )
                )
              ]
            );
          }
      ),
    );
  }
} */
