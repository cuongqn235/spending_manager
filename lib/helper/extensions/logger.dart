import 'package:logger/logger.dart';

void logD(dynamic message) {
  final logger = Logger();
  logger.d(message);
}

void logV(dynamic message) {
  final logger = Logger();
  logger.v(message);
}

void logI(dynamic message) {
  final logger = Logger();
  logger.i(message);
}

void logW(dynamic message) {
  final logger = Logger();
  logger.w(message);
}

void logE(dynamic message) {
  final logger = Logger();
  logger.e(message);
}

void logWTF(dynamic message) {
  final logger = Logger();
  logger.wtf(message);
}
