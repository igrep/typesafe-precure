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
