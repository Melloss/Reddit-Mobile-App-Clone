import 'package:flutter/material.dart';
import '../Helper/colorPallets.dart';
import '../Widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab> with ColorPallets {
  final slides = [
    {
      "title": "Hilarious DIY fails that will make you sad - WHY?!",
      "imagePath": "assets/donkey.png",
      "communityImage": "assets/donkey.png",
      "communtiyName": "PixelArt",
      "communityMembersNumber": "1.5m",
    },
    {
      "title":
          "The most impressive feats, skills and moments - all in one place",
      "imagePath": "assets/reddit_avatar.png",
      "communityImage": "assets/reddit.png",
      "communtiyName": "nextAmazingLevel",
      "communityMembersNumber": "8.2m",
    },
    {
      "title": "Hilarious DIY fails that will make you sad - WHY?!",
      "imagePath": "assets/donkey.png",
      "communityImage": "assets/donkey.png",
      "communtiyName": "PixelArt",
      "communityMembersNumber": "1.5m",
    },
  ];

  final communityTreadings = [
    {
      "name": "UFOs",
      "image": "assets/donkey.png",
      "members": "1.2m",
      "description":
          "Discover the truth about UFOs, explore sightings, and connect with other enthusiasts",
    },
    {
      "name": "nyc",
      "image": "assets/reddit.png",
      "members": "830k",
      "description": "t/nyc, the subreddit about New York City",
    },
    {
      "name": "ariheads",
      "image": "assets/donkey.png",
      "members": "43.6k",
      "description":
          "Engage in sprited discussions on Ariana's impacts on pop culture and the music",
    },
    {
      "name": "BoneAppleTea",
      "image": "assets/reddit.png",
      "members": "1.2m",
      "description":
          "Get a good chuckle from the humorous and unexpected ways of spelling words",
    }
  ];

  final topCommunities = [
    {
      "name": "place",
      "image": "assets/reddit.png",
      "members": "7.6m",
      "description":
          "There is an empty canvas, you may place a pixel upon it, but you must wait to place anot...",
    },
    {
      "name": "AskReddit",
      "image": "assets/reddit.png",
      "members": "42.2m",
      "description":
          "The go-to susbreddit to ask answer thought-provoking questions.",
    },
    {
      "name": "facepalm",
      "image": "assets/reddit.png",
      "members": "7.6m",
      "description":
          "Witness the absurdity of humanity. Share and enjoy the cringe.",
    },
    {
      "name": "mildlyinfuriating",
      "image": "assets/reddit.png",
      "members": "6.1m",
      "description": "Find comfort in knowing you're not alone in life's minor",
    },
  ];
  final communityCatagories = [
    "Q&As",
    "Funny",
    "Cringe & Facepalm",
    "Reddit Meta",
    "Memes",
    "Interesting",
    "Ethics & Philosophy",
    "Career",
    "Role-Playing Games",
    "Stories & Confessions",
    "News",
    "Action Games",
    "Anime & Manga",
    "Places in Europe",
    "Animals & Pets",
    "Places in North America",
    "Podcasts",
    "Cars & Trucks",
    "Tabletop Games",
    "Gaming News & Discussion",
    "Law",
    "Food industry & Restaurants",
    "Movie News & Discussion",
    "Personal Finance",
    "Adventure Games",
    "Computers & Hardware",
    "Celebrities",
    "Paranormal & Unexplained",
    "Beauty & Grooming",
    "Amazing"
  ];

  int currentSlide = 0;
  double dashWidth = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 152), (timer) {
      if (dashWidth > 65) {
        setState(() {
          dashWidth = 0;
        });
      } else {
        setState(() {
          dashWidth += 1;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 13, left: 13),
      child: ListView(
        children: [
          _buildTrending(),
          _buildSpotlite(),
          _buildTreadingGlobally(),
          _buildTopGlobally(),
          _buildCommunityTopCharts(),
        ],
      ),
    );
  }

  Widget _buildTrending() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildTitle("Trending now"),
      const SizedBox(height: 15),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CircleTextButton(text: "UFOs"),
              CircleTextButton(text: "Pixel Art"),
              CircleTextButton(text: "Barbie"),
              CircleTextButton(text: "Ariana Grande"),
              CircleTextButton(text: "Space"),
              CircleTextButton(text: "Streamers"),
              CircleTextButton(text: "Twitter X"),
              CircleTextButton(text: "Celebrity Gossip"),
              CircleTextButton(text: "Oppenheimer"),
              CircleTextButton(text: "Reddit Starter Pack"),
              CircleTextButton(text: "Charcater AI"),
              CircleTextButton(text: "FIFA Women's World Cup"),
              CircleTextButton(text: "Artificial Intelligence"),
            ],
          )),
    ]);
  }

  _buildSpotlite() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Community spotlights"),
          const SizedBox(height: 15),
          _buildCarousel(),
          const SizedBox(height: 15),
          _buildCarouselDashes(),
        ],
      ),
    );
  }

  _buildTitle(String title, {double? size}) {
    return Text(
      title,
      style: TextStyle(
        color: ColorPallets.normalTextColor,
        fontSize: size ?? 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              dashWidth = 0;
              currentSlide = index;
            });
          },
          enlargeFactor: 0.2,
          clipBehavior: Clip.hardEdge,
          autoPlayInterval: const Duration(seconds: 10),
          disableCenter: true,
          enlargeCenterPage: true,
          height: 260,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enableInfiniteScroll: true,
          viewportFraction: 1),
      items: [
        for (int i = 0; i < slides.length; i++) _buildCarouselSlide(slides[i]),
      ],
    );
  }

  _buildCarouselSlide(Map<String, String> data) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        color: ColorPallets.smallTextColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(data["title"] ?? "", size: 14),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(data['imagePath'] ?? ""),
                    fit: BoxFit.cover),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 18,
                    foregroundImage: AssetImage(data['communityImage'] ?? ""),
                  ),
                ),
                const SizedBox(width: 15),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _buildTitle(data['communtiyName'] ?? "", size: 15),
                  const SizedBox(height: 3),
                  Text("${data['communityMembersNumber'] ?? "0"} members",
                      style: const TextStyle(
                          color: ColorPallets.smallTextColor, fontSize: 10)),
                ]),
                Expanded(child: Container()),
                JoinButton(task: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildCarouselDashes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < slides.length; i++) _buildDash(i),
      ],
    );
  }

  _buildDash(int key) {
    return Stack(children: [
      Container(
        key: Key(key.toString()),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 65,
        height: currentSlide == key ? 4 : 2,
        decoration: BoxDecoration(
          color: ColorPallets.iconColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      currentSlide != key
          ? const SizedBox.shrink()
          : Positioned(
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: dashWidth,
                height: 4,
                decoration: BoxDecoration(
                  color: ColorPallets.iconColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
    ]);
  }

  _buildTreadingGlobally() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Treading globally"),
          const SizedBox(height: 10),
          CarouselSlider(
              disableGesture: true,
              items: [
                _buildTreadingGloballySlide(0, 1),
                _buildTreadingGloballySlide(2, 3),
              ],
              options: CarouselOptions(
                padEnds: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.85,
                height: 240,
              ))
        ],
      ),
    );
  }

  _buildTreadingGloballySlide(int first, int second) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommunityTextButton(
          image: communityTreadings[first]['image'].toString(),
          name: communityTreadings[first]['name'].toString(),
          members: communityTreadings[first]['members'].toString(),
          description: communityTreadings[first]['description'].toString(),
        ),
        CommunityTextButton(
          image: communityTreadings[second]['image'].toString(),
          name: communityTreadings[second]['name'].toString(),
          members: communityTreadings[second]['members'].toString(),
          description: communityTreadings[second]['description'].toString(),
        ),
      ],
    );
  }

  _buildTopGlobally() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Top Globally"),
          const SizedBox(height: 10),
          CarouselSlider(
              disableGesture: true,
              items: [
                _buildTopGloballySlide(0, 1),
                _buildTopGloballySlide(2, 3),
              ],
              options: CarouselOptions(
                padEnds: false,
                enableInfiniteScroll: false,
                viewportFraction: 0.85,
                height: 240,
              ))
        ],
      ),
    );
  }

  _buildTopGloballySlide(int first, int second) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommunityTextButton(
          image: topCommunities[first]['image'].toString(),
          name: topCommunities[first]['name'].toString(),
          members: topCommunities[first]['members'].toString(),
          description: topCommunities[first]['description'].toString(),
        ),
        CommunityTextButton(
          image: topCommunities[second]['image'].toString(),
          name: topCommunities[second]['name'].toString(),
          members: topCommunities[second]['members'].toString(),
          description: topCommunities[second]['description'].toString(),
        ),
      ],
    );
  }

  _buildCommunityTopCharts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Community top charts"),
        const SizedBox(height: 10),
        for (int i = 0; i < communityCatagories.length; i++)
          _buildTextButton(communityCatagories[i]),
      ],
    );
  }

  _buildTextButton(String s) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      child: TextButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
        ),
        child: Row(
          children: [
            Text(s, style: const TextStyle(fontWeight: FontWeight.normal)),
            Expanded(child: Container()),
            const Icon(Icons.keyboard_arrow_right,
                color: ColorPallets.iconColor)
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
