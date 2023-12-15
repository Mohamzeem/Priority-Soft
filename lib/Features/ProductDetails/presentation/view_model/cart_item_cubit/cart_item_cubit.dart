import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/Extensions/convert_to_string.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_repo_impl.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final CartItemRepoImpl repoImpl;
  CartItemCubit({required this.repoImpl}) : super(const CartItemInitialState());
  final String formattedId = '';
  Future<void> addItemToCart({
    required String title,
    required dynamic price,
    required String photo,
    required String mark,
    required String color,
    required String size,
    required int number,
  }) async {
    emit(AddCartItemLoadingState());
    final result = await repoImpl.addItemToCart(
        title: title,
        price: price,
        createdAt: formattedId.dateFormatToString(),
        id: formattedId.dateFormatToString(),
        photo: photo,
        mark: mark,
        color: color,
        size: size,
        number: number);
    result.fold((failure) => emit(AddCartItemFailureState(errMsg: failure)),
        (unit) => emit(const AddCartItemSuccessState()));
  }
}
