import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownMenuExample extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String>? onSelected;

  const DropdownMenuExample({
    Key? key,
    required this.items,
    this.onSelected, required void Function(String value) initialValue,
  }) : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.isNotEmpty ? widget.items.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(11)),
      child: DropdownButton<String>(
        value: dropdownValue,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: GoogleFonts.libreCaslonText(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              dropdownValue = newValue;
            });
            if (widget.onSelected != null) {
              widget.onSelected!(newValue);
            }
          }
        },
        underline: Container(),
        hint: Text(
          'User Type',
          style: GoogleFonts.libreCaslonText(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
