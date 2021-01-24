import 'package:flutter/material.dart';
import 'package:medical/Pages/compare_files/Analysis.dart';

class MultiSelectionExample extends StatefulWidget {
  List<Analysis> analysisList;

  MultiSelectionExample(this.analysisList);

  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            widget.analysisList[index].isSelected = !widget.analysisList[index].isSelected;
            setState(() {});
          },
          child: Container(
            color: widget.analysisList[index].isSelected
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: widget.analysisList[index].isSelected,
                     onChanged: (s) {
                       widget.analysisList[index].isSelected = !widget.analysisList[index].isSelected;
                      setState(() {});
                    }),
                Text(widget.analysisList[index].analysisName)
              ],
            ),
          ),
        );
      },
      itemCount: widget.analysisList.length,
    );
  }
}
