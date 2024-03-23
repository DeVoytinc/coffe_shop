import 'package:coffe_shop/src/features/menu/model/category.dart';
import 'package:coffe_shop/src/features/menu/model/item.dart';

List<String> categoriesname = [
  'Черный кофе',
  'Кофе с молоком',
  'Чай',
  'Авторские напитки',
];


List<Category> menu = List.generate(
  categoriesname.length,
  (index) => Category(
    name: categoriesname[index],
    items: List.generate(
      2,
      (index) => const MenuItemModel(
          name: 'Олеато', imagePath: 'assets/images/coffee.png', price: 139),
    ),
  ),
);
