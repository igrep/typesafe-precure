# 0.11.0.1

- Add transformations and purifications from "Wonderful Pretty Cure!".
- Use the transofrmers package for `PreCureMonad` instead of the monad-skelton package, which doesn't support the latest base.

# 0.10.1.2

- Add/correct the team transformations with Cure Majesty of "Soaring Sky! Pretty Cure". When Cure Majesty entered for the first time, her transformations is separated from others' transformations, but now they are merged. So it looks like that the merged transformation is more official.

# 0.10.1.1

- Add more transformations and purifications from "Soaring Sky! Pretty Cure", such as Cure Majesty and Majestic Halation etc.

# 0.10.0.1

- Add transformations and purifications from "Soaring Sky! Pretty Cure".
- Fix: forgot to add "Party Up Style" of "Delicious Party♡PreCure" as `TransformedGroup`.

# 0.9.1.1

- Add transformations and purifications of Cure Finale.
- Fix linter's warnings in the test suite.

# 0.9.0.1

- Add transformations and purifications from "Delicious Party♡PreCure" (except for Cure Finale).

# 0.8.2.2

- Add Cure Oasis and her transformation.

# 0.8.2.1

- From <https://github.com/igrep/typesafe-precure/pull/51>:
    - Add "PreCure Marine Beat Dynamic", and correct the phrase of "PreCure Land Beat Dynamic" from Tropical-Rouge PreCure.

# 0.8.1.1

- From <https://github.com/igrep/typesafe-precure/pull/51>:
    - Add Cure La Mer, her purifications, and "PreCure Land Beat Dynamic" from Tropical-Rouge PreCure.
    - Some minor fixes and refactorings in Tropical-Rouge PreCure.
- From <https://github.com/igrep/typesafe-precure/pull/50>:
    - Minor fixes in README.

# 0.8.0.1

- From <https://github.com/igrep/typesafe-precure/pull/49>:
    - Add `VaryingBetweenEpisodes (...)` instance for transformations in DokiDoki!
    - Use the pretty-simple package for pretty-printing in README.
- From <https://github.com/igrep/typesafe-precure/pull/48>:
    - Add Tropical-Rouge PreCure's characters and speech.
    - Correct Asumi's Japanese name.
    - Introduce the `VaryingBetweenEpisodes` type for Tropical-Rouge's transformation speech.
- From <https://github.com/igrep/typesafe-precure/pull/47>:
    - BREAKING CHANGE: Use the new `:+:` type to express the "item and attachments" relationship.
        - Before this change, any types representing a special item have type variables of the attachments. This design works with the almost all items, except with the items introduced several years ago. For example, Cure Cosmo's Rainbow Perfume has usually an attachment, and sometimes not. In Haskell's type system, any types with type variables must have its type variables filled to be an ordinary type. To support such items which occasionally use attachments, I deleted any type variables from the types of the special items. Now we must use `:+:` to represent "item and attachments" relationship instead.
    - Add several purifications in Star☆Twinkle PreCure.
    - Add several purifications of Cure Earth.
    - Fix the transformation into Cure Earth by Asumi.
    - Fix build error in Hackage: Now explicitly depends on autoexporter!
    - Cosmetic changes.

# 0.7.11.1

- Add Healin'Good PreCure's transformation without Hinata.

# 0.7.10.1

- Add Healin'Good PreCure's new purification and transformation.
- Fix the English name of Healin'Good PreCure as a transformed group.

# 0.7.9.1

- Add the transformations by Cure Grace, Cure Sparkle, and Cure Earth.

# 0.7.8.1

- Add more purifications of Healin' Good♡PreCure, and Cure Earth.
- Correct members of some group transformations in Healin' Good♡PreCure.

# 0.7.7.1

- Add Healin' Good♡PreCure PreCure's characters and some of their purifications and transformations.

# 0.7.6.2

- Correct Yuni's transformation [#40](https://github.com/igrep/typesafe-precure/pull/40)

# 0.7.6.1

- Add Shiny Twinkle Pen and its purification in Star☆Twinkle PreCure.

# 0.7.5.1

