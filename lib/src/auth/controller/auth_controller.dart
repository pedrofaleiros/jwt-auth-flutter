import 'package:authentication/src/auth/model/auth_exception.dart';
import 'package:authentication/src/auth/model/user_model.dart';
import 'package:authentication/src/auth/model/auth_request_model.dart';
import 'package:authentication/src/auth/viewmodel/auth_viewmodel.dart';
import 'package:authentication/src/auth/viewmodel/interface/auth_viewmodel_interface.dart';
import 'package:flutter/material.dart';

enum FormType { login, signup }

class AuthController with ChangeNotifier {
  AuthViewModelInterface viewmodel = AuthViewModel();

  AuthRequestModel authRequest = AuthRequestModel(email: '', password: '');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  UserModel? _globalUser;
  UserModel? get user => _globalUser;
  
  String? get userToken => _globalUser == null ? null : _globalUser!.token;

  bool get isAuthenticated => _globalUser != null;

  String? errorText;

  bool isLoading = false;

  FormType _formType = FormType.login;
  FormType get formType => _formType;
  set formType(FormType value) {
    _formType = value;
    errorText = null;
    notifyListeners();
  }

  final FocusNode _passwordFocus = FocusNode();
  FocusNode get passwordFocus => _passwordFocus;

  final FocusNode _emailFocus = FocusNode();
  FocusNode get emailFocus => _emailFocus;

  Future<void> signup() async {
    isLoading = true;
    errorText = null;
    notifyListeners();

    try {
      verify();

      SignupRequestModel signupRequest = SignupRequestModel(
        name: nameController.text,
        email: authRequest.email,
        password: authRequest.password,
      );

      final data = await viewmodel.signup(signupRequest);

      nameController.text = '';
      passwordController.text = '';
      emailController.text = '';
      authRequest = authRequest.copyWith(password: '', email: '');
      formType = FormType.login;

    } catch (e) {
      errorText = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> login() async {
    isLoading = true;
    errorText = null;
    notifyListeners();

    authRequest = authRequest.copyWith(
        email: authRequest.email.replaceAll(' ', ''),
        password: authRequest.password.replaceAll(' ', ''));

    try {
      verify();

      final data = await viewmodel.login(authRequest);

      UserModel user = UserModel.fromMap(data);

      if (await viewmodel.setUser(user)) {
        _globalUser = user;
        emailController.text = '';
        passwordController.text = '';
        authRequest = AuthRequestModel(email: '', password: '');
      }
    } catch (e) {
      errorText = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    UserModel? user = await viewmodel.getUser();

    if (user != null) {
      _globalUser = user;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final removed = await viewmodel.removeUser();

    if (removed) {
      _globalUser = null;
      notifyListeners();
    }
  }

  void verify() {
    if (formType == FormType.signup) {
      if (nameController.text == '') {
        throw AuthException('Preencha todos os campos');
      }
    }

    if (authRequest.email == '' || authRequest.password == '') {
      throw AuthException('Preencha todos os campos');
    }
  }
}

// await Future.delayed(const Duration(seconds: 2));
