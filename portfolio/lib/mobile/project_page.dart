import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/credentials.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants.dart';
import '../mobile_reusable_components/project_card.dart';

class ProjectPage extends StatelessWidget {
  final GlobalKey projectKey;
  final double screenHeight;
  const ProjectPage({super.key, required this.projectKey, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight
      ),
      key: projectKey,
      color: kGreyWhiteBgColor,
      width: double.infinity,
      child: Column(
        children: [
          GradientText(
            'My Projects',
            style: tHeadingTextStyle.copyWith(fontSize: 35),
            colors: [
              Color(0xFF4661C5),
              Color(0xFF07BEAA)
            ],
          ),
          SizedBox(height: 5),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 20,
            children: [
              ProjectCard(
                  projectName: "Timely Track",
                  subTitle: "Flutter",
                  projectContent: "Flutter-based attendance and leave management system with beautiful UI, intuitive navigation , and functionality for both users and admins. From check-in animations to leave approval workflows, this app streamlines workplace attendance like never before.",
                  githubLink: timelyTrackGit,
                  imagePath: 'assets/flutter/attendance.png'
              ),
              ProjectCard(
                  projectName: "Feastify",
                  subTitle: "Flutter",
                  projectContent: "Feastify is an elegant and powerful Flutter-based food ordering app that redefines your dining experience. Whether you're craving vegetarian or non-vegetarian meals, or looking for budget-friendly options, Feastify helps you discover restaurants, book tables, and order food, all from your mobile device.",
                  githubLink: feastifyGit,
                  imagePath: 'assets/flutter/feastify.jpg'
              ),
              ProjectCard(
                  projectName: "Taskly",
                  subTitle: "Flutter & Express",
                  projectContent: "A sleek, intuitive mobile application for managing your daily tasks, Taskly is built with Flutter for the frontend and a robust Node.js backend. Users can register, log in, and securely create and manage their to-do lists.",
                  githubLink: todoGit,
                  imagePath: 'assets/flutter/taskly.png'
              ),
              ProjectCard(
                  projectName: "Road Turtle Game",
                  subTitle: "Python",
                  projectContent: "Python arcade-style game where the player controls a turtle trying to cross a busy road filled with moving cars. Cars appear from the right and move left at varying speeds, and the difficulty increases with each successful level. The player uses the arrow keys to move the turtle upward while avoiding collisions—reaching the top means a level up and more fun ahead!",
                  githubLink: crossingTurtleGit,
                  imagePath: 'assets/python/roadturtle.png'
              ),
              ProjectCard(
                  projectName: "Snake Game",
                  subTitle: "Python",
                  projectContent: "A fun and interactive Snake Game built using Python's Turtle Graphics library. Eat the food, grow longer, and avoid crashing into walls or yourself!",
                  githubLink: snakegameGit,
                  imagePath: 'assets/python/snakegame.png'
              ),
              ProjectCard(
                  projectName: "Pong Game",
                  subTitle: "Python",
                  projectContent: "The Pong Game is a classic two-player arcade game built using Python’s turtle module, where each player controls a paddle to bounce a ball back and forth. The ball moves automatically, bouncing off walls and paddles, while the score increases when an opponent misses the ball.  Smooth paddle control with keyboard keys and a real-time score display makes it an exciting retro-style gaming experience!",
                  githubLink: pongGameGit,
                  imagePath: 'assets/python/ponggame.jpg'
              )
            ],
          ),
          SizedBox(height: 10),

        ],
      ),

    );
  }
}
