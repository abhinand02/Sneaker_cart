import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';
import '../../Application/ProductDetails/product_details_bloc.dart';
import '../../Application/Category/category_bloc.dart';
import '../../Constants/colors.dart';
import '../../Constants/text.dart';
import '../Home Screen/product_details.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});

  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: categoryName),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state.productList == null) {
            return Center(
              child: Lottie.asset('assets/images/loading.json',
                  width: 100, fit: BoxFit.fill),
            );
          }
          if (state.productList!.docs.isEmpty) {
            return Center(
              child: Text(
                'List Empty',
                style: mediumText,
              ),
            );
          }
          return GridView.builder(
            itemBuilder: (context, index) {
              final data =
                  state.productList!.docs[index].data() as Map<String, dynamic>;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<ProductDetailsBloc>(context).add(
                      ChangeImage(index: 0, productname: data['product_name']));
                  BlocProvider.of<ProductDetailsBloc>(context)
                      .add(GetProductDetail(productname: data['product_name']));
                  BlocProvider.of<ProductDetailsBloc>(context).add(
                      ChangeImage(index: 0, productname: data['product_name']));
                  BlocProvider.of<ProductDetailsBloc>(context)
                      .add(GetProductDetail(productname: data['product_name']));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        category: data['category'],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(data['image'][0],
                            fit: BoxFit.fill, height: 150, width: 170,
                            errorBuilder: (context, error, stackTrace) {
                          return const Text('failed to load resource');
                        }),
                      ),
                      Text(
                        data['product_name'],
                        style: mediumText,
                      ),
                      Text(
                        '₹${data['actualPrice']}',
                        style: normalText,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: state.productList!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 4,
                crossAxisSpacing: 0),
          );
        },
      ),
    );
  }
}
