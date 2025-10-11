class TextUtils {

  static bool isEmpty(String ?value) {
    if (value == null || value.isEmpty || value == '') {
      return true;
    }
    return false;
  }

  static bool isNotEmpty(String ?value) {
    if (value != null || value != '') {
      return true;
    }
    return false;
  }


}