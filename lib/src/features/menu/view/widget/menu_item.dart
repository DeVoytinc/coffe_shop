import 'package:flutter/material.dart';
import 'package:coffe_shop/src/features/menu/model/item.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.menuItemModel});

  final MenuItemModel menuItemModel;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.menuItemModel.imagePath,
              ),
            ),
            Text(widget.menuItemModel.name),
            ElevatedButton(
              onPressed: () {},
              child:
                  Text(widget.menuItemModel.price.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
