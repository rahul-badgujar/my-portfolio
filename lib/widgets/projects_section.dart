import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/ProjectDetails.dart';
import 'package:my_portfolio/services/firestore_helper.dart';
import 'package:my_portfolio/utils.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? 700
              : 360,
        ),
        child: FutureBuilder<List<ProjectDetails>>(
          future: FirestoreHelper().getMyProjectsList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return buildProjectsList(context, snapshot.data);
          },
        ),
      ),
    );
  }

  Widget buildProjectsList(
      BuildContext context, List<ProjectDetails> projects) {
    return Column(
      children: List.generate(
        projects.length,
        (index) {
          return ProjectItem(projectDetails: projects[index]);
        },
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    Key key,
    @required this.projectDetails,
  }) : super(key: key);

  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical:
            DeviceDetails(context).deviceType == DeviceType.Desktop ? 12 : 6,
        horizontal: 4,
      ),
      padding: EdgeInsets.all(
        DeviceDetails(context).deviceType == DeviceType.Desktop ? 14 : 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Player(id: projectDetails.youtubeId),
          SizedBox(height: 6),
          Text(
            projectDetails.title,
            textAlign: TextAlign.center,
            style: DeviceDetails(context).deviceType == DeviceType.Desktop
                ? Theme.of(context).textTheme.headline5.copyWith(
                      color: primaryTextColorBright,
                    )
                : Theme.of(context).textTheme.subtitle1.copyWith(
                      color: primaryTextColorBright,
                    ),
          ),
          SizedBox(height: 16),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: DeviceDetails(context).deviceType == DeviceType.Desktop
                  ? 300
                  : 150,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionButton(
                  title: "Description",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Center(
                            child: Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 700,
                              ),
                              child: Text(
                                projectDetails.description,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icons.description,
                ),
                ActionButton(
                  title: "Source Code",
                  onPressed: () {
                    js.context.callMethod(
                      "open",
                      [projectDetails.sourceCodeUrl],
                    );
                  },
                  icon: Icons.code,
                ),
                if (projectDetails.executableUrl != null)
                  ActionButton(
                    title: "Executable",
                    onPressed: () {
                      js.context.callMethod(
                        "open",
                        [projectDetails.executableUrl],
                      );
                    },
                    icon: Icons.download_sharp,
                  ),
              ],
            ),
          ),
          SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 30,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                projectDetails.tags.length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Chip(
                    label: Text(
                      projectDetails.tags[i],
                      textScaleFactor: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;

  const ActionButton({
    Key key,
    this.onPressed,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
      ),
      label: Text(
        title,
        textScaleFactor:
            DeviceDetails(context).deviceType == DeviceType.Desktop ? 1.0 : 0.8,
      ),
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(primaryTextColorBright),
      ),
    );
  }
}

class Player extends StatefulWidget {
  final String id;

  const Player({Key key, @required this.id}) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerIFrame(
      controller: _controller,
    );
  }
}
