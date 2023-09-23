import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Email',
          'internet_exception':
              "We're unable to show results.\nPlease check yout data\nConnection",
          'general_exception':
              "We're unable to process your request.\nPlease try again ",
          'welcome_back': "Welcome\nBack",
          'login': "Login",
          'password_hint': "Password",
        },
        'ind_PK': {'email_hint': 'Masukkan email'}
      };
}
