
class FormValidator {


  static String? validateEmail(String? email) {

    final RegExp emailRegex = RegExp('^[a-z0-9.-]+@gmail.com');

    email = email!.toLowerCase();

    if ( email.isEmpty) {
      return 'Campo obligatorio';
    }

    if(!emailRegex.hasMatch(email)) {
      return 'Ingrese un dato válido';
    }
    return null;
  }

  static String? validatePassword(String? password) {

    if(password == null) return null;
    return password.length < 7 ? 'Ingrese una contraseña válida' : null;
  }

  static String? validateName(String? name) {
    if ( name!.isEmpty) {
      return 'Campo obligatorio';
    }

    if(name.length < 2) {
      return 'Ingrese un dato válido';
    }
    return null;
  }

}