import 'package:flutter/material.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onBagPressed;

  ShopAppBar({this.title, this.onMenuPressed, this.onBagPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: title != null ? Text(title!, style: TextStyle(color: Colors.black)) : null,
      leading: Container(
        margin: const EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: onMenuPressed,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            onPressed: onBagPressed,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

