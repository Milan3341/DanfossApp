import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../models/chiller_model.dart';

class CustomDropDown extends StatefulWidget {
  final ChillerData? selectedData;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<ChillerData>>? items;

  const CustomDropDown({
    Key? key,
    required this.selectedData,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final TextEditingController textEditingController = TextEditingController();

  double getDropdownOffset(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return 0; // Offset value for portrait orientation
    } else {
      return -45;
      // Offset v0alue for landscape orientation
    }
  }

  double getDropdownOffset2(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return 45; // Y-axis offset value for portrait orientation
    } else {
      return 45; // Y-axis offset value for landscape orientation
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return DropdownButton2<Object>(
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            items: widget.items,
            value: widget.selectedData,
            onChanged: widget.onChanged,
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(4),
              elevation: 2,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            iconStyleData: IconStyleData(
              iconSize: 30,
              iconEnabledColor: Theme.of(context).colorScheme.primary,
            ),
            dropdownStyleData: DropdownStyleData(
              offset: Offset(
                  getDropdownOffset(context),
                  getDropdownOffset2(
                      context)), // Adjust offset based on device orientation
            ),
            menuItemStyleData: MenuItemStyleData(
              overlayColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            dropdownSearchData: DropdownSearchData(
              searchController: textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an item...',
                    hintStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return (item.value.toString().contains(searchValue));
              },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                textEditingController.clear();
              }
            },
          );
        },
      ),
    );
  }
}
