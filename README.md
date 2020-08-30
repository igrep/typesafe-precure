# TypeSafe PreCure!!

[![Hackage](https://img.shields.io/hackage/v/typesafe-precure.svg)](http://hackage.haskell.org/package/typesafe-precure)
[![CircleCI](https://circleci.com/gh/igrep/typesafe-precure.svg?style=svg)](https://circleci.com/gh/igrep/typesafe-precure)

Type-safe transformations and purifications of PreCures (Japanese Battle Heroine).  
Written in Haskell.

## Features

- Collection of Japanese battle heroines "PreCure"  and their transformation and purification phrases.
    - Currently, supports from the first season to "Healin' Good♡Precure", including Cure Echo, Cure Mofurun, Cure Pekorin, and Cure Infini!
- Monadic actions to play the speech of their transformations and purifications.

## Characteristics

**Each girl/PreCure/PreCure's variation/special item has her/its own type**.  
So only correct combinations of girls/PreCures and items can transform and purify.  
Compared with other PreCure implementations such as rubicure, clocure, etc., this makes it *much harder* to use, but it reproduces the settings more correctly.  
*Correctness* is more important for this library.

## Installation

```sh
# unicode-show is optional. But recommended if you try it on GHCi.
$ stack install typesafe-precure unicode-show
## ... OR
$ cabal install typesafe-precure unicode-show
```

## Example Usage

**Note**:
- To `show` Japanese characters in GHCi, use [unicode-show](https://github.com/nushio3/unicode-show)
- Output of GHCi below is prettified by hand.

### Get transformed PreCure, etc.

```haskell
$ ghci -interactive-print=Text.Show.Unicode.uprint

ghci> :m ACME.PreCure
ghci> transformationSpeech (Mirai, Liko) (Mofurun LinkleStoneDia)
[ "キュアップ・ラパパ！　ダイヤ！"
, "ミラクル・マジカル・ジュエリーレ！"
, "ふたりの奇跡！キュアミラクル！"
, "ふたりの魔法！キュアマジカル！"
, "魔法つかいプリキュア！！"
]
ghci> transformedStyle (Mirai, Liko) (Mofurun LinkleStoneRuby)
(CureMiracle_Ruby, CureMagical_Ruby)
ghci> purificationSpeech (CureMiracle_Ruby, CureMagical_Ruby) (LinkleStick LinkleStoneRuby, Mofurun LinkleStoneRuby)
[ "リンクルステッキ！"
, "(モッフー！)"
, "ルビー！紅の情熱よ私達の手に！"
, "フルフルリンクル！"
, "プリキュア！ルビー・パッショナーレ！"
]
```

### PreCure Monad

```haskell
ghci> :{
ghci> let scene = do
....>       say "この罪を抱いたまま、もう一度、グランプリンセスを目指す！"
....>       scarlet <- transform Towa (PrincessPerfume DressUpKeyScarlet)
....>       scarletModeElegant <- transform scarlet (PrincessPerfume DressUpKeyPhoenix)
....>       purify scarletModeElegant (ScarletViolin DressUpKeyPhoenix)
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
