class BasicDetails {
  // keys
  static const String KEY_NAME = "name";
  static const String KEY_TITLE = "title";
  static const String KEY_WORK_STATUS = "work-status";
  static const String KEY_BIO = "bio";
  static const String KEY_SKILLSET = "skillset";
  static const String KEY_GITHUB_PROFILE = "github-profile";
  static const String KEY_LINKEDIN_PROFILE = "linkedin-profile";
  static const String KEY_CODECHEF_PROFILE = "codechef-profile";

  final String name;
  final String title;
  final String workStatus;
  final String bio;
  final List<String> skillset;
  final String githubProfileUrl;
  final String linkedinProfileUrl;
  final String codechefProfileUrl;

  BasicDetails({
    this.name,
    this.title,
    this.workStatus,
    this.bio,
    this.skillset,
    this.githubProfileUrl,
    this.linkedinProfileUrl,
    this.codechefProfileUrl,
  });

  factory BasicDetails.fromMap(Map m) {
    return BasicDetails(
      name: m[KEY_NAME],
      title: m[KEY_TITLE],
      workStatus: m[KEY_WORK_STATUS],
      bio: m[KEY_BIO],
      skillset: m[KEY_SKILLSET].cast<String>(),
      linkedinProfileUrl: m[KEY_LINKEDIN_PROFILE],
      githubProfileUrl: m[KEY_GITHUB_PROFILE],
      codechefProfileUrl: m[KEY_CODECHEF_PROFILE],
    );
  }
}
