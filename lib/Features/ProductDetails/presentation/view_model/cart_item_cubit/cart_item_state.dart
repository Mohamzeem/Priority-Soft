part of 'cart_item_cubit.dart';

sealed class CartItemState extends Equatable {
  const CartItemState();
  @override
  List<Object> get props => [];
}

final class CartItemInitialState extends CartItemState {
  const CartItemInitialState();
}

//^ add item to cart
final class AddCartItemLoadingState extends CartItemState {}

final class AddCartItemSuccessState extends CartItemState {
  const AddCartItemSuccessState();
}

final class AddCartItemFailureState extends CartItemState {
  final String errMsg;
  const AddCartItemFailureState({required this.errMsg});
  @override
  List<Object> get props => [];
}
