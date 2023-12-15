import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';
import 'package:priority_soft/Features/Cart/data/cart_api.dart';
import 'package:priority_soft/Features/Cart/data/cart_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImpl repoImpl;

  CartCubit({required this.repoImpl}) : super(const CartInitialState());
  List<CartItemModel> list = [];
  dynamic totalPrice;
  Future<void> getCarts({bool isLoading = true}) async {
    if (isLoading) {
      emit(GetCartLoadingState());
    }
    final result = await repoImpl.getCarts();
    result.fold((failure) => emit(GetCartFailureState(failMsg: failure)),
        (carts) {
      list = carts;

      // var price = sumPrices(carts);
      // totalPrice = price;
      // print('LIST = $totalPrice');

      if (carts.isEmpty) {
        emit(const GetCartEmptyState(emptyMsg: 'No Products were found'));
        return;
      }
      emit(GetCartSuccessfullState(allCartlist: carts));
    });
  }

  Future<void> deleteGrowModel({required String id}) async {
    emit(const DeleteCartLoadingState());
    final result = await repoImpl.deleteCart(id: id);
    result.fold((failure) => emit(DeleteCartFailureState(errMsg: failure)),
        (unit) async {
      getCarts(isLoading: false);
      emit(const DeleteCartSuccessState());
    });
  }

//^ get total prices
  dynamic getTotalPrice() async {
    final result = await CartApi().getCarts();
    var tt = sumPrices(result);
    print('data = $tt');
    return tt;
    // emit(GetCartLoadingState());
    // final result = await repoImpl.getCarts();
    // result.fold((failure) => emit(GetCartFailureState(failMsg: failure)),
    //     (carts) {
    //   var tt = sumPrices(carts);
    //   print('data = ${tt}');
    //   emit(GetCartSuccessfullState(allCartlist: carts));
    // });
    // return tt;
  }

  double sumPrices(List<CartItemModel> cartItems) {
    return cartItems.fold(0.0, (sum, item) => sum + _parsePrice(item.price));
  }

  double _parsePrice(dynamic price) {
    if (price is num) {
      return price.toDouble();
    } else if (price is String) {
      return double.tryParse(price) ?? 0.0;
    } else {
      // Handle other cases as needed
      return 0.0;
    }
  }
}
