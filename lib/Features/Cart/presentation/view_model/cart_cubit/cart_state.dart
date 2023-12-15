part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {
  const CartInitialState();
}

final class GetCartLoadingState extends CartState {}

final class GetCartSuccessfullState extends CartState {
  final List<CartItemModel> allCartlist;
  const GetCartSuccessfullState({required this.allCartlist});
  @override
  List<Object> get props => [allCartlist];
}

final class GetCartFailureState extends CartState {
  final String failMsg;
  const GetCartFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class GetCartEmptyState extends CartState {
  final String emptyMsg;
  const GetCartEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}

//~ delete cart states
final class DeleteCartLoadingState extends CartState {
  const DeleteCartLoadingState();
}

final class DeleteCartSuccessState extends CartState {
  const DeleteCartSuccessState();
}

final class DeleteCartFailureState extends CartState {
  final String errMsg;
  const DeleteCartFailureState({required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
