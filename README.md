# TypeSafe PreCure!!

[![Hackage](https://img.shields.io/hackage/v/typesafe-precure.svg)](http://hackage.haskell.org/package/typesafe-precure)
[![CircleCI](https://circleci.com/gh/igrep/typesafe-precure.svg?style=svg)](https://circleci.com/gh/igrep/typesafe-precure)

Type-safe transformations and purifications of PreCures (Japanese Battle Heroine).  
Written in Haskell.

## Features

- Collection of Japanese battle heroines "PreCure"  and their transformation and purification phrases.
    - Currently, supports from the first season to "Tropical-Rouge! PreCure", including Cure Echo, Cure Mofurun, Cure Pekorin, and Cure Infini!
- Monadic actions to play the speech of their transformations and purifications.

## Characteristics

**Each girl/PreCure/PreCure's variation/special item has her/its own type**.  
So only correct combinations of girls/PreCures and items can transform and purify.  
Compared with other PreCure implementations such as rubicure, clocure, etc., this makes it *much harder* to use, but it reproduces the settings more correctly.  
*Correctness* is more important for this library.

## Installation

```sh
# pretty-simple is optional. But recommended if you try it on GHCi.
$ stack install typesafe-precure pretty-simple
## ... OR
$ cabal install typesafe-precure pretty-simple
```

## Example Usage

**Note**:
- To `show` Japanese characters in GHCi, use [pretty-simple](https://github.com/cdepillabout/pretty-simple)

### Get transformed PreCure, etc.

```haskell
$ ghci -interactive-print "Text.Pretty.Simple.pPrint"

ghci> :m ACME.PreCure
ghci> transformationSpeech (Mirai, Liko) (Mofurun :+: LinkleStoneDia)
[ "キュアップ・ラパパ！　ダイヤ！"
, "ミラクル・マジカル・ジュエリーレ！"
, "ふたりの奇跡！キュアミラクル！"
, "ふたりの魔法！キュアマジカル！"
, "魔法つかいプリキュア！！"
]
ghci> transformedStyle (Mirai, Liko) (Mofurun :+: LinkleStoneRuby)
( CureMiracle_Ruby
, CureMagical_Ruby
)
ghci> purificationSpeech (CureMiracle_Ruby, CureMagical_Ruby) (Mofurun :+: LinkleStoneRuby, LinkleStick :+: LinkleStoneRuby)
[ "リンクルステッキ！"
, "(モッフー！)"
, "ルビー！紅の情熱よ私達の手に！"
, "フルフルリンクル！"
, "プリキュア！ルビー・パッショナーレ！"
]
```

### 🆕Get Transformation / Purification Speech Different between Episodes

*Since v0.8.0.1*

By using the `:<` operator, you can replace some part of the speech into another episode's version. For example:

```haskell
ghci> members = (Manatsu, Sango, Minori, Asuka)
ghci> items = (TropicalPact :+: HeartKuruRingCureSummer, TropicalPact :+: HeartKuruRingCureCoral, TropicalPact :+: HeartKuruRingCurePapaya, TropicalPact :+: HeartKuruRingCureFlamingo)
ghci> transformationSpeech (members :< "うわさも吹き飛ぶ！") items
[ "プリキュア！トロピカルチェンジ！"
, "レッツメイク！キャッチ！"
, "チーク！"
, "アイズ！"
, "ヘアー！"
, "リップ！"
, "ドレス！"
, "ときめく常夏！キュアサマー！"
, "きらめく宝石！キュアコーラル！"
, "ひらめく果実（フルーツ）！キュアパパイア！"
, "はためく翼！キュアフラミンゴ！"
, "はーっ！"
, "うわさも吹き飛ぶ！"
, "トロピカル〜ジュ！プリキュア！"
]
```

Compare with `transformationSpeech members items`!

In addition to the example above, the following transformations and purifications can be replaced by `:<`:

From Tropical-Rouge! PreCure:

```haskell
purificationSpeech  (Laura :< "赤") MermaidAquaPot
```

From DokiDoki! PreCure:

```haskell
transformationSpeech (Mana :< "ヤギさん") (LovelyCommuneSharuru :+: CureLoveads)
transformationSpeech ((Mana, Rikka, Alice, Makoto) :< "バラさん") (LovelyCommuneSharuru :+: CureLoveads, LovelyCommuneRaquel :+: CureLoveads, LovelyCommuneLance :+: CureLoveads, LovelyCommuneDavi :+: CureLoveads)
transformationSpeech ((Mana, Rikka, Alice, Makoto, Aguri) :< "タコさん") (LovelyCommuneSharuru :+: CureLoveads, LovelyCommuneRaquel :+: CureLoveads, LovelyCommuneLance :+: CureLoveads, LovelyCommuneDavi :+: CureLoveads, LoveEyesPalette :+: CureLoveads)
```

### PreCure Monad

```haskell
ghci> :{
ghci> let scene = do
....>       say "この罪を抱いたまま、もう一度、グランプリンセスを目指す！"
....>       scarlet <- transform Towa (PrincessPerfume :+: DressUpKeyScarlet)
....>       scarletModeElegant <- transform scarlet (PrincessPerfume :+: DressUpKeyPhoenix)
....>       purify scarletModeElegant (ScarletViolin :+: DressUpKeyPhoenix)
ghci> :}
ghci> :t scene
scene
  :: Control.Monad.Skeleton.Skeleton
       ACME.PreCure.Monad.PreCureMonadBase ()
```

#### Transform and Purify as a Pure Function

```haskell
ghci> composeEpisode scene
[ "この罪を抱いたまま、もう一度、グランプリンセスを目指す！"
, "プリキュア！プリンセスエンゲージ！"
, "深紅の炎のプリンセス！キュアスカーレット！"
, "冷たい檻に閉ざされた夢、返していただきますわ。"
, "お覚悟を決めなさい！"
, "エクスチェンジ！モードエレガント！"
, "スカーレット・バイオリン！フェニックス！"
, "羽ばたけ炎の翼！"
, "プリキュア！ フェニックス・ブレイズ！"
, "ごきげんよう。"
]
```

#### Transform and Purify as an IO Action

The phrases are printed by line. Inspired by the similar feature of rubicure.

```haskell
ghci> printEpisode scene
この罪を抱いたまま、もう一度、グランプリンセスを目指す！
プリキュア！プリンセスエンゲージ！
深紅の炎のプリンセス！キュアスカーレット！
冷たい檻に閉ざされた夢、返していただきますわ。
お覚悟を決めなさい！
エクスチェンジ！モードエレガント！
スカーレット・バイオリン！フェニックス！
羽ばたけ炎の翼！
プリキュア！ フェニックス・ブレイズ！
ごきげんよう。
```
