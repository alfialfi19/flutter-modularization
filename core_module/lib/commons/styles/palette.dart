import 'dart:ui';

extension HexColorExtension on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

/// This is class for defined global color palette
class Palette {
  // Twitter Color
  static const Color finnHubPrimary = Color(0xFF56B143);
  static const Color finnHubSecondary = Color(0xFF389B4E);
  static const Color finnHubBackground = Color(0xFFF3F3F3);
  static const Color finnHubBackgroundDark = Color(0xFF222222);

  // Black
  static const Color black = Color(0xFF000000);
  static const Color blackLighten1 = Color(0xFF202945);

  // White
  static const Color white = Color(0xFFFFFFFF);

  // Grey
  static const Color grey = Color(0xFF2F3C65);
  static const Color greyDarken1 = Color(0xFF767575);
  static const Color greyLighten1 = Color(0xFF989898);
  static const Color greyLighten2 = Color(0xFFACACAC);

  // Green
  static const Color green = Color(0xFF00FF00);
  static const Color greenLighten1 = Color(0xFF56E395);

  // Transparent
  static const Color transparent = Color(0x000000FF);
}
