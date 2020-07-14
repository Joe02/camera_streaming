import 'package:camera_streaming/src/stores/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final page;
  final title;
  final hint;
  final icon;

  CustomTextField(this.page, this.title, this.hint, this.icon);
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    var _customTextFieldController = TextEditingController();

    switch (title) {
      case 'Email':
        {
          if (page == "Login") {
            _customTextFieldController = controller.loginEmailController;
          } else {
            _customTextFieldController = controller.registerEmailController;
          }
        }
        break;
      case 'Senha':
        {
          if (page == "Login") {
            _customTextFieldController = controller.loginPasswordController;
          } else {
            _customTextFieldController = controller.registerPasswordController ;
          }
        }
        break;
      case 'Confirmação de Senha':
        {
          _customTextFieldController = controller.registerPasswordConfirmationController;
        }
        break;
    }

    final textFieldHintStyle =
    TextStyle(color: Colors.grey, fontFamily: 'OpenSans', fontSize: 18);

    final fieldLabelStyle = TextStyle(
      color: Colors.grey[500],
      fontSize: 18,
      fontFamily: 'OpenSans',
    );

    final fieldBoxDecorationStyle = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0,
          offset: Offset(0, 2),
        ),
      ],
    );

    var textFieldPadding = MediaQuery.of(context).size.width / 15;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: textFieldPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: fieldLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: fieldBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              onChanged: (_) {
                _updateControllers(controller, _customTextFieldController);
              },
              controller: _customTextFieldController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 18,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  icon,
                  size: 30,
                  color: Colors.grey[600],
                ),
                hintText: hint,
                hintStyle: textFieldHintStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateControllers(controller, _customTextFieldController) {
    switch (title) {
      case 'Email':
        {
          if (page == "Login") {
            controller.loginEmailController = _customTextFieldController;
          } else {
            controller.registerEmailController = _customTextFieldController;
          }
        }
        break;
      case 'Senha':
        {
          if (page == "Login") {
            _customTextFieldController = controller.loginPasswordController;
          } else {
            controller.registerPasswordController = _customTextFieldController;
          }
        }
        break;
      case 'Confirmação de Senha':
        {
          controller.registerPasswordConfirmationController =
              _customTextFieldController;
        }
        break;
    }
  }
}