import 'package:logger/logger.dart';

class LogHelper {
  static Logger logger = Logger();

  static void infoLog(infoMessage) {
    logger.i(infoMessage);
  }
}
