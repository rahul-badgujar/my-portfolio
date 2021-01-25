class Project {
  final title;
  final description;
  final ytUrl;
  final ytId;
  final sourceCodeUrl;
  final executableUrl;
  final tags;

  static const String TITLE_KEY = "title";
  static const String DESCRIPTION_KEY = "description";
  static const String YT_URL_KEY = "youtube-url";
  static const String YT_ID_KEY = "youtube-id";
  static const String SOURCECODE_URL_KEY = "source-code-url";
  static const String EXEC_URL = "executable-url";
  static const String TAGS_URL = "tags";

  Project({
    this.title,
    this.description,
    this.ytUrl,
    this.ytId,
    this.sourceCodeUrl,
    this.executableUrl,
    this.tags,
  });

  factory Project.fromMap(Map map) {
    return Project(
      title: map[TITLE_KEY],
      description: map[DESCRIPTION_KEY],
      ytUrl: map[YT_URL_KEY],
      ytId: map[YT_ID_KEY],
      sourceCodeUrl: map[SOURCECODE_URL_KEY],
      executableUrl: map[EXEC_URL],
      tags: map[TAGS_URL],
    );
  }
}
