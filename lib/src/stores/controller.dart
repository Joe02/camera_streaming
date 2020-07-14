import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class Controller with Store {

  @observable
  TextEditingController loginEmailController = TextEditingController();
  @observable
  TextEditingController loginPasswordController = TextEditingController();
  @observable
  TextEditingController registerEmailController = TextEditingController();
  @observable
  TextEditingController registerPasswordController = TextEditingController();
  @observable
  TextEditingController registerPasswordConfirmationController = TextEditingController();

}