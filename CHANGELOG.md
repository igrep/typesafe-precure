# 0.2.0.0 (2016/12/11)

- Breaking Change: Change the signature of `transform`.
    - Before: `transform :: (Transformation g' i') => g' -> i' -> (Style g' i' -> PreCureMonad x) -> PreCureMonad x`
    - After: `transform :: (Transformation g' i') => g' -> i' -> PreCureMonad (Style g' i')`
    - To make it easier to get transformed style when using `transform`.

# 0.1.0.0 (2016/12/11)

Initial Release
