// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

Future<bool> sendEmailJS({
  required String name,
  required String email,
  required String phone,
  required String message,
}) async {
  try {
    final now = DateTime.now();
    final submitted = '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}';
    final result = await js.context['emailjs'].callMethod('send', [
      'EMAILJS_SERVICE_ID_PLACEHOLDER',
      'EMAILJS_TEMPLATE_ID_PLACEHOLDER',
      js.JsObject.jsify({
        'name': name,
        'email': email,
        'phone': phone.isEmpty ? 'Not provided' : phone,
        'message': message,
        'submitted_at': submitted,
        'source': 'oneview.world',
      }),
    ]);
    return (result['status'] as int) == 200;
  } catch (_) {
    return false;
  }
}