- Add Cure Cosmo and other new purifications of Star☆Twinkle PreCure.

# 0.7.4.1

- Add Star☆Twinkle PreCure's purifications and special items:
    - Libra Soleil Shoot
    - Scorpius Soleil Shoot
    - Capricorn Selene Arrow
    - Southern Cross Shot
- Correct some of the Japanese names in StarTwinkle: [#34](https://github.com/igrep/typesafe-precure/pull/34). Thanks [\@tsuka](https://github.com/tsuka)!

# 0.7.3.1

- Add Star☆Twinkle PreCure's characters and some of their purifications and transformations.

# 0.7.2.1

- Add Hugtto! PreCure Mother Heart Style
- Add Cure Infini's transformation.

# 0.7.1.1

- Add Hugtto! PreCure Cheerful Style

# 0.7.0.1

- Add 「フッ...」 in `introducesHerselfAs` of `Felice`
    - <https://github.com/igrep/typesafe-precure/pull/27>
- Collect all PreCures into cure-index.json and restructure the `ACME.PreCure.Textbook.*` modules.
    - <https://github.com/igrep/typesafe-precure/pull/25>
    - <https://github.com/igrep/typesafe-precure/pull/26>
    - By this change, `ACME.PreCure.Textbook` (including its children) exports only data types.  
      Say good bye to the a little ugly names such as `girlName_Mana`.

# 0.6.3.1

- Add: Cure Macherie, Cure Amour, and their purifications.

# 0.6.2.1 (2018/05/02)

- Add: Hugtto! PreCure's new purifications.

# 0.6.1.1 (2018/03/12)

- Add: Hugtto! PreCure.

# 0.5.1.1 (2018/01/16)

- Add: Cure Pekorin's transformation.
- Fix: Hide almost never reusable modules.

# 0.5.0.1 (2017/12/02)

- Fix: Correct transformers of A La Mode Style.
    - Forgot to add Cure Parfait!

# 0.5.0.0 (2017/12/02)

- Add: More transformations and purifications of Kirakira :star: PreCure A La Mode:
    - Variation: A La Mode Style
    - Purification: Fantastic Animalé
    - Special Item: Sweets Castle
    - Transformed Groups of Kirakira :star: PreCure A La Mode
- Add: `variationEn` property of `transformees` in Cure Index.
- Add: `transformedGroups` in Cure Index.
- Incompatible Change:
    - Renamed `variation` property of `transformees` in Cure Index into `variationJa`.

# 0.4.0.0 (2017/10/07)

- Add: More transformations and purifications of Kirakira :star: PreCure A La Mode, including Cure Parfait's and Kirakiraru Creamer's.
- Add: Experimental feature: [cure-index.json](https://github.com/igrep/typesafe-precure/blob/master/gen/cure-index.json) and [pretty-cure-index.json](https://github.com/igrep/typesafe-precure/blob/master/gen/pretty-cure-index.json) are generated at build-time by Template Haskell.
    - Currently, only data of Kirakira :star: A La Mode is collected.

# 0.3.1.1 (2017/06/05)

- Improve documentation :memo: : Add README and CHANGELOG to extra-source-files, to make README readable on hackage.org.
- Correct README:
    - As of 0.3.0.0 this package actually supports Kirakira :star: A La Mode!
    - Since the initial release, this package actually supports Cure Mofurun!

# 0.3.1.0 (2017/06/05)

- Add: More transformations and purifications of Kirakira :star: PreCure A La Mode.

# 0.3.0.0 (2017/04/23)

- Add: Transformations and a purification of Kirakira :star: PreCure A La Mode.

# 0.2.0.0 (2016/12/12)

- Breaking Change: Change the signature of `transform`.
    - Before: `transform :: (Transformation g' i') => g' -> i' -> (Style g' i' -> PreCureMonad x) -> PreCureMonad x`
    - After: `transform :: (Transformation g' i') => g' -> i' -> PreCureMonad (Style g' i')`
    - To make it easier to get transformed style when using `transform`.

# 0.1.0.0 (2016/12/11)

Initial Release
