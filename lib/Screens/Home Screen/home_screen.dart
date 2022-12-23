import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Application/ProductDetails/product_details_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/product_details.dart';
import '../../Constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.started());
    });
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final result = state.newArrival?.docs;
                if (result == null) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final data = result[index].data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
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
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['product_name'],
                                    style: mediumText,
                                  ),
                                  height10,
                                  Text(
                                    '₹${data['actualPrice']}',
                                    style: normalText,
                                  )
                                ],
                              ),
                              Image.network(
                                data['image'][0],
                                width: 150,
                                height: 120,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: result.length,
                  ),
                );
              },
            ),
          ],
        ),
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
      // print(state.productList)
      // DatabaseServic().getNewArrival();
      if (result == null) {
        return CircularProgressIndicator();
      }
      if (result.isEmpty) {
        return const Text('Something Went Wrong');
      }

      return Container(
        margin: const EdgeInsets.only(top: 10),
        height: width < 400 ? width * .6 : 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = (result[index].data() as Map<String, dynamic>);
            // print(data);
            // print((data?.docs[0].data() as Map<String, dynamic>)['product_name']);
            return GestureDetector(
              onTap: () {
                BlocProvider.of<ProductDetailsBloc>(context).add(
                    ChangeImage(index: 0, productname: data['product_name']));
                BlocProvider.of<ProductDetailsBloc>(context)
                    .add(GetProductDetail(productname: data['product_name']));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                          category: data['category'],
                        )));
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: const EdgeInsets.only(left: 5, bottom: 5),
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
                      child: Image.network(
                        data['image'][0],
                        fit: BoxFit.contain,
                        height: 150,
                        // width: 170,
                      ),
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
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
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
        icon: const Icon(Icons.menu));
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
    actions: [
      Transform.scale(
        scale: .7,
        child: CircleAvatar(
          backgroundColor: whiteColor,
          radius: 28,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      )
    ],
    elevation: 0,
  );
}
