import 'dart:async';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  String appBarTitle = '';
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          appBarTitle = _isSliverAppBarExpanded ? '' : 'Emma Watson';
        });
      });
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    Timer(const Duration(seconds: 1), () {
      _animationController.forward();
    });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.offset < (450 - kToolbarHeight);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 450,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Text(appBarTitle),
                background: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/emma.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.black.withOpacity(.2)
                    ], begin: Alignment.bottomCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Emma Watson',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  '60 Videos',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  '240K Subscribers',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      'Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18, height: 1.4),
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Born',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'April 15th 1990, Paris, France',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, height: 1.4),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nationality',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'British',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, height: 1.4),
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Videos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeVideos('assets/images/emma-1.jpg'),
                        makeVideos('assets/images/emma-2.jpg'),
                        makeVideos('assets/images/emma-3.jpg'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  AspectRatio makeVideos(String assetName) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(assetName), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 60,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
