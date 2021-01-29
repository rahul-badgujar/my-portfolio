class ResumeData {
  // keys
  static const String KEY_VIEW_URL = "view-url";
  static const String KEY_DOWNLOAD_URL = "download-url";

  final String viewUrl;
  final String downloadUrl;

  ResumeData({
    this.viewUrl,
    this.downloadUrl,
  });

  factory ResumeData.fromMap(Map m) {
    return ResumeData(
      viewUrl: m[KEY_VIEW_URL],
      downloadUrl: m[KEY_DOWNLOAD_URL],
    );
  }
}
