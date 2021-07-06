enum EnumSeriesName {

  A11_Atelier_Rorona,

  A12_Atelier_Totori,

  A14_Atelier_Ayesha,

  A15_Atelier_EschaLogy,

  A17_Atelier_Sophie,

  A18_Atelier_Firis,

  A19_Atelier_LydieSuelle,

  A20_Atelier_Lulua,

  A21_Atelier_Ryza
}

extension EnumSeriesNameExtension on EnumSeriesName {
  String get name {
    switch (this) {
      case EnumSeriesName.A11_Atelier_Rorona:
        return "Rorona";
      case EnumSeriesName.A12_Atelier_Totori:
        return "Totori";
      case EnumSeriesName.A14_Atelier_Ayesha:
        return "Ayesha";
      case EnumSeriesName.A15_Atelier_EschaLogy:
        return "EschaLogy";
      case EnumSeriesName.A17_Atelier_Sophie:
        return "Sophie";
      case EnumSeriesName.A18_Atelier_Firis:
        return "Firis";
      case EnumSeriesName.A19_Atelier_LydieSuelle:
        return "LydieSuelle";
      case EnumSeriesName.A20_Atelier_Lulua:
        return "Lulua";
      case EnumSeriesName.A21_Atelier_Ryza:
        return "Ryza";
      default:
        return "";
    }
  }
  String get buttonName{
    switch (this) {
      case EnumSeriesName.A11_Atelier_Rorona:
        return "ロロナのアトリエ～アーランドの錬金術士～";
      case EnumSeriesName.A12_Atelier_Totori:
        return "トトリのアトリエ ～アーランドの錬金術士2～";
      case EnumSeriesName.A14_Atelier_Ayesha:
        return "アーシャのアトリエ 〜黄昏の大地の錬金術士〜";
      case EnumSeriesName.A15_Atelier_EschaLogy:
        return "エスカ&ロジーのアトリエ 〜黄昏の空の錬金術士〜";
      case EnumSeriesName.A17_Atelier_Sophie:
        return "ソフィーのアトリエ ～不思議な本の錬金術士～";
      case EnumSeriesName.A18_Atelier_Firis:
        return "フィリスのアトリエ ～不思議な旅の錬金術士～";
      case EnumSeriesName.A19_Atelier_LydieSuelle:
        return "リディー＆スールのアトリエ ～不思議な絵画の錬金術士～";
      case EnumSeriesName.A20_Atelier_Lulua:
        return "ルルアのアトリエ ～アーランドの錬金術士 4～";
      case EnumSeriesName.A21_Atelier_Ryza:
        return "ライザのアトリエ　常闇の女王と秘密の隠れ家";
      default:
        return "";
    }
  }
}
