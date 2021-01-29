class ProjectDetails {
  static const String KEY_TITLE = "title";
  static const String KEY_DESCRIPTION = "description";
  static const String KEY_YT_URL = "youtube-url";
  static const String KEY_YT_ID = "youtube-id";
  static const String KEY_EXEC_URL = "executable-url";
  static const String KEY_SOURCE_URL = "source-code-url";
  static const String KEY_TAGS = "tags";

  final String title;
  final String description;
  final String youtubeUrl;
  final String youtubeId;
  final String executableUrl;
  final String sourceCodeUrl;
  final List<String> tags;

  ProjectDetails({
    this.title,
    this.description,
    this.youtubeUrl,
    this.youtubeId,
    this.executableUrl,
    this.sourceCodeUrl,
    this.tags,
  });

  factory ProjectDetails.fromMap(Map m) {
    return ProjectDetails(
      title: m[KEY_TITLE],
      description: m[KEY_DESCRIPTION],
      youtubeId: m[KEY_YT_ID],
      youtubeUrl: m[KEY_YT_URL],
      executableUrl: m[KEY_EXEC_URL],
      sourceCodeUrl: m[KEY_SOURCE_URL],
      tags: m[KEY_TAGS].cast<String>(),
    );
  }
}
