import 'package:coffe_shop/src/features/menu/model/item.dart';

class Category {
  final String name;
  final List<MenuItemModel> items;

  const Category({required this.name, required this.items});
}
