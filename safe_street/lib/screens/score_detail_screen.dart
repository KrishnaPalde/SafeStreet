import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_street/models/experience.dart';
import 'package:safe_street/models/location.dart';
import 'package:safe_street/models/score.dart';
import 'package:safe_street/utilities/Color.dart';
import 'package:safe_street/utilities/database_functions.dart';
import 'package:safe_street/utilities/static_data.dart';

class ScoreDetailsScreen extends StatefulWidget {
  const ScoreDetailsScreen({super.key});
  static const String routeName = '/score-details-screen';

  @override
  State<ScoreDetailsScreen> createState() => _ScoreDetailsScreenState();
}

class _ScoreDetailsScreenState extends State<ScoreDetailsScreen> {
  late final _ratingController;
  late double _rating;
  // int upvote = 0;
  // int downvote = 0;
  double _placeRating = 3.0;
  bool _isVertical = false;

  String selectedOption = '';
  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _placeRating;
  }

  @override
  Widget build(BuildContext context) {
    print(StaticData.markerDetails);
    return StreamBuilder(
        stream: getLocationDetailsStream(StaticData.markerDetails['name']),
        builder: (context, snapshot) {
          if (ConnectionState.active == snapshot.connectionState) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              SafeStreetLocation locData =
                  SafeStreetLocation.fromMap(data!.docs.first.data());

              double averageRating = 0;
              double totalRatings = 0;
              int ratingCount = 0;
              locData.experienceRatingId.forEach(
                (element) {
                  totalRatings += element['rating'];
                  ratingCount += 1;
                },
              );
              print(totalRatings);
              print(ratingCount);
              print(totalRatings / ratingCount);
              averageRating = totalRatings / ratingCount;
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text(
                      locData.locationName,
                      style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
                    ),
                  ),
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 2,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: MediaQuery.of(context).size.height * 0.03),
                            child: Text(
                              "Overall Rating",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: const Text(
                                    'Women',
                                  ),
                                  value: 'Women',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Lower Caste'),
                                  value: 'Lower Caste',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('LGBTQ+'),
                                  value: 'LGBTQ+',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.width * 0.08),
                            // child: _ratingBar(1),
                            child: RatingBarIndicator(
                              rating: _placeRating,
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 50.0,
                              unratedColor: Colors.amber.withAlpha(50),
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "$averageRating / 5",
                              style: GoogleFonts.nunito(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07),
                            child: TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      double _initialRating = 0.0;
                                      TextEditingController
                                          _experienceController =
                                          TextEditingController();
                                      return AlertDialog(
                                        // contentPadding: EdgeInsets.all(0),
                                        backgroundColor: Colors.white,
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            MediaQuery.of(ctx)
                                                                    .size
                                                                    .width *
                                                                0.2),
                                                    child: Text(
                                                      "Your Rating",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(ctx);
                                                    },
                                                    icon: Icon(
                                                        Icons.close_rounded),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: MediaQuery.of(ctx)
                                                            .size
                                                            .height *
                                                        0.03),
                                                child: RatingBar.builder(
                                                  initialRating: _initialRating,
                                                  minRating: 1,
                                                  direction: _isVertical
                                                      ? Axis.vertical
                                                      : Axis.horizontal,
                                                  allowHalfRating: true,
                                                  unratedColor: Colors.amber
                                                      .withAlpha(50),
                                                  itemCount: 5,
                                                  itemSize: 40.0,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    _selectedIcon ?? Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    setState(() {
                                                      _rating = rating;
                                                    });
                                                  },
                                                  updateOnDrag: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: MediaQuery.of(ctx)
                                                            .size
                                                            .height *
                                                        0.03),
                                                child: TextField(
                                                  controller:
                                                      _experienceController,
                                                  maxLines: 5,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Write your Experience here...',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: MediaQuery.of(ctx)
                                                            .size
                                                            .height *
                                                        0.03),
                                                child: Container(
                                                  width: MediaQuery.of(ctx)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: SizedBox(
                                                          width:
                                                              MediaQuery.of(ctx)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                          height:
                                                              MediaQuery.of(ctx)
                                                                      .size
                                                                      .height *
                                                                  0.07,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              double
                                                                  userRating =
                                                                  _rating;
                                                              String
                                                                  userExperience =
                                                                  _experienceController
                                                                      .text
                                                                      .toString();
                                                              await uploadUserRatingAndExperience(
                                                                Score(
                                                                  scoreId: "1",
                                                                  uId: FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid,
                                                                  score:
                                                                      userRating,
                                                                  type: "",
                                                                  location: StaticData
                                                                          .markerDetails
                                                                          .isNotEmpty
                                                                      ? StaticData
                                                                              .markerDetails[
                                                                          'name']
                                                                      : "",
                                                                ),
                                                                Experience(
                                                                  experienceId:
                                                                      "1",
                                                                  scoreId: "1",
                                                                  upvotes: 0,
                                                                  downvotes: 0,
                                                                  experienceText:
                                                                      userExperience,
                                                                ),
                                                                SafeStreetLocation(
                                                                    "0",
                                                                    StaticData
                                                                            .markerDetails[
                                                                        'name'],
                                                                    StaticData
                                                                            .markerDetails[
                                                                        'latitude'],
                                                                    StaticData
                                                                            .markerDetails[
                                                                        'longitude'],
                                                                    "0",
                                                                    [{}],
                                                                    "",
                                                                    ""),
                                                              );
                                                              Navigator.pop(
                                                                  ctx);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: MaterialColor(
                                                                  0xFFFD3013,
                                                                  color), // Set your desired background color
                                                            ),
                                                            child: Text(
                                                              "Submit",
                                                              style: GoogleFonts.nunito(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Add your Rating",
                                  style: GoogleFonts.nunito(
                                      color: MaterialColor(0xFFFD3013, color),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "Top Experiences",
                              style: GoogleFonts.nunito(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *
                                (0.3 * locData.experienceRatingId.length),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: ListView.builder(
                                itemCount: locData.experienceRatingId.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) {
                                  return ListTile(
                                    title: Text(
                                      "Anonymous User",
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${locData.experienceRatingId[i]['experience']}"),
                                        Container(
                                          child: Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        // if (upvote < 1) {
                                                        await upvoteExperience(
                                                            locData, i);
                                                        // upvote++;
                                                        // }
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .arrow_circle_up_rounded,
                                                        color: Colors.green,
                                                      )),
                                                  Text(
                                                      "${locData.experienceRatingId[i]['upvotes']}"),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        // if (downvote < 1) {
                                                        await downvoteExperience(
                                                            locData, i);
                                                        // downvote++;
                                                        // }
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .arrow_circle_down_rounded,
                                                        color: Colors.red,
                                                      )),
                                                  Text(
                                                      "${locData.experienceRatingId[i]['downvotes']}"),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _placeRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _placeRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image('assets/heart.png'),
            half: _image('assets/heart_half.png'),
            empty: _image('assets/heart_border.png'),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _placeRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}
