class SvgAssets {
  static final SvgAssets _instance = SvgAssets._internal();

  factory SvgAssets() {
    return _instance;
  }

  SvgAssets._internal();

  Map<AssetName, String> assets = {
    AssetName.options: "assets/icons/options.svg",
    AssetName.play: "assets/icons/play.svg",
    AssetName.consulta: "assets/icons/consulta.svg",
    AssetName.indicaciones: "assets/icons/indicaciones.svg",
    AssetName.killa: "assets/icons/killa.svg",
    AssetName.manual: "assets/icons/manual.svg",
    AssetName.consulta1: "assets/icons/consulta1.svg",
    AssetName.indicaciones1: "assets/icons/indicaciones1.svg",
    AssetName.killa1: "assets/icons/killa1.svg",
    AssetName.manual1: "assets/icons/manual1.svg",
    AssetName.gear: "assets/icons/gear.svg",
  };
}

enum AssetName {
  options,
  play,
  consulta,
  indicaciones,
  killa,
  manual,
  consulta1,
  indicaciones1,
  killa1,
  manual1,
  gear
}