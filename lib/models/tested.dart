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

  Tested.fromJson(Map<String, dynamic> json) {
    dailyrtpcrtests = json['dailyrtpcrtests'];
    individualstestedperconfirmedcase =
        json['individualstestedperconfirmedcase'];
    positivecasesfromsamplesreported = json['positivecasesfromsamplesreported'];
    samplereportedtoday = json['samplereportedtoday'];
    source = json['source'];
    source1 = json['source1'];
    source3 = json['source3'];
    testedasof = json['testedasof'];
    testpositivityrate = json['testpositivityrate'];
    testsconductedbyprivatelabs = json['testsconductedbyprivatelabs'];
    testsperconfirmedcase = json['testsperconfirmedcase'];
    testspermillion = json['testspermillion'];
    totalindividualstested = json['totalindividualstested'];
    totalpositivecases = json['totalpositivecases'];
    totalrtpcrtests = json['totalrtpcrtests'];
    totalsamplestested = json['totalsamplestested'];
    updatetimestamp = json['updatetimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyrtpcrtests'] = this.dailyrtpcrtests;
    data['individualstestedperconfirmedcase'] =
        this.individualstestedperconfirmedcase;
    data['positivecasesfromsamplesreported'] =
        this.positivecasesfromsamplesreported;
    data['samplereportedtoday'] = this.samplereportedtoday;
    data['source'] = this.source;
    data['source1'] = this.source1;
    data['source3'] = this.source3;
    data['testedasof'] = this.testedasof;
    data['testpositivityrate'] = this.testpositivityrate;
    data['testsconductedbyprivatelabs'] = this.testsconductedbyprivatelabs;
    data['testsperconfirmedcase'] = this.testsperconfirmedcase;
    data['testspermillion'] = this.testspermillion;
    data['totalindividualstested'] = this.totalindividualstested;
    data['totalpositivecases'] = this.totalpositivecases;
    data['totalrtpcrtests'] = this.totalrtpcrtests;
    data['totalsamplestested'] = this.totalsamplestested;
    data['updatetimestamp'] = this.updatetimestamp;
    return data;
  }
}
