import 'package:flutter/material.dart';

import '../../../../../Widgets/Custom_App_bar.dart';
import '../../../../../Widgets/Custom_Card_Widget.dart';
import '../Category_Page/Category_Page_Components/Custom_Sorting_Text_B.dart';

/*class CategoryPage extends StatefulWidget {
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

/*class _CategoryPageState extends State<CategoryPage> {
  
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

  void _filterItems(int index) {
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
          if (false/*contractorProvider.isLoading*/) {
            return Center(child: CircularProgressIndicator());
          } else if (false/*contractorProvider.errorMessage != null*/) {
            return Center(child: Text(contractorProvider.errorMessage!));
          } else if (false/*contractorProvider.contractors.isEmpty*/) {
            return Center(child: Text('No contractors found.'));
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20), // Add horizontal padding to center it nicely
                  child: SortingSegmentedControl(
                  title: 'Filter',
                  buttonCaption: 'Locations near me',
                  onSelectionChanged: _filterItems,
                  ),
                ),
                Padding (
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child:SortingSegmentedControl(title: 'Sort By',
                  buttonCaption: 'Rating',
                  onSelectionChanged: _sortItems,
                  )
                ),
                Expanded(child: ListView(
                  padding: const EdgeInsets.all(25.0),
                  children: /*contractorProvider.contractors.map((contractor) {
                      return CustomCard(
                        image: Image.asset('assets/2.png'),
                        email: contractor.email,
                        desc: 'This is an example description for ${contractor.userName}, working for 20 years.',
                        number: contractor.number,
                        name: contractor.userName,
                        category: contractor.service_type,
                        local: contractor.address,
                      );
                    }).toList(),*/
                    exampleCards,
                  )
                )
              ]
            );
          }
        },
      ),
    );
  }
}*/*/
