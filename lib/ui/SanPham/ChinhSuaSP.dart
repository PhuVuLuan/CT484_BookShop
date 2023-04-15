import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/SanPham.dart';
import '../shared/HopThoai.dart';
import 'QuanLySP.dart';

class EditSanPham extends StatefulWidget {
  static const routeName = '/edit-sanpham';
  EditSanPham(
    SanPham? sanpham, {
    super.key,
  }) {
    if (sanpham == null) {
      this.sanpham = SanPham(
        id: null,
        imgUrl: '',
        name: '',
        author: '',
        category: '',
        nxb: '',
        price: 0,
        description: '',
      );
    } else {
      this.sanpham = sanpham;
    }
  }
  late final SanPham sanpham;
  @override
  State<EditSanPham> createState() => _EditSanPhamState();
}

class _EditSanPhamState extends State<EditSanPham> {
  final _imgUrlController = TextEditingController();
  final _imgUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late SanPham _editedSP;
  var _isLoading = false;

  bool _isValidImgUrl(String value) {
    return (value.startsWith('http') || value.startsWith('http')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imgUrlFocusNode.addListener(() {
      if (!_imgUrlFocusNode.hasFocus) {
        if (!_isValidImgUrl(_imgUrlController.text)) {
          return;
        }
        // Ảnh hợp lệ -> Vẽ lại màn hình để hiện preview
        setState(() {});
      }
    });
    _editedSP = widget.sanpham;
    _imgUrlController.text = _editedSP.imgUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imgUrlController.dispose();
    _imgUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final quanlySP = context.read<QuanLySP>();
      if (_editedSP.id != null) {
        quanlySP.updateSanPham(_editedSP);
      } else {
        quanlySP.addSanPham(_editedSP);
      }
    } catch (error) {
      await loiHT(context, 'something went wrong,');
    }
    setState(() {
      _isLoading = false;
    });
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa Sản Phẩm'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildNameField(),
                    buildAuthorField(),
                    buildCategoryField(),
                    buildNXBField(),
                    buildPriceField(),
                    buildDescriptionField(),
                    buildProductPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedSP.name,
      decoration: const InputDecoration(labelText: 'Tên'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(name: value);
      },
    );
  }

  TextFormField buildAuthorField() {
    return TextFormField(
      initialValue: _editedSP.author,
      decoration: const InputDecoration(labelText: 'Tác giả'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(author: value);
      },
    );
  }

  TextFormField buildCategoryField() {
    return TextFormField(
      initialValue: _editedSP.category,
      decoration: const InputDecoration(labelText: 'Thể loại'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(category: value);
      },
    );
  }

  TextFormField buildNXBField() {
    return TextFormField(
      initialValue: _editedSP.nxb,
      decoration: const InputDecoration(labelText: 'NXB'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(nxb: value);
      },
    );
  }

  TextFormField buildPriceField() {
    return TextFormField(
      initialValue: _editedSP.price.toString(),
      decoration: const InputDecoration(labelText: 'Giá'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a price.';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid number.';
        }
        if (double.parse(value) <= 0) {
          return 'Please enter a number greater than zero.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(price: double.parse(value!));
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedSP.description,
      decoration: const InputDecoration(labelText: 'Tóm tắt'),
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a description.';
        }
        if (value.length < 10) {
          return 'Should be at least 10 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(description: value);
      },
    );
  }

  Widget buildProductPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imgUrlController.text.isEmpty
              ? const Text('Nhập vào URL')
              : FittedBox(
                  child: Image.network(
                    _imgUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(child: buildImgURLField()),
      ],
    );
  }

  TextFormField buildImgURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Image URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imgUrlController,
      focusNode: _imgUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL.';
        }
        if (!_isValidImgUrl(value)) {
          return 'Please enter a valid image URL.';
        }
        return null;
      },
      onSaved: (value) {
        _editedSP = _editedSP.copyWith(imgUrl: value);
      },
    );
  }
}
