enum RmUnitType {
  times('回'),
  rm('rm'),
  minute('分'),
  second('秒'),
  set('set'),
  ;

  const RmUnitType(this.text);
  final String text;
}
