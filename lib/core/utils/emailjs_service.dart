import 'dart:js_interop';

@JS('emailjs.send')
external JSPromise<JSObject> _emailjsSend(
  JSString serviceId,
  JSString templateId,
  JSObject templateParams,
);

@JS()
@staticInterop
class _EmailJSResponse {}

extension on _EmailJSResponse {
  external JSNumber get status;
}

Future<bool> sendEmailJS({
  required String name,
  required String email,
  required String phone,
  required String message,
}) async {
  try {
    final now = DateTime.now();
    final submitted =
        '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}';
    final params = <String, String>{
      'name': name,
      'email': email,
      'phone': phone.isEmpty ? 'Not provided' : phone,
      'message': message,
      'submitted_at': submitted,
      'source': 'oneview.world',
    }.jsify() as JSObject;

    final result = await _emailjsSend(
      'EMAILJS_SERVICE_ID_PLACEHOLDER'.toJS,
      'EMAILJS_TEMPLATE_ID_PLACEHOLDER'.toJS,
      params,
    ).toDart;

    final response = result as _EmailJSResponse;
    return response.status.toDartInt == 200;
  } catch (_) {
    return false;
  }
}
