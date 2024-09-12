import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model classes
class SoccerMatch {
  late Fixture fixture;
  late Team home;
  late Team away;
  late Goal goal;

  SoccerMatch(this.fixture, this.home, this.away, this.goal);

  factory SoccerMatch.fromjson(Map<String, dynamic> json) {
    return SoccerMatch(
      Fixture.fromjson(json['fixture']),
      Team.fromjson(json['teams']['home']),
      Team.fromjson(json['teams']['away']),
      Goal.fromjson(json['goals']),
    );
  }
}

class Fixture {
  late int id;
  late String date;
  late Status status;

  Fixture(this.id, this.date, this.status);

  factory Fixture.fromjson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], Status.fromjson(json['status']));
  }
}

class Status {
  late int elapsedTime;
  late String long;

  Status(this.elapsedTime, this.long);

  factory Status.fromjson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long']);
  }
}

class Team {
  late int id;
  late String name;
  late String logoUrl;
  late bool winner;

  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromjson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo'], json['winner']);
  }
}

class Goal {
  late int home;
  late int away;

  Goal(this.home, this.away);

  factory Goal.fromjson(Map<String, dynamic> json) {
    return Goal(json['home'], json['away']);
  }
}

// API Manager
class SoccerApi {
  final String apiUrl = "https://sport-highlights-api.p.rapidapi.com/football/matches";

  // https://sport-highlights-api.p.rapidapi.com/football/matches
  // https://v3.football.api-sports.io/fixtures?live=all

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "296fbf84be3ac1e8b9b99efde11c1b21",
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    try {
      final uri = Uri.parse(apiUrl);
      final res = await http.get(uri, headers: headers);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        List<dynamic> matchesList = body['response'];
        List<SoccerMatch> matches = matchesList.map((dynamic item) => SoccerMatch.fromjson(item)).toList();
        return matches;
      } else {
        print("Failed to load matches: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}


class MatchesBoard extends StatelessWidget {
  const MatchesBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

  @override
  State<SoccerApp> createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
        title: const Text(
          "Soccer Board",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return PageBody(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}

// Page Body Widget
Widget PageBody(List<SoccerMatch> allmatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTile(allmatches[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

// Match Tile Widget
Widget matchTile(SoccerMatch match) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.home.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            "${match.goal.home} - ${match.goal.away}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.away.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.away.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}

// Goal Stat Widget
Widget goalStat(int expandedTime, int homeGoal, int awayGoal) {
  return Expanded(
    child: Column(
      children: [
        Text(
          "$expandedTime",
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$homeGoal - $awayGoal",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Team Stat Widget
Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Image.network(
            logoUrl,
            width: 54.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}








































// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class MatchesBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Match Results'),
//           backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(Icons.arrow_back_ios, color: Colors.black),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               color: Colors.cyan,
//               child: TabBar(
//                 labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                 unselectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                 tabs: [
//                   Tab(text: 'Tomorrow'),
//                   Tab(text: 'Today'),
//                   Tab(text: 'Yesterday'),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   MatchResultsByDate(date: DateTime.now().add(Duration(days: 1)).toString().split(' ')[0]),
//                   MatchResultsByDate(date: DateTime.now().toString().split(' ')[0]),
//                   MatchResultsByDate(date: DateTime.now().subtract(Duration(days: 1)).toString().split(' ')[0]),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MatchResultsByDate extends StatefulWidget {
//   final String date;
//
//   MatchResultsByDate({required this.date});
//
//   @override
//   _MatchResultsByDateState createState() => _MatchResultsByDateState();
// }
//
// class _MatchResultsByDateState extends State<MatchResultsByDate> {
//   late Future<List<MatchResult>> _matchesFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _matchesFuture = _fetchMatchesForDate(widget.date);
//   }
//
//   Future<List<MatchResult>> _fetchMatchesForDate(String date) async {
//     final response = await http.get(Uri.parse('https://example.com/api/matches?date=$date'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => MatchResult.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load matches');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<MatchResult>>(
//       future: _matchesFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('There are no matches on this day'));
//         }
//
//         final matches = snapshot.data!;
//
//         return Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               'images/7038901_stock-vector-abstract-soccer-players.png',
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: ListView(
//                 children: matches.map((match) => MatchResultCard(
//                   team1: match.team1,
//                   team2: match.team2,
//                   score: match.score,
//                   date: match.date,
//                   time: match.time,
//                   league: match.league,
//                   leagueLogo: match.leagueLogo,
//                   team1Logo: match.team1Logo,
//                   team2Logo: match.team2Logo,
//                 )).toList(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class MatchResult {
//   final String team1;
//   final String team2;
//   final String score;
//   final String date;
//   final String time;
//   final String league;
//   final String leagueLogo;
//   final String team1Logo;
//   final String team2Logo;
//
//   MatchResult({
//     required this.team1,
//     required this.team2,
//     required this.score,
//     required this.date,
//     required this.time,
//     required this.league,
//     required this.leagueLogo,
//     required this.team1Logo,
//     required this.team2Logo,
//   });
//
//   factory MatchResult.fromJson(Map<String, dynamic> json) {
//     return MatchResult(
//       team1: json['team1'],
//       team2: json['team2'],
//       score: json['score'],
//       date: json['date'],
//       time: json['time'],
//       league: json['league'],
//       leagueLogo: json['leagueLogo'],
//       team1Logo: json['team1Logo'],
//       team2Logo: json['team2Logo'],
//     );
//   }
// }
//
// class MatchResultCard extends StatelessWidget {
//   final String team1;
//   final String team2;
//   final String score;
//   final String date;
//   final String time;
//   final String league;
//   final String leagueLogo;
//   final String team1Logo;
//   final String team2Logo;
//
//   MatchResultCard({
//     required this.team1,
//     required this.team2,
//     required this.score,
//     required this.date,
//     required this.time,
//     required this.league,
//     required this.leagueLogo,
//     required this.team1Logo,
//     required this.team2Logo,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(15),
//         leading: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(team1Logo),
//             SizedBox(width: 10),
//             Image.asset(team2Logo),
//           ],
//         ),
//         title: Text(
//           '$team1 VS $team2',
//           style: TextStyle(
//             fontFamily: "Georgia",
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 'Score: $score\nDate: $date\nTime: $time',
//                 style: TextStyle(
//                     fontFamily: "Georgia",
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.lightBlue
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Image.asset(leagueLogo, width: 40, height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }
