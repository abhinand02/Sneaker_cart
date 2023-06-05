import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Application/ProductDetails/product_details_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/product_details.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/search_screen.dart';
import '../../Constants/colors.dart';
import '../../Services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.started());
    });
    return Scaffold(
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          final result = state.newArrival?.docs;
          if (result == null) {
            return Center(
              child: Lottie.asset('assets/images/loading.json',
                  width: 100, fit: BoxFit.fill),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SearchBar(),
                height20,
                Text(
                  'Popular Shoes',
                  style: mediumText,
                ),
                const HomeHorizontalListView(),
                Row(
                  children: [
                    Text(
                      'New Arrivals',
                      style: mediumText,
                    ),
                  ],
                ),
                ListView.builder(    
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = result[index].data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        DatabaseServic().getOrders();
                        BlocProvider.of<ProductDetailsBloc>(context)
                            .add(IsFav(
                          prodctName: data['product_name'],
                        ));
                        BlocProvider.of<ProductDetailsBloc>(context).add(
                            ChangeImage(
                                index: 0, productname: data['product_name']));
                        BlocProvider.of<ProductDetailsBloc>(context).add(
                            GetProductDetail(
                                productname: data['product_name']));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              category: data['category'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width / 2,
                                  child: Text(
                                    data['product_name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: normalText,
                                  ),
                                ),
                                height10,
                                Text(
                                  '₹${data['actualPrice']}',
                                  style: normalText,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                              height: 120,
                              child: Image.network(
                                data['image'][0],
                                width: 150,
                                height: 120,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                      'failed to load resource');
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Lottie.asset(
                                        'assets/images/simple-lazy-load.json',
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 110,
                                      ),
                                    ),
                                    //     CircularProgressIndicator(
                                    //   value: loadingProgress.expectedTotalBytes !=
                                    //           null
                                    //       ? loadingProgress
                                    //               .cumulativeBytesLoaded /
                                    //           loadingProgress.expectedTotalBytes!
                                    //       : null,
                                    // ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: result.length,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class HomeHorizontalListView extends StatelessWidget {
  const HomeHorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      final result = state.productList?.docs;
      if (result == null) {
        return Center(child: Container());
      }
      if (result.isEmpty) {
        return const Text('Something Went Wrong');
      }

      return Container(
        margin: const EdgeInsets.only(top: 10),
        height: width < 400 ? width * .6 : 230,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = (result[index].data() as Map<String, dynamic>);
            // print(data);
            // print((data?.docs[0].data() as Map<String, dynamic>)['product_name']);
            return GestureDetector(
              onTap: () {
                BlocProvider.of<ProductDetailsBloc>(context)
                    .add(const IsSizeSelected(newIndex: null));
                BlocProvider.of<ProductDetailsBloc>(context).add(IsFav(
                  prodctName: data['product_name'],
                ));
                BlocProvider.of<ProductDetailsBloc>(context).add(
                  ChangeImage(index: 0, productname: data['product_name']),
                );
                BlocProvider.of<ProductDetailsBloc>(context).add(
                  GetProductDetail(productname: data['product_name']),
                );
                BlocProvider.of<ProductDetailsBloc>(context)
                    .add(const ShowMoreButton(showMore: false));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      category: data['category'],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 234, 246),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        data['image'][0],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('failed to load resource');
                        },
                        height: 150,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child:
                                //  Lottie.asset('assets/images/simple-lazy-load.json'),
                                CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        // width: 170,
                      ),
                    ),
                    Text(
                      data['product_name'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
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
          itemCount: result.length,
        ),
      );
    });
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        goToSearch(context);
      },
      onChanged: (value) {
        BlocProvider.of<HomeBloc>(context).add(
          searchResult(searchKey: value),
        );
      },
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        prefixIcon: Icon(
          Iconsax.search_normal,
          color: Colors.grey.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        hintText: 'Looking for shoes',
        hintStyle: smallGreyText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: whiteColor),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(
          Iconsax.menu,
          color: blackColor,
        ));
  }
}

AppBar appBar() {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    leading: Transform.scale(
      scale: .7,
      child:
          CircleAvatar(backgroundColor: whiteColor, child: const MenuWidget()),
    ),
    elevation: 0,
  );
}

goToSearch(context) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SearchScreen(),
    ),
  );
}
