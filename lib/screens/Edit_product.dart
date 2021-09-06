import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/providers/products_provider.dart';

class EditProduct extends StatefulWidget {
  static final routeName = '/editProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  bool isFirst = true;
  var args;
  var product;

  //add and update function
  void _save(context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    try {
      if (product != null) {
        Provider.of<ProductsProvider>(context, listen: false).updateProduct(
          product.id,
          _titleController.text.trim(),
          double.parse(_priceController.text.trim()),
          _descController.text.trim(),
          _imageUrlController.text.trim(),
        );
      } else {
        Provider.of<ProductsProvider>(context, listen: false).addProduct(
          _titleController.text.trim(),
          double.parse(_priceController.text.trim()),
          _descController.text.trim(),
          _imageUrlController.text.trim(),
        );
      }
      Provider.of<ProductsProvider>(context, listen: false).getProducts();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirst) {
      args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        product = Provider.of<ProductsProvider>(context, listen: false)
            .findProductById(args['id']);
        _titleController.text = product.title;
        _priceController.text = product.price.toString();
        _descController.text = product.description;
        _imageUrlController.text = product.imageUrl;
      }
      isFirst = false;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => _save(context),
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  toolbarOptions: ToolbarOptions(
                      copy: true, cut: true, selectAll: true, paste: true),
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: Colors.grey)),
                  onSaved: (String? val) {},
                  validator: (String? val) {
                    if (val!.isEmpty) return 'Enter title';
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  toolbarOptions: ToolbarOptions(
                      copy: true, cut: true, selectAll: true, paste: true),
                  decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(color: Colors.grey)),
                  onSaved: (String? val) {},
                  validator: (String? val) {
                    if (val!.isEmpty) return 'Enter price';
                  },
                ),
                TextFormField(
                  controller: _descController,
                  toolbarOptions: ToolbarOptions(
                      copy: true, cut: true, selectAll: true, paste: true),
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.grey)),
                  maxLines: 3,
                  onSaved: (String? val) {},
                  validator: (String? val) {
                    if (val!.isEmpty) return 'Enter descriptin';
                  },
                ),
                TextFormField(
                  controller: _imageUrlController,
                  toolbarOptions: ToolbarOptions(
                      copy: true, cut: true, selectAll: true, paste: true),
                  decoration: InputDecoration(
                      labelText: 'ImageUrl',
                      labelStyle: TextStyle(color: Colors.grey)),
                  maxLines: 3,
                  onSaved: (String? val) {},
                  validator: (String? val) {
                    if (val!.isEmpty) return 'Enter image url';
                    // if (!val.startsWith('http') && !val.startsWith('https'))
                    //   return 'Enter a valid url';
                    // if (!val.endsWith('.png') &&
                    //     !val.endsWith('.jpg') &&
                    //     !val.endsWith('.jpeg')) return 'Enter a valid image';
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
