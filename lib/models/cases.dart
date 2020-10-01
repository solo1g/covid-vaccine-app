class CasesTimeSeries {
  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  CasesTimeSeries(
      {this.dailyconfirmed,
      this.dailydeceased,
      this.dailyrecovered,
      this.date,
      this.totalconfirmed,
      this.totaldeceased,
      this.totalrecovered});
}

class Statewise {
  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.deltaconfirmed,
      this.deltadeaths,
      this.deltarecovered,
      this.lastupdatedtime,
      this.migratedother,
      this.recovered,
      this.state,
      this.statecode,
      this.statenotes});
}

class Tested {
  String dailyrtpcrtests;
  String individualstestedperconfirmedcase;
  String positivecasesfromsamplesreported;
  String samplereportedtoday;
  String source;
  String source1;
  String source3;
  String testedasof;
  String testpositivityrate;
  String testsconductedbyprivatelabs;
  String testsperconfirmedcase;
  String testspermillion;
  String totalindividualstested;
  String totalpositivecases;
  String totalrtpcrtests;
  String totalsamplestested;
  String updatetimestamp;

  Tested(
      {this.dailyrtpcrtests,
      this.individualstestedperconfirmedcase,
      this.positivecasesfromsamplesreported,
      this.samplereportedtoday,
      this.source,
      this.source1,
      this.source3,
      this.testedasof,
      this.testpositivityrate,
      this.testsconductedbyprivatelabs,
      this.testsperconfirmedcase,
      this.testspermillion,
      this.totalindividualstested,
      this.totalpositivecases,
      this.totalrtpcrtests,
      this.totalsamplestested,
      this.updatetimestamp});
}

class DailyCaseDataModel {
  List<CasesTimeSeries> casesTimeSeries;
  List<Statewise> statewise;
  List<Tested> tested;

  DailyCaseDataModel({this.casesTimeSeries, this.statewise, this.tested});
}
