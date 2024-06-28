class B {
  String? one;
  B({required this.one});
  factory B.fromB(fromBB) {
    return B(one: fromBB['one']);
  }
}

//

class A {
  String? name_e;
  B b;
  A({
    required this.b,
    required this.name_e});
  factory A.fromA(fromAAA) {
    return A(name_e: fromAAA['name_e'
    ],

    b: B.fromB(fromAAA['B'])

    
    
    );
  }
}

//
class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;
  Time(
      {required this.updated,
      required this.updatedISO,
      required this.updateduk});
  factory Time.fromTime(fromTimeApna) {
    return Time(
        updated: fromTimeApna['updated'],
        updatedISO: fromTimeApna['updatedISO'],
        updateduk: fromTimeApna["updateduk"]);
  }
}

class Mubeen {
  String? name;
  Time time;
  A a;
  
  String? disclaimer;
  String? chartName;

  Mubeen(
      {
      required this.name,
      required this.a,
      required this.time,
      required this.disclaimer,
      required this.chartName});
  factory Mubeen.fromJsomApnaMub(dataApanss) {
    return Mubeen(
      // b: B.fromB(dataApanss['B']),
      a: A.fromA(dataApanss['A']),
      chartName: dataApanss['chartName'],
      disclaimer: dataApanss['disclaimer'],
      name: dataApanss['name'],
      time: Time.fromTime(
        dataApanss['time'],
      ),
    );
  }
}
