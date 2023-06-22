import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';
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
    print("***************************************---------------------***********************");
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
          Icon(
            Icons.search_rounded,
            color: Colors.orange,
          ),
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.orange,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
                 SliverPersistentHeader(
            delegate: DiscountWidget(screenHeight: height(context))),
          SliverPersistentHeader(
            delegate: CategoryTitleWidget(
              screenHeight: height(context),
              screenWidth: width(context),
              title: """

Categories

"""
                  .tr(),
            ),
          ),
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
                              onCategoryTap: () {},
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
          ),const ProductsGridWidget(),
        ],
      ),
    );
  }
}
/* Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 10),
            child: Text("Categorys",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 200,
            child: StreamBuilder<List<CategoryModel>>(
              stream: Provider.of<CategoriesViewModel>(context, listen: false)
                  .listenCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  List<CategoryModel> categories = snapshot.data!;
                  return ListView(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                                // BlocProvider.of<CategoriesBloc>(context).add(MakeSkillsUnselected());
                                //   Navigator.pushNamed(context, categorySkills,
                                //  arguments: state.categories[index]);
                              },
                              data: categories[index],
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Product",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Expanded(
            child: Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: ScrollPhysics(),
                  itemCount: productViewModel.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var products = productViewModel.products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InfoPage(
                              getData: products,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.8,
                              color: const Color.fromARGB(255, 232, 220, 185)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: '${products.productImages[0]}',
                                width: 120.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    period: const Duration(seconds: 2),
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: 120,
                                      height: 100,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons
                                        .signal_cellular_connected_no_internet_0_bar_outlined),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                              width: 30,
                            ),
                            Text(products.productName),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Price: ".tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      TextSpan(
                                        text:
                                            '${products.price} ${products.currency}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                color: Colors.amber,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    {
                                      OrderModel orderModel = OrderModel(
                                          orderId: products.categoryId,
                                          productId: products.productId,
                                          count: 1,
                                          totalPrice: products.price,
                                          createdAt: DateTime.now().toString(),
                                          userId: "",
                                          orderStatus:
                                              products.price.toString(),
                                          productName: products.productName);

                                      Provider.of<OrdersViewModel>(context,
                                              listen: false)
                                          .addOrder(orderModel);
                                    }
                                  },
                                  child: Container(
                                    height: 27,
                                    width: 60,
                                    // ignore: prefer_const_constructors
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: const Color.fromARGB(
                                            255, 247, 233, 191),
                                      ),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),*/