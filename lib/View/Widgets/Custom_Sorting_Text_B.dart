import 'package:flutter/material.dart';

class SortingSegmentedControl extends StatefulWidget {
  @override
  _SortingSegmentedControlState createState() => _SortingSegmentedControlState();
}

class _SortingSegmentedControlState extends State<SortingSegmentedControl> {
  List<String> _items = ['Orange', 'Apple', 'Banana', 'Mango'];
  List<bool> _isSelected = [true,  false];

  void _sortItems(int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
        if (buttonIndex == index) {
          _isSelected[buttonIndex] = true;
        } else {
          _isSelected[buttonIndex] = false;
        }
      }

      if (index == 0) {
        _items.sort((a, b) => a.compareTo(b)); // Alphabetical A-Z
      } else if (index == 1) {
        _items.sort((a, b) => b.compareTo(a)); // Reverse Alphabetical Z-A
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 30),

        ToggleButtons(
          borderColor: Color(0xff59308E),
          selectedBorderColor: Color(0xff59308E),
          borderWidth: 1,
          selectedColor: Colors.white,
          color: Color(0xff59308E),
          fillColor: Color(0xff59308E),
          borderRadius: BorderRadius.circular(10),
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('None')),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Location near me ')),
          ],
          onPressed: (int index) {
            _sortItems(index);
          },
          isSelected: _isSelected,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(_items[index]),
            ),
          ),
        ),
      ],
    );
  }
}