import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/product_by_category/productByCategory.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/category_title.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/cotegory_item.dart';
import 'package:shop_firbase_app/ui/tab_box/home_page/widgets/products_grid_widget.dart';
import 'package:shop_firbase_app/view_model/categoryries_view_model.dart';
import 'package:shop_firbase_app/view_model/product_view_model.dart';

import '../../../utils/app_image.dart';
import '../../../utils/const.dart';
import 'discount_widget/discaunt_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var counts = context.read<ProductViewModel>().products.length;
    print(
        "***************************************---------------------***********************");
    print(counts);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100, width: 190),
        ),
        actions: const [
          Icon(Icons.search_rounded, color: Colors.orange),
        ],
        leading: const Icon(Icons.menu, color: Colors.orange),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          SliverPersistentHeader(
              delegate: DiscountWidget(screenHeight: height(context))),
          SliverPersistentHeader(
              delegate: CategoryTitleWidget(
                  screenHeight: height(context),
                  screenWidth: width(context),
                  title: """\nCategories\n""".tr())),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.transparent,
              height: 120.0,
              child: Center(
                child: StreamBuilder<List<CategoryModel>>(
                  stream:
                      Provider.of<CategoriesViewModel>(context, listen: false)
                          .listenCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = snapshot.data!;
                      return Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        color: Colors.transparent,
                        height: 95,
                        width: double.infinity,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              onCategoryTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ProductByCategory(
                                            data: categories[index])));
                              },
                              data: categories[index],
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: CategoryTitleWidget(
              screenHeight: height(context),
              screenWidth: width(context),
              title: 'Products'.tr(),
            ),
          ),
          const ProductsGridWidget(),
        ],
      ),
    );
  }
}
