import 'dart:js_interop';

@JS('grecaptcha.execute')
external JSPromise<JSString> _grecaptchaExecute(
  JSString siteKey,
  JSObject options,
);

/// Executes reCAPTCHA v3 and returns the token.
/// Returns null if reCAPTCHA fails (e.g. script not loaded).
Future<String?> getRecaptchaToken() async {
  try {
    final options = {'action': 'submit'}.jsify() as JSObject;
    final token = await _grecaptchaExecute(
      'RECAPTCHA_SITE_KEY_PLACEHOLDER'.toJS,
      options,
    ).toDart;
    return token.toDart;
  } catch (_) {
    return null;
  }
}
