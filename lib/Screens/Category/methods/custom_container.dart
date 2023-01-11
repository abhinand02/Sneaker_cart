import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Screens/Category/category_view.dart';
import '../../../Application/Category/category_bloc.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text.dart';

GestureDetector categoryGridViewContainer({required String img,required categoryName, required BuildContext context}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  CategoryView(categoryName: categoryName,)));
        BlocProvider.of<CategoryBloc>(context).add(GetProductByCategory(categoryName: categoryName));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        padding: const EdgeInsets.only(left: 15, bottom: 5),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(25),
        ),
        // width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Transform.rotate(
                angle: -pi/8.4,
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                  height: 110,
                  width: 130,
                ),
              ),
            ),
            Text(
              categoryName,
              style: mediumText,
            ),
          ],
        ),
      ),
    );
  }