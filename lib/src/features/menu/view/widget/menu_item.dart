import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/src/features/menu/model/item.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.menuItemModel});

  final MenuItemModel menuItemModel;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int count = 0;

  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.menuItemModel.imagePath,
              ),
            ),
            Text(
              widget.menuItemModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            count <= 0
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                      onPressed: increaseCount,
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          (widget.menuItemModel.price.round().toString() +
                              ' руб'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: decreaseCount,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 30),
                              shape: const CircleBorder()),
                          child: const Text(
                            ('-'),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(13)),
                            child: Center(
                              child: Text(
                                count.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: increaseCount,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 30),
                              shape: const CircleBorder()),
                          child: const Text(
                            ('+'),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                )
          ],
        ),
      ),
    );
  }
}
