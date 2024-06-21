import 'package:flutter/material.dart';

class ScrollableTagFilter extends StatefulWidget {
  final List<String> tags;
  final void Function(List<String>) onTagSelected;

  const ScrollableTagFilter({super.key, required this.tags, required this.onTagSelected});

  @override
  ScrollableTagFilterState createState() => ScrollableTagFilterState();
}

class ScrollableTagFilterState extends State<ScrollableTagFilter> {
  List<int> _selectedIndices = [];

  void _onButtonTapped(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
      widget.onTagSelected(_selectedIndices.map((i) => widget.tags[i]).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.primary.withOpacity(0.9);
    final unselectedColor = Theme.of(context).colorScheme.onBackground.withOpacity(.05);
    final textTheme = Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widget.tags.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ElevatedButton(
              onPressed: () => _onButtonTapped(index),
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(textTheme),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(4)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all<Color>(
                  _selectedIndices.contains(index) ? selectedColor : unselectedColor,
                ),
                foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
              ),
              child: Text(widget.tags[index]),
            ),
          ),
        ),
      ),
    );
  }
}
