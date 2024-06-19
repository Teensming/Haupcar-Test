import 'package:flutter/material.dart';
import 'package:haupcartest/statemanagement/provider/Beauty_provider.dart';
import 'package:provider/provider.dart';

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductBeautyprovider>(context, listen: false);
    provider.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Consumer<ProductBeautyprovider>(
        builder: (context, provider, child) {
          if (provider.productBeautyList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.productBeautyList.length,
              itemBuilder: (context, index) {
                final product = provider.productBeautyList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(product.title ?? 'No Title'),
                    subtitle: Text(product.description ?? 'No Description'),
                    leading: Image.network(
                      product.thumbnail ?? '',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
