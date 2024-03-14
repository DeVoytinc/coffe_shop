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
  final _categoryContainerHeight = 280.0;
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

  void _onNumberTap(int index){
    _scrollController.animateTo(index * _categoryContainerHeight, duration: const Duration(seconds: 1), curve: Curves.easeIn);

    setState(() {
      _currentScrollIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 36,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(13)),
                            color: index == _currentScrollIndex
                                ? AppColors.primary
                                : Colors.white),
                        child: Center(child: Text(menu[index].name),),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: menu.length,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: ((context, indexCategory) {
                  return Container(
                    height: _categoryContainerHeight,
                    child: Column(
                      children: [
                        Text(
                          menu[indexCategory].name,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: menu[indexCategory].items.length,
                            itemBuilder: (context, indexItem) {
                              return MenuItem(
                                menuItemModel:
                                    menu[indexCategory].items[indexItem],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
