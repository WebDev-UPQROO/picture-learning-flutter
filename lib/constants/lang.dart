// These are messages to show users when an error or an update occurs
//
class Lang {
  // Default error
  static const String errorDefault = 'Por favor, intenta mas tarde';

  // Internet error
  static const String errorConnction = 'Verifica tu conexión a internet';

  // API error
  static const String errorAPI500 =
      'Error en el servidor, no se cargo la informción';

  // Login error
  static const String errorLogin400 = 'Usuario y contraseña obligatorios';
  static const String errorLogin401 = 'Usuario o contraseña incorrectos';

  // Register success
  static const String successRegister = 'Tu cuenta ha sido creada exitosamente';
  static const String errorRegisterPassword = 'Las contraseñas no coinciden';

  // Register errors
  static const String errorRegister400 =
      'No se pudo crear el usuario, intenta con otro correo o username';
  static const String errorGoogleOAuth400 =
      'No se pudo obtener la información de tu cuenta';
  static const String errorGoogleOAuth401 =
      'Tu cuenta de google esta inactiva, ingresa con otra cuenta';

  // Settings success
  static const String successSettings = 'Información actualizada exitosamente';

  // Password error
  static const String errorPassword500 = 'No se pudo actuallizar la contraseña';

  // Comments success
  static const String reviewError = 'Por favor, agrega un comentario';
  static const String reviewSuccess = 'Gracias por tu comentario';

  // Comments errors
  static const String reviewSpam = 'Ya has enviado un comentario recientemente';

  // Game error
  static const String errorGameNull = 'El nivel no cargó correctamente';
}
