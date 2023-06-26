import 'package:flutter/material.dart';
import 'package:shop_firbase_app/data/model/category_model.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final CategoryModel data;
  final VoidCallback onCategoryTap;

  CategoryItem({
    Key? key,
    required this.data,
    required this.onCategoryTap,
  }) : super(key: key);

  List<Color> categoryColor = const [
    Color(0xffD3D5FE),
    Color(0xffFFEFDA),
    Color(0xffFFE4F1),
    Color(0xffCFE5FC),
    Color(0xffFFCECA),
    Color(0xffDAFFD6),
    Color(0xffD5BEFB),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: const Color.fromARGB(231, 228, 157, 76),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            
            onTap: onCategoryTap,
            child:  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(9.5),
                    ),
                    child: Image.network(
                      data.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ), ),
        ),
        const SizedBox(height: 8),
        Text(
          data.categoryName,
          maxLines: 2,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }
  
}
