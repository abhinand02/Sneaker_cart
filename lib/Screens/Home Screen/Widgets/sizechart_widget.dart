import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Application/ProductDetails/product_details_bloc.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text.dart';

class SizeChartWidget extends StatelessWidget {
  const SizeChartWidget({
    super.key,
    required this.selectedIndex,
    required this.index,
  });

  final int? selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text((index + 6).toString()),
      labelStyle: normalText,
      selected: selectedIndex == -1 ? false : selectedIndex == index,
      selectedColor: mainColor,
      showCheckmark: false,
      elevation: 8,
      onSelected: (val) {
        BlocProvider.of<ProductDetailsBloc>(context)
            .add(IsSizeSelected(newIndex: index));
      },
    );
  }
}