// These are messages to show users when an error or an update occurs
//
class Lang {
  // Default
  static const String errorTitleDefault = 'Algo salió mal';
  static const String errorTextDefault = 'Por favor, intenta mas tarde';

  // API
  static const String errorTextAPI = 'Error en el servidor';

  // Connection
  static const String errorTitleConnection = 'Error de conexion';
  static const String errorTextConnction = 'Verifica tu conexión a internet';

  // Register
  static const String successTextRegister =
      'Tu cuenta ha sido creada exitosamente';
  static const String errorTextRegisterPassword =
      'Las contraseñas no coinciden';

  // Login
  static const String googleNullError =
      'No se pudo obtener la información de tu cuenta';

  // Settings
  static const String successTextSettings =
      'Información actualizada exitosamente';

  // Comments
  static const String reviewError = 'Por favor, agrega un comentario';
  static const String reviewSuccess = 'Gracias por tu comentario';
  static const String reviewSpam = 'Ya has enviado un comentario recientemente';

  // Game
  static const String gameNull = 'El nivel no cargó correctamente';
}
