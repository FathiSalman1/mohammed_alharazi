import 'package:flutter/material.dart';
import 'package:mohammed_alharazi/controller/controller.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                controller.updateName(value);
              },
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              onChanged: (value) {
                controller.updatePrice(double.parse(value));
              },
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            Slider(
              min: 0,
              max: 100,
              value: controller.product.discount,
              onChanged: (value) {
                controller.updateDiscount(value);
              },
            ),
            Text('Discount: ${controller.product.discount.toStringAsFixed(2)}'),
            Row(
              children: [
                Checkbox(
                  value: controller.product.isChecked1,
                  onChanged: (value) {
                    controller.updateCheckbox1(value!);
                  },
                ),
                Text('Food'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: controller.product.isChecked2,
                  onChanged: (value) {
                    controller.updateCheckbox2(value!);
                  },
                ),
                Text('Clothes'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (controller.product.quantity > 0) {
                      controller.updateQuantity(controller.product.quantity - 1);
                    }
                  },
                ),
                Text('Quantity: ${controller.product.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    controller.updateQuantity(controller.product.quantity + 1);
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.saveCurrentProduct();
              },
              child: Text('Add to List'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  final double finalPrice = product.price - (product.price * (product.discount / 100));
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: $finalPrice'),
                        Text('Discount: ${product.discount}'),
                        Text('Food: ${product.isChecked1 ? "Yes" : "No"}'),
                        Text('Clothes: ${product.isChecked2 ? "Yes" : "No"}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Add your edit functionality here
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.removeProduct(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
