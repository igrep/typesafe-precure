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
