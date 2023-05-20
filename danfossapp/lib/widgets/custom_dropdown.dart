import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../models/chiller_model.dart';

class CustomDropDown extends StatefulWidget {
  final ChillerData? selectedData;
  final void Function(Object?)? onChanged;

  final List<DropdownMenuItem<ChillerData>>? items;
  const CustomDropDown({
    super.key,
    required this.selectedData,
    required this.onChanged,
    required this.items,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Object>(
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
            iconEnabledColor: Theme.of(context).colorScheme.primary),
        dropdownStyleData: const DropdownStyleData(offset: Offset(0, 20)),
        menuItemStyleData: MenuItemStyleData(
            overlayColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.primary)),
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
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
