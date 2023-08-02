import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/category_model.dart';
import '../../../../view_model/categoryries_view_model.dart';
import 'cotegory_item.dart';

class Cotegorys extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  const Cotegorys({required this.screenHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return StreamBuilder<List<CategoryModel>>(
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 110.h,
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(width: 26.w),
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
    );
  }

  @override
  double get maxExtent => throw UnimplementedError();

  @override
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
}
