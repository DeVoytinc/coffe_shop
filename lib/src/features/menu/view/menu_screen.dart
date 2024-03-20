import 'package:coffe_shop/src/features/menu/data/test_data.dart';
import 'package:coffe_shop/src/features/menu/view/widget/menu_item.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _categoryContainerHeight = 270.0;
  final ScrollController _scrollController = ScrollController();
  int _currentScrollIndex = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_updateScrollIndicator);
  }

  void _updateScrollIndicator() {
    setState(() {
      _currentScrollIndex =
          _scrollController.offset ~/ _categoryContainerHeight;
    });
  }

  void _onNumberTap(int index) {
    _scrollController.animateTo(
      index * _categoryContainerHeight,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menu.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => _onNumberTap(index),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          color: index == _currentScrollIndex
                              ? AppColors.primary
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              menu[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: index == _currentScrollIndex
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: menu.length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, indexCategory) => SizedBox(
                    height: _categoryContainerHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu[indexCategory].name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: menu[indexCategory].items.length,
                            itemBuilder: (context, indexItem) => MenuItem(
                              menuItemModel:
                                  menu[indexCategory].items[indexItem],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
