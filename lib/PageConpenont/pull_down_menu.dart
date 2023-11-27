import 'package:flutter/material.dart';
class pullDown extends StatelessWidget{
  final List<pullDownItem> items;
  final Function(String) onSelected;
  pullDown({required this.items,required this.onSelected});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton(
      icon: Icon(Icons.menu),
      onSelected: onSelected,
      itemBuilder:(BuildContext context){
        return items.map((item){
            return PopupMenuItem<String>(
              value:item.value,
              child: ListTile(
                title: Text(item.name),
              ),
            );
            
        }).toList();
      }
       );
  }
}
class pullDownItem{
  final String value;
  final String name;
  pullDownItem({required this.value,required this.name});
}