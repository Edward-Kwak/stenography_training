import 'dart:html' as html;

abstract class WebUtil {
  static go(String url) {
    html.window.location.href = url;
  }

  static reload() {
    html.window.location.reload();
  }

  // static open(String url) {
  //   html.window.open(url, 'avokado');
  // }

  // static close() {
  //   closeWindow();
  // }
}
