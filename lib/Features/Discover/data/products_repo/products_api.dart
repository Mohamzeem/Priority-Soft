import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Extensions/convert_to_string.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class ProductsApi {
  final fireStore = FirebaseFirestore.instance;
  final String formattedId = '';

//^ fetch products
  Future<List<ProductModel>> getProducts() async {
    final snapshots =
        await fireStore.collection(AppStrings.productsCollection).get();
    final data =
        snapshots.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    // print(data[0].colors[2].color);
    //print(data[1].reviewss[2].rate);
    return data;
  }

  //^ filter products by mark or category
  Future<List<ProductModel>> searchProductsByMark(
      {required String mark}) async {
    final snapshots = await fireStore
        .collection(AppStrings.productsCollection)
        .where('mark', isEqualTo: mark)
        .get();
    final data =
        snapshots.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    // print('Listlength= $data.length');
    // print(data[1].title);
    return data;
  }

  //^ add product
  addProduct() async {
    await fireStore
        .collection('Products')
        .doc(formattedId.dateFormatToString())
        .update(
      {
        'colors': ['0xFFFFFFFF', '0xffFF4C5E', '0xFF0EEC51', '0xff101010'],
        'sizes': ['39.0', '39.5', '40.0', '40.5', '41.0'],
        'id': formattedId.dateFormatToString(),
        'description':
            'Engineered to crush any movement-based workout, these On sneakers enhance the label\'s original Cloud sneaker with cutting edge technologies for a pair',
        'title': 'Nike 2 Retro High Tie Dye',
        'photo':
            'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/image%209.png?alt=media&token=6c691e7f-27d2-4ab4-a3d0-3443af3c132e',
        'mark': 'Nike',
        'markPhoto':
            'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/nike.png?alt=media&token=8b52d752-82b6-4ace-9194-b7bef624adf0',
        'price': 780,
        'reviewss': [
          {
            'name': 'Nolan Carder',
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name1.png?alt=media&token=8d5a878d-2e1d-4961-801d-97d8d93dea5a',
            'comment':
                'Perfect for keeping your feet dry and warm in damp conditions. ',
            'rate': 4.5,
            'createdAt': '',
          },
          {
            'name': 'Maria Saris',
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name2.png?alt=media&token=a0bf6408-3abb-4940-9ed6-787b667bf190',
            'comment':
                'Perfect for keeping your feet dry and warm in damp conditions. ',
            'rate': 3.2,
            'createdAt': '',
          },
          {
            'name': 'Gretchen Septimus',
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name3.png?alt=media&token=ee4df4ed-f33e-4774-a7f7-ca009183892b',
            'comment':
                'Perfect for keeping your feet dry and warm in damp conditions. ',
            'rate': 3.0,
            'createdAt': '',
          },
          {
            'name': 'Roger Stanton',
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name4.png?alt=media&token=7397979f-df9b-4f00-a376-4e8df95f8cf0',
            'comment':
                'Perfect for keeping your feet dry and warm in damp conditions. ',
            'rate': 4.0,
            'createdAt': '',
          },
          {
            'name': 'Hanna Levin',
            'photo':
                'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name5.png?alt=media&token=e684851a-aa28-4d27-b5f1-cd35c4c60abd',
            'comment':
                'Perfect for keeping your feet dry and warm in damp conditions. ',
            'rate': 2.5,
            'createdAt': '',
          },
        ]
      },
    );
  }
}
