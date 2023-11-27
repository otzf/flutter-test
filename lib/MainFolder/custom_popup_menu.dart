import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<CustomPopupMenuItem> items;
  final Function(String) onItemSelected;

  
  CustomPopupMenuButton({required this.items, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu),
      onSelected: onItemSelected,
      itemBuilder: (BuildContext context) { //用来当作构建方法的参数返回items
        return items.map((item) {  
          return PopupMenuItem<String>(
            value: item.value,
            child: ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
            ),
          );
        }).toList();
      },
    );
  }
}

class CustomPopupMenuItem {
  final String value;
  final IconData icon;
  final String title;

  CustomPopupMenuItem({required this.value, required this.icon, required this.title});
}
