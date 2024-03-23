import 'package:coffe_shop/generated/l10n.dart';
import 'package:flutter/material.dart';

class ShopCart extends StatelessWidget {
  const ShopCart({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)],
    ),
    child: FractionallySizedBox(
      heightFactor: 0.91,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey.shade400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).yourOrder,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_outlined),
                  ),
                ],
              ),
            ),
            Container(
                width: double.maxFinite,
                height: 2,
                color: Colors.grey.shade300),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/coffee.png',
                      width: 55,
                      height: 55,
                    ),
                  ),
                  Text('Олеато'),
                  Spacer(),
                  Text('139 р')
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
