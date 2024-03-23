import 'package:coffe_shop/src/features/menu/data/test_data.dart';
import 'package:coffe_shop/src/features/menu/view/widget/menu_item.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _menuController = ScrollController();
  final ScrollController _categoryController = ScrollController();
  List<GlobalKey> _keysForMenuCategories = [];
  List<GlobalKey> _keysForLinkCategories = [];
  int _currentCategoryIndex = 0;
  double _sumCategoryHeight = 0;

  @override
  void initState() {
    super.initState();
    _menuController.addListener(_menuScrollListener);
    _keysForMenuCategories = List.generate(menu.length, (index) => GlobalKey());
    _keysForLinkCategories = List.generate(menu.length, (index) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _sumCategoryHeight =
          _keysForMenuCategories[0].currentContext!.size!.height,
    );
  }

  void _menuScrollListener() {
    if (_menuController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        _menuController.offset > _sumCategoryHeight) {
      if (_currentCategoryIndex < menu.length - 1) {
        setState(() {
          _currentCategoryIndex++;
        });
        _sumCategoryHeight += _getActiveCategoryItemHeight();
      }
    } else if (_menuController.position.userScrollDirection ==
            ScrollDirection.forward &&
        _menuController.offset <
            _sumCategoryHeight - _getActiveCategoryItemHeight()) {
      if (_currentCategoryIndex > 0) {
        _sumCategoryHeight -= _getActiveCategoryItemHeight();
        setState(() {
          _currentCategoryIndex--;
        });
      }
    }
    _categoriesSrollTo(_currentCategoryIndex);
  }

  double _getActiveCategoryItemHeight() {
    return _keysForMenuCategories[_currentCategoryIndex]
        .currentContext!
        .size!
        .height;
  }

  void _onCategoryTap(int index) {
    setState(() {
      _currentCategoryIndex = index;
    });

    _sumCategoryHeight = 0;
    for (var i = 0; i <= index; i++) {
      _sumCategoryHeight +=
          _keysForMenuCategories[i].currentContext!.size!.height;
    }

    _menuScrollTo(index);
    _categoriesSrollTo(index);
  }

  void _menuScrollTo(int index) {
    Scrollable.ensureVisible(
      _keysForMenuCategories[index].currentContext!,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _categoriesSrollTo(int index) {
    Scrollable.ensureVisible(
      _keysForLinkCategories[index].currentContext!,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: Visibility(
          visible: true,
          child: FloatingActionButton(onPressed: () {}),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.separated(
                  controller: _categoryController,
                  scrollDirection: Axis.horizontal,
                  itemCount: menu.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 8,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    key: _keysForLinkCategories[index],
                    onTap: () => _onCategoryTap(index),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        color: index == _currentCategoryIndex
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
                                  color: index == _currentCategoryIndex
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    controller: _menuController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        menu.length,
                        (indexCategory) => Column(
                          key: _keysForMenuCategories[indexCategory],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menu[indexCategory].name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                mainAxisExtent: 210,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menu[indexCategory].items.length,
                              itemBuilder: (context, index) => MenuItem(
                                menuItemModel: menu[indexCategory].items[index],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
