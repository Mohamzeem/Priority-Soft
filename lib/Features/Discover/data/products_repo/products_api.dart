import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Extensions/convert_to_string.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class ProductsApi {
  final fireStore = FirebaseFirestore.instance;
  final String formattedId = '';

//^ add product
  addProduct() async {
    await fireStore
        .collection('Products')
        .doc(formattedId.dateFormatToString())
        .set(
      {
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
            'comment': 'comment1',
            'rate': 4.5,
          },
          {
            'comment': 'comment2',
            'rate': 3.9,
          },
        ]
      },
    );
  }

//^ fetch products
  Future<List<ProductModel>> getProducts() async {
    final snapshots =
        await fireStore.collection(AppStrings.productsCollection).get();
    final data =
        snapshots.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    print(data.length);
    return data;
  }
}

/**
 
products (collection)
  - productId1 (document)
    - productName: "Product 1"
    - reviews (array)
      - 0 (map)
        - rate: 4
        - comment: "Good product"
      - 1 (map)
        - rate: 5
        - comment: "Excellent"
  - productId2 (document)
    - productName: "Product 2"
    - reviews (array)
      - 0 (map)
        - rate: 3
        - comment: "Not bad"


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductReviewsScreen extends StatelessWidget {
  final String productId;

  ProductReviewsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Reviews'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .doc(productId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var productData = snapshot.data as Map<String, dynamic>;
          var reviews = productData['reviews'] as List<dynamic>;

          return ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              var review = reviews[index] as Map<String, dynamic>;
              var rate = review['rate'] as int;
              var comment = review['comment'] as String;

              return ListTile(
                title: Text('Rating: $rate'),
                subtitle: Text('Comment: $comment'),
              );
            },
          );
        },
      ),
    );
  }
}


 */
