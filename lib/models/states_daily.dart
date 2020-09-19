class Statewise {
  String andamanandnicobarislands;
  String andhrapradesh;
  String arunachalpradesh;
  String assam;
  String bihar;
  String chandigarh;
  String chhattisgarh;
  String date;
  String dd;
  String delhi;
  String dadraandnagarhavelianddamananddiu;
  String goa;
  String gujarat;
  String himachalpradesh;
  String haryana;
  String jharkhand;
  String jammukashmir;
  String karnataka;
  String kerala;
  String ladakh;
  String lakshadweep;
  String maharashtra;
  String meghalaya;
  String manipur;
  String madhyapradesh;
  String mizoram;
  String nagaland;
  String odisha;
  String punjab;
  String puducherry;
  String rajasthan;
  String sikkim;
  String status;
  String telangana;
  String tamilnadu;
  String tripura;
  String total;
  String stateunassigned;
  String uttarpradesh;
  String uttarakhand;
  String westbengal;

  Statewise({
    this.andamanandnicobarislands,
    this.andhrapradesh,
    this.arunachalpradesh,
    this.assam,
    this.bihar,
    this.chandigarh,
    this.chhattisgarh,
    this.date,
    this.dd,
    this.delhi,
    this.dadraandnagarhavelianddamananddiu,
    this.goa,
    this.gujarat,
    this.himachalpradesh,
    this.haryana,
    this.jharkhand,
    this.jammukashmir,
    this.karnataka,
    this.kerala,
    this.ladakh,
    this.lakshadweep,
    this.maharashtra,
    this.meghalaya,
    this.manipur,
    this.madhyapradesh,
    this.mizoram,
    this.nagaland,
    this.odisha,
    this.punjab,
    this.puducherry,
    this.rajasthan,
    this.sikkim,
    this.status,
    this.telangana,
    this.tamilnadu,
    this.tripura,
    this.total,
    this.stateunassigned,
    this.uttarpradesh,
    this.uttarakhand,
    this.westbengal,
  });

  Statewise.fromJson(Map<String, dynamic> json) {
    andamanandnicobarislands = json['an'];
    andhrapradesh = json['ap'];
    arunachalpradesh = json['ar'];
    assam = json['as'];
    bihar = json['br'];
    chandigarh = json['ch'];
    chhattisgarh = json['ct'];
    date = json['date'];
    dd = json['dd'];
    delhi = json['dl'];
    dadraandnagarhavelianddamananddiu = json['dn'];
    goa = json['ga'];
    gujarat = json['gj'];
    himachalpradesh = json['hp'];
    haryana = json['hr'];
    jharkhand = json['jh'];
    jammukashmir = json['jk'];
    karnataka = json['ka'];
    kerala = json['kl'];
    ladakh = json['la'];
    lakshadweep = json['ld'];
    maharashtra = json['mh'];
    meghalaya = json['ml'];
    manipur = json['mn'];
    madhyapradesh = json['mp'];
    mizoram = json['mz'];
    nagaland = json['nl'];
    odisha = json['or'];
    punjab = json['pb'];
    puducherry = json['py'];
    rajasthan = json['rj'];
    sikkim = json['sk'];
    status = json['status'];
    telangana = json['tg'];
    tamilnadu = json['tn'];
    tripura = json['tr'];
    total = json['tt'];
    stateunassigned = json['un'];
    uttarpradesh = json['ut'];
    uttarakhand = json['wb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['an'] = this.andamanandnicobarislands;
    data['ap'] = this.andhrapradesh;
    data['ar'] = this.arunachalpradesh;
    data['as'] = this.assam;
    data['br'] = this.bihar;
    data['ch'] = this.chandigarh;
    data['ct'] = this.chhattisgarh;
    data['date'] = this.date;
    data['dd'] = this.dd;
    data['dl'] = this.delhi;
    data['dn'] = this.dadraandnagarhavelianddamananddiu;
    data['ga'] = this.goa;
    data['gj'] = this.gujarat;
    data['hp'] = this.himachalpradesh;
    data['hr'] = this.haryana;
    data['jh'] = this.jharkhand;
    data['jk'] = this.jammukashmir;
    data['ka'] = this.karnataka;
    data['kl'] = this.kerala;
    data['la'] = this.ladakh;
    data['ld'] = this.lakshadweep;
    data['mh'] = this.maharashtra;
    data['ml'] = this.meghalaya;
    data['mn'] = this.manipur;
    data['mp'] = this.madhyapradesh;
    data['mz'] = this.mizoram;
    data['nl'] = this.nagaland;
    data['or'] = this.odisha;
    data['pj'] = this.punjab;
    data['py'] = this.puducherry;
    data['rj'] = this.rajasthan;
    data['sk'] = this.sikkim;
    data['status'] = this.status;
    data['tg'] = this.telangana;
    data['tn'] = this.tamilnadu;
    data['tr'] = this.tripura;
    data['tt'] = this.total;
    data['un'] = this.stateunassigned;
    data['up'] = this.uttarpradesh;
    data['ut'] = this.uttarakhand;
    data['wb'] = this.westbengal;
    return data;
  }
}
