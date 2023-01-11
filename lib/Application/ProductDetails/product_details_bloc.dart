import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaker_cart/Services/database.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState.initial()) {
    on<GetProductDetail>((event, emit) async {
      final data = await DatabaseServic().getProduct(event.productname);
      // print("hail $data");
      emit(state.copyWith(productdetails: data.data() as Map<String, dynamic>));
    });

    on<ChangeImage>((event, emit) async {
      final data = await DatabaseServic().getProduct(event.productname);
      final result = (data.data() as Map<String, dynamic>)['image'];
      emit(state.copyWith(img: result[event.index]));
    });

    on<ShowMoreButton>((event, emit) {
      emit(state.copyWith(showMoreButton: event.showMore));
    });

    on<IsFav>((event, emit) async {
      final data = await DatabaseServic().getFavData(prodctName: event.prodctName);
      // print(data);
      emit(state.copyWith(isFavorited: data));
    },);

    on<FavProduct>((event, emit) async{
      DatabaseServic dataBaseRef = DatabaseServic();
      final data = await DatabaseServic().getNewArrival(collectionObject: dataBaseRef.favCollection, condition: dataBaseRef.currentUser!.uid, field: 'user_id');
     emit(state.copyWith(favProducts: data.docs));
    });
  }
}
