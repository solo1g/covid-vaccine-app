import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:provider/provider.dart';

import '../widgets/coviddetails/cases_list_cards.dart';
import '../widgets/coviddetails/national_chart.dart';
import '../widgets/coviddetails/state_chart.dart';
import '../state_models/user_details_data.dart';
// import '../state_models/covid_details_data.dart';

class CovidDetailsPage extends StatefulWidget {
  static const routeName = '/covid-details';
  @override
  _CovidDetailsPageState createState() => _CovidDetailsPageState();
}

class _CovidDetailsPageState extends State<CovidDetailsPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Covid Updates',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // SliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorHeight: 40.0,
                  indicatorColor: Colors.white,
                ),
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: <Widget>[
                  Tab(child: Text('India')),
                  Tab(
                      child: Text(context
                          .watch<UserData>()
                          .userPlacemark
                          .administrativeArea
                          .toString())),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                NestedTab(location: Location.India),
                NestedTab(location: Location.My_state),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NestedTab extends StatefulWidget {
  final Location location;

  NestedTab({
    this.location,
    Key key,
  }) : super(key: key);

  @override
  _NestedTabState createState() => _NestedTabState();
}

class _NestedTabState extends State<NestedTab> with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    _nestedTabController = new TabController(
        length: widget.location == Location.India ? 3 : 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TabBar(
              controller: _nestedTabController,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              tabs: widget.location == Location.India
                  ? <Widget>[
                      Tab(child: Text('Total')),
                      Tab(child: Text('Today')),
                      Tab(child: Text('Yesterday')),
                    ]
                  : <Widget>[
                      Tab(child: Text('Total')),
                      Tab(child: Text('Today')),
                    ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(
                  controller: _nestedTabController,
                  children: widget.location == Location.India
                      ? <Widget>[
                          Column(
                            children: <Widget>[
                              CasesListCards(
                                location: widget.location,
                                date: Date.Total,
                                state: context
                                    .watch<UserData>()
                                    .userPlacemark
                                    .administrativeArea
                                    .toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              CasesListCards(
                                location: widget.location,
                                date: Date.Today,
                                state: context
                                    .watch<UserData>()
                                    .userPlacemark
                                    .administrativeArea
                                    .toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              CasesListCards(
                                location: widget.location,
                                date: Date.Yesterday,
                                state: context
                                    .watch<UserData>()
                                    .userPlacemark
                                    .administrativeArea
                                    .toString(),
                              ),
                            ],
                          ),
                        ]
                      : <Widget>[
                          Column(
                            children: <Widget>[
                              CasesListCards(
                                location: widget.location,
                                date: Date.Total,
                                state: context
                                    .watch<UserData>()
                                    .userPlacemark
                                    .administrativeArea
                                    .toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              CasesListCards(
                                location: widget.location,
                                date: Date.Today,
                                state: context
                                    .watch<UserData>()
                                    .userPlacemark
                                    .administrativeArea
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: widget.location == Location.India
                    ? CovidChart()
                    : StateBarChart(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
