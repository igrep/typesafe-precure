{-# LANGUAGE RebindableSyntax #-}

module AllPreCureM where

import           ACME.PreCure
import           ACME.PreCure.Monad.Super


act_CureHeart_LovelyCommuneSharuru_CureLoveads = printEpisode $ do
  enter Mana
  transform Mana (LovelyCommuneSharuru CureLoveads)
  purify CureHeart (LovelyCommuneSharuru CureLoveads)

  -- NO NONITEM PURIFICATIONS


act_CureDiamond_LovelyCommuneRaquel_CureLoveads = printEpisode $ do
  enter Rikka
  transform Rikka (LovelyCommuneRaquel CureLoveads)
  purify CureDiamond (LovelyCommuneRaquel CureLoveads)

  -- NO NONITEM PURIFICATIONS


act_CureRosetta_LovelyCommuneLance_CureLoveads = printEpisode $ do
  enter Alice
  transform Alice (LovelyCommuneLance CureLoveads)
  purify CureRosetta (LovelyCommuneLance CureLoveads)

  -- NO NONITEM PURIFICATIONS


act_CureSword_LovelyCommuneDavi_CureLoveads = printEpisode $ do
  enter Makoto
  transform Makoto (LovelyCommuneDavi CureLoveads)
  purify CureSword (LovelyCommuneDavi CureLoveads)

  -- NO NONITEM PURIFICATIONS


act_CureAce_LoveEyesPalette_CureLoveads = printEpisode $ do
  enter Aguri
  transform Aguri (LoveEyesPalette CureLoveads)
  purify CureAce LoveKissRouge

  -- NO NONITEM PURIFICATIONS


act_CureHeart_CureDiamond_CureRosetta_CureSword_LovelyCommuneSharuru_CureLoveads_LovelyCommuneRaquel_CureLoveads_LovelyCommuneLance_CureLoveads_LovelyCommuneDavi_CureLoveads = printEpisode $ do
  enter Mana
  enter Rikka
  enter Alice
  enter Makoto
  -- TODO: support tuple of girls: transform (Mana, Rikka, Alice, Makoto) ((LovelyCommuneSharuru CureLoveads), (LovelyCommuneRaquel CureLoveads), (LovelyCommuneLance CureLoveads), (LovelyCommuneDavi CureLoveads))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureHeart_CureDiamond_CureRosetta_CureSword_CureAce_LovelyCommuneSharuru_CureLoveads_LovelyCommuneRaquel_CureLoveads_LovelyCommuneLance_CureLoveads_LovelyCommuneDavi_CureLoveads_LoveEyesPalette_CureLoveads = printEpisode $ do
  enter Mana
  enter Rikka
  enter Alice
  enter Makoto
  enter Aguri
  -- TODO: support tuple of girls: transform (Mana, Rikka, Alice, Makoto, Aguri) ((LovelyCommuneSharuru CureLoveads), (LovelyCommuneRaquel CureLoveads), (LovelyCommuneLance CureLoveads), (LovelyCommuneDavi CureLoveads), (LoveEyesPalette CureLoveads))
  -- TODO: support tuple of PreCures: purify (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce) (MagicalLovelyHarp CureLoveads)

  -- NO NONITEM PURIFICATIONS


act_CureBlack_CureWhite_CardCommuneMepple_CardCommuneMipple = printEpisode $ do
  enter Nagisa
  enter Honoka
  -- TODO: support tuple of girls: transform (Nagisa, Honoka) (CardCommuneMepple, CardCommuneMipple)
  -- TODO: support tuple of PreCures: purify (CureBlack, CureWhite) RainbowBracelets

  -- TODO: support tuple of PreCures: purifyWithoutItem (CureBlack, CureWhite)


act_CurePeach_Linkrun = printEpisode $ do
  enter Love
  transform Love Linkrun
  purify CurePeach CureStickPeachRod

  purifyWithoutItem CurePeach


act_CureBerry_Linkrun = printEpisode $ do
  enter Miki
  transform Miki Linkrun
  purify CureBerry CureStickBerrySword

  purifyWithoutItem CureBerry


act_CurePine_Linkrun = printEpisode $ do
  enter Inori
  transform Inori Linkrun
  purify CurePine CureStickPineFlute

  purifyWithoutItem CurePine


act_CurePassion_Linkrun = printEpisode $ do
  enter Setsuna
  transform Setsuna Linkrun
  purify CurePassion PassionHarp

  -- NO NONITEM PURIFICATIONS


act_CurePeach_CureBerry_CurePine_CurePassion_Linkrun = printEpisode $ do
  enter Love
  enter Miki
  enter Inori
  enter Setsuna
  -- TODO: support tuple of girls: transform (Love, Miki, Inori, Setsuna) Linkrun
  -- TODO: support tuple of PreCures: purify (CurePeach, CureBerry, CurePine, CurePassion) CloverBox

  -- NO NONITEM PURIFICATIONS


act_CureFlora_PrincessPerfume_DressUpKeyFlora = printEpisode $ do
  enter Haruka
  transform Haruka (PrincessPerfume DressUpKeyFlora)
  purify CureFlora (CrystalPrincessRod DressUpKeyRose)
  purify CureFlora (CrystalPrincessRod DressUpKeyLily)
  purify CureFlora (MusicPrincessPalace DressUpKeySakura)

  -- NO NONITEM PURIFICATIONS


act_CureMermaid_PrincessPerfume_DressUpKeyMermaid = printEpisode $ do
  enter Minami
  transform Minami (PrincessPerfume DressUpKeyMermaid)
  purify CureMermaid (CrystalPrincessRod DressUpKeyIce)
  purify CureMermaid (CrystalPrincessRod DressUpKeyBubble)
  purify CureMermaid (MusicPrincessPalace DressUpKeySango)

  -- NO NONITEM PURIFICATIONS


act_CureTwinkle_PrincessPerfume_DressUpKeyTwinkle = printEpisode $ do
  enter Kirara
  transform Kirara (PrincessPerfume DressUpKeyTwinkle)
  purify CureTwinkle (CrystalPrincessRod DressUpKeyLuna)
  purify CureTwinkle (CrystalPrincessRod DressUpKeyShootingStar)
  purify CureTwinkle (MusicPrincessPalace DressUpKeyGinga)

  -- NO NONITEM PURIFICATIONS


act_CureScarlet_PrincessPerfume_DressUpKeyScarlet = printEpisode $ do
  enter Towa
  transform Towa (PrincessPerfume DressUpKeyScarlet)
  purify CureScarlet (ScarletViolin DressUpKeyScarlet)
  purify CureScarlet (ScarletViolin DressUpKeyHanabi)
  purify CureScarlet (MusicPrincessPalace DressUpKeySun)

  -- NO NONITEM PURIFICATIONS


act_CureFlora_ModeElegant_PrincessPerfume_DressUpKeyFlora = printEpisode $ do
  enter CureFlora
  -- TODO: support multi-level transformation: transform CureFlora (PrincessPerfume DressUpKeyFlora)
  -- NO PURIFICATIONS
  -- TODO: support multi-level transformation: purifyWithoutItem CureFlora_ModeElegant


act_CureMermaid_ModeElegant_PrincessPerfume_DressUpKeyMermaid = printEpisode $ do
  enter CureMermaid
  -- TODO: support multi-level transformation: transform CureMermaid (PrincessPerfume DressUpKeyMermaid)
  -- NO PURIFICATIONS
  -- TODO: support multi-level transformation: purifyWithoutItem CureMermaid_ModeElegant


act_CureTwinkle_ModeElegant_PrincessPerfume_DressUpKeyTwinkle = printEpisode $ do
  enter CureTwinkle
  -- TODO: support multi-level transformation: transform CureTwinkle (PrincessPerfume DressUpKeyTwinkle)
  -- NO PURIFICATIONS
  -- TODO: support multi-level transformation: purifyWithoutItem CureTwinkle_ModeElegant


act_CureScarlet_ModeElegant_PrincessPerfume_DressUpKeyPhoenix = printEpisode $ do
  enter CureScarlet
  -- TODO: support multi-level transformation: transform CureScarlet (PrincessPerfume DressUpKeyPhoenix)
  -- TODO: support multi-level transformation: purify CureScarlet_ModeElegant (ScarletViolin DressUpKeyPhoenix)

  -- NO NONITEM PURIFICATIONS


act_CureFlora_CureMermaid_CureTwinkle_PrincessPerfume_DressUpKeyFlora_PrincessPerfume_DressUpKeyMermaid_PrincessPerfume_DressUpKeyTwinkle = printEpisode $ do
  enter Haruka
  enter Minami
  enter Kirara
  -- TODO: support tuple of girls: transform (Haruka, Minami, Kirara) ((PrincessPerfume DressUpKeyFlora), (PrincessPerfume DressUpKeyMermaid), (PrincessPerfume DressUpKeyTwinkle))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureFlora_CureMermaid_CureTwinkle_CureScarlet_PrincessPerfume_DressUpKeyFlora_PrincessPerfume_DressUpKeyMermaid_PrincessPerfume_DressUpKeyTwinkle_PrincessPerfume_DressUpKeyScarlet = printEpisode $ do
  enter Haruka
  enter Minami
  enter Kirara
  enter Towa
  -- TODO: support tuple of girls: transform (Haruka, Minami, Kirara, Towa) ((PrincessPerfume DressUpKeyFlora), (PrincessPerfume DressUpKeyMermaid), (PrincessPerfume DressUpKeyTwinkle), (PrincessPerfume DressUpKeyScarlet))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureFlora_ModeElegantRoyal_CureMermaid_ModeElegantRoyal_CureTwinkle_ModeElegantRoyal_CureScarlet_ModeElegantRoyal_MusicPrincessPalace_RoyalDressUpKey = printEpisode $ do
  enter CureFlora
  enter CureMermaid
  enter CureTwinkle
  enter CureScarlet
  -- TODO: support tuple of girls: transform (CureFlora, CureMermaid, CureTwinkle, CureScarlet) (MusicPrincessPalace RoyalDressUpKey)
  -- TODO: support tuple of PreCures: purify (CureFlora_ModeElegantRoyal, CureMermaid_ModeElegantRoyal, CureTwinkle_ModeElegantRoyal, CureScarlet_ModeElegantRoyal) (MusicPrincessPalace RoyalDressUpKey)

  -- NO NONITEM PURIFICATIONS


act_CureLovely_PreChanMirror_PreCardLovely = printEpisode $ do
  enter Megumi
  transform Megumi (PreChanMirror PreCardLovely)
  purify CureLovely LovePreBrace

  -- NO NONITEM PURIFICATIONS


act_CurePrincess_PreChanMirror_PreCardPrincess = printEpisode $ do
  enter Hime
  transform Hime (PreChanMirror PreCardPrincess)
  purify CurePrincess LovePreBrace

  -- NO NONITEM PURIFICATIONS


act_CureHoney_PreChanMirror_PreCardHoney = printEpisode $ do
  enter Yuko
  transform Yuko (PreChanMirror PreCardHoney)
  purify CureHoney TripleDanceHoneyBaton

  -- NO NONITEM PURIFICATIONS


act_CureFortune_FortunePiano_PreCardFortune = printEpisode $ do
  enter Iona
  transform Iona (FortunePiano PreCardFortune)
  purify CureFortune FortuneTambourine

  -- NO NONITEM PURIFICATIONS


act_CureLovely_CurePrincess_PreChanMirror_PreCardLovely_PreChanMirror_PreCardPrincess = printEpisode $ do
  enter Megumi
  enter Hime
  -- TODO: support tuple of girls: transform (Megumi, Hime) ((PreChanMirror PreCardLovely), (PreChanMirror PreCardPrincess))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureLovely_CurePrincess_CureHoney_PreChanMirror_PreCardLovely_PreChanMirror_PreCardPrincess_PreChanMirror_PreCardHoney = printEpisode $ do
  enter Megumi
  enter Hime
  enter Yuko
  -- TODO: support tuple of girls: transform (Megumi, Hime, Yuko) ((PreChanMirror PreCardLovely), (PreChanMirror PreCardPrincess), (PreChanMirror PreCardHoney))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureLovely_CurePrincess_CureHoney_CureFortune_PreChanMirror_PreCardLovely_PreChanMirror_PreCardPrincess_PreChanMirror_PreCardHoney_FortunePiano_PreCardFortune = printEpisode $ do
  enter Megumi
  enter Hime
  enter Yuko
  enter Iona
  -- TODO: support tuple of girls: transform (Megumi, Hime, Yuko, Iona) ((PreChanMirror PreCardLovely), (PreChanMirror PreCardPrincess), (PreChanMirror PreCardHoney), (FortunePiano PreCardFortune))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureLovely_InnocentForm_CurePrincess_InnocentForm_CureHoney_InnocentForm_CureFortune_InnocentForm_PreChanMirror_PreCardLovelyInnocentForm_PreChanMirror_PreCardPrincessInnocentForm_PreChanMirror_PreCardHoneyInnocentForm_FortunePiano_PreCardFortuneInnocentForm = printEpisode $ do
  enter CureLovely
  enter CurePrincess
  enter CureHoney
  enter CureFortune
  -- TODO: support tuple of girls: transform (CureLovely, CurePrincess, CureHoney, CureFortune) ((PreChanMirror PreCardLovelyInnocentForm), (PreChanMirror PreCardPrincessInnocentForm), (PreChanMirror PreCardHoneyInnocentForm), (FortunePiano PreCardFortuneInnocentForm))
  -- TODO: support tuple of PreCures: purify (CureLovely_InnocentForm, CurePrincess_InnocentForm, CureHoney_InnocentForm, CureFortune_InnocentForm) (ShiningMakeDresser, InnocentHarmonyMic)

  -- NO NONITEM PURIFICATIONS


act_CureBlossom_HeartPerfume_PreCureSeed = printEpisode $ do
  enter Tsubomi
  transform Tsubomi (HeartPerfume PreCureSeed)
  purify CureBlossom BlossomTakt

  -- NO NONITEM PURIFICATIONS


act_CureMarine_HeartPerfume_PreCureSeed = printEpisode $ do
  enter Erika
  transform Erika (HeartPerfume PreCureSeed)
  purify CureMarine MarineTakt

  -- NO NONITEM PURIFICATIONS


act_CureSunshine_ShinyPerfume_PreCureSeed = printEpisode $ do
  enter Itsuki
  transform Itsuki (ShinyPerfume PreCureSeed)
  purify CureSunshine ShinyTambourine

  -- NO NONITEM PURIFICATIONS


act_CureMoonlight_HeartPot_PreCureSeed = printEpisode $ do
  enter Yuri
  transform Yuri (HeartPot PreCureSeed)
  purify CureMoonlight MoonTakt

  -- NO NONITEM PURIFICATIONS


act_CureBlossom_CureMarine_CureSunshine_CureMoonlight_HeartPerfume_PreCureSeed_HeartPerfume_PreCureSeed_ShinyPerfume_PreCureSeed_HeartPot_PreCureSeed = printEpisode $ do
  enter Tsubomi
  enter Erika
  enter Itsuki
  enter Yuri
  -- TODO: support tuple of girls: transform (Tsubomi, Erika, Itsuki, Yuri) ((HeartPerfume PreCureSeed), (HeartPerfume PreCureSeed), (ShinyPerfume PreCureSeed), (HeartPot PreCureSeed))
  -- TODO: support tuple of PreCures: purify (CureBlossom, CureMarine, CureSunshine, CureMoonlight) (HeartCatchMirage SuperPreCureSeed)

  -- NO NONITEM PURIFICATIONS


act_SuperCureBlossom_SuperCureMarine_SuperCureSunshine_SuperCureMoonlight_HeartCatchMirage_SuperPreCureSeed = printEpisode $ do
  enter CureBlossom
  enter CureMarine
  enter CureSunshine
  enter CureMoonlight
  -- TODO: support tuple of girls: transform (CureBlossom, CureMarine, CureSunshine, CureMoonlight) (HeartCatchMirage SuperPreCureSeed)
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureYell_PreHeart_MiraiCrystalPink = printEpisode $ do
  enter Hana
  transform Hana (PreHeart MiraiCrystalPink)
  purify CureYell (PreHeart MiraiCrystalPink)
  purify CureYell (MelodySword MiraiCrystalRose)

  -- NO NONITEM PURIFICATIONS


act_CureAnge_PreHeart_MiraiCrystalBlue = printEpisode $ do
  enter Saaya
  transform Saaya (PreHeart MiraiCrystalBlue)
  purify CureAnge (PreHeart MiraiCrystalBlue)
  purify CureAnge (MelodySword MiraiCrystalNavy)

  -- NO NONITEM PURIFICATIONS


act_CureEtoile_PreHeart_MiraiCrystalYellow = printEpisode $ do
  enter Homare
  transform Homare (PreHeart MiraiCrystalYellow)
  purify CureEtoile (PreHeart MiraiCrystalYellow)
  purify CureEtoile (MelodySword MiraiCrystalOrange)

  -- NO NONITEM PURIFICATIONS


act_CureYell_CureAnge_CureEtoile_PreHeart_MiraiCrystalPink_PreHeart_MiraiCrystalBlue_PreHeart_MiraiCrystalYellow = printEpisode $ do
  enter Hana
  enter Saaya
  enter Homare
  -- TODO: support tuple of girls: transform (Hana, Saaya, Homare) ((PreHeart MiraiCrystalPink), (PreHeart MiraiCrystalBlue), (PreHeart MiraiCrystalYellow))
  -- TODO: support tuple of PreCures: purify (CureYell, CureAnge, CureEtoile) ((MelodySword MiraiCrystalRose), (MelodySword MiraiCrystalNavy), (MelodySword MiraiCrystalOrange))

  -- NO NONITEM PURIFICATIONS


act_CureMacherie_CureAmour_PreHeart_MiraiCrystalRed_PreHeart_MiraiCrystalPurple = printEpisode $ do
  enter Emiru
  enter Ruru
  -- TODO: support tuple of girls: transform (Emiru, Ruru) ((PreHeart MiraiCrystalRed), (PreHeart MiraiCrystalPurple))
  -- TODO: support tuple of PreCures: purify (CureMacherie, CureAmour) ((TwinLoveGuitar MiraiCrystalRouge), (TwinLoveGuitar MiraiCrystalViolet))

  -- NO NONITEM PURIFICATIONS


act_CureYell_CureAnge_CureEtoile_CureMacherie_CureAmour_PreHeart_MiraiCrystalPink_PreHeart_MiraiCrystalBlue_PreHeart_MiraiCrystalYellow_PreHeart_MiraiCrystalRed_PreHeart_MiraiCrystalPurple = printEpisode $ do
  enter Hana
  enter Saaya
  enter Homare
  enter Emiru
  enter Ruru
  -- TODO: support tuple of girls: transform (Hana, Saaya, Homare, Emiru, Ruru) ((PreHeart MiraiCrystalPink), (PreHeart MiraiCrystalBlue), (PreHeart MiraiCrystalYellow), (PreHeart MiraiCrystalRed), (PreHeart MiraiCrystalPurple))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureYell_CheerfulStyle_CureAnge_CheerfulStyle_CureEtoile_CheerfulStyle_CureMacherie_CheerfulStyle_CureAmour_CheerfulStyle_Hugtan_CheerfulStyle_MemorialCureClock_MiraiPad_MiraiCrystalCheerful = printEpisode $ do
  enter CureYell
  enter CureAnge
  enter CureEtoile
  enter CureMacherie
  enter CureAmour
  enter Hugtan
  -- TODO: support tuple of girls: transform (CureYell, CureAnge, CureEtoile, CureMacherie, CureAmour, Hugtan) (MemorialCureClock (MiraiPad MiraiCrystalCheerful))
  -- TODO: support tuple of PreCures: purify (CureYell_CheerfulStyle, CureAnge_CheerfulStyle, CureEtoile_CheerfulStyle, CureMacherie_CheerfulStyle, CureAmour_CheerfulStyle, Hugtan_CheerfulStyle) (MemorialCureClock (MiraiPad MiraiCrystalCheerful))

  -- NO NONITEM PURIFICATIONS


act_CureWhip_SweetsPact_RabbitShortcake = printEpisode $ do
  enter Ichika
  transform Ichika (SweetsPact RabbitShortcake)
  purify CureWhip CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureCustard_SweetsPact_SquirrelPudding = printEpisode $ do
  enter Himari
  transform Himari (SweetsPact SquirrelPudding)
  purify CureCustard CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureGelato_SweetsPact_LionIce = printEpisode $ do
  enter Aoi
  transform Aoi (SweetsPact LionIce)
  purify CureGelato CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureMacaron_SweetsPact_CatMacaron = printEpisode $ do
  enter Yukari
  transform Yukari (SweetsPact CatMacaron)
  purify CureMacaron CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureChocolat_SweetsPact_DogChocolate = printEpisode $ do
  enter Akira
  transform Akira (SweetsPact DogChocolate)
  purify CureChocolat CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureParfait_SweetsPact_PegasusParfait = printEpisode $ do
  enter Ciel
  transform Ciel (SweetsPact PegasusParfait)
  purify CureParfait RainbowRibbon

  -- NO NONITEM PURIFICATIONS


act_CurePekorin_SweetsPact_PekorinDonut = printEpisode $ do
  enter Pekorin
  transform Pekorin (SweetsPact PekorinDonut)
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureWhip_CureCustard_CureGelato_CureMacaron_CureChocolat_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_CatMacaron_SweetsPact_DogChocolate = printEpisode $ do
  enter Ichika
  enter Himari
  enter Aoi
  enter Yukari
  enter Akira
  -- TODO: support tuple of girls: transform (Ichika, Himari, Aoi, Yukari, Akira) ((SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact CatMacaron), (SweetsPact DogChocolate))
  -- TODO: support tuple of PreCures: purify (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat) CandyRod

  -- NO NONITEM PURIFICATIONS


act_CureWhip_CureCustard_CureGelato_CureMacaron_CureChocolat_CureParfait_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_CatMacaron_SweetsPact_DogChocolate_SweetsPact_PegasusParfait = printEpisode $ do
  enter Ichika
  enter Himari
  enter Aoi
  enter Yukari
  enter Akira
  enter Ciel
  -- TODO: support tuple of girls: transform (Ichika, Himari, Aoi, Yukari, Akira, Ciel) ((SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact CatMacaron), (SweetsPact DogChocolate), (SweetsPact PegasusParfait))
  -- TODO: support tuple of PreCures: purify (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat, CureParfait) ((KirakiraruCreamer CrystalAnimalRabbit), (KirakiraruCreamer CrystalAnimalSquirrel), (KirakiraruCreamer CrystalAnimalLion), (KirakiraruCreamer CrystalAnimalCat), (KirakiraruCreamer CrystalAnimalDog), (KirakiraruCreamer CrystalAnimalPegasus))

  -- NO NONITEM PURIFICATIONS


act_CureCustard_CureWhip_CureGelato_CureMacaron_CureChocolat_SweetsPact_SquirrelPudding_SweetsPact_RabbitShortcake_SweetsPact_LionIce_SweetsPact_CatMacaron_SweetsPact_DogChocolate = printEpisode $ do
  enter Himari
  enter Ichika
  enter Aoi
  enter Yukari
  enter Akira
  -- TODO: support tuple of girls: transform (Himari, Ichika, Aoi, Yukari, Akira) ((SweetsPact SquirrelPudding), (SweetsPact RabbitShortcake), (SweetsPact LionIce), (SweetsPact CatMacaron), (SweetsPact DogChocolate))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureGelato_CureWhip_CureCustard_CureMacaron_CureChocolat_SweetsPact_LionIce_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_CatMacaron_SweetsPact_DogChocolate = printEpisode $ do
  enter Aoi
  enter Ichika
  enter Himari
  enter Yukari
  enter Akira
  -- TODO: support tuple of girls: transform (Aoi, Ichika, Himari, Yukari, Akira) ((SweetsPact LionIce), (SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact CatMacaron), (SweetsPact DogChocolate))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMacaron_CureWhip_CureCustard_CureGelato_CureChocolat_SweetsPact_CatMacaron_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_DogChocolate = printEpisode $ do
  enter Yukari
  enter Ichika
  enter Himari
  enter Aoi
  enter Akira
  -- TODO: support tuple of girls: transform (Yukari, Ichika, Himari, Aoi, Akira) ((SweetsPact CatMacaron), (SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact DogChocolate))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureChocolat_CureWhip_CureCustard_CureGelato_CureMacaron_SweetsPact_DogChocolate_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_CatMacaron = printEpisode $ do
  enter Akira
  enter Ichika
  enter Himari
  enter Aoi
  enter Yukari
  -- TODO: support tuple of girls: transform (Akira, Ichika, Himari, Aoi, Yukari) ((SweetsPact DogChocolate), (SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact CatMacaron))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureParfait_CureWhip_CureCustard_CureGelato_CureMacaron_CureChocolat_SweetsPact_PegasusParfait_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_CatMacaron_SweetsPact_DogChocolate = printEpisode $ do
  enter Ciel
  enter Ichika
  enter Himari
  enter Aoi
  enter Yukari
  enter Akira
  -- TODO: support tuple of girls: transform (Ciel, Ichika, Himari, Aoi, Yukari, Akira) ((SweetsPact PegasusParfait), (SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact CatMacaron), (SweetsPact DogChocolate))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureWhip_CureCustard_CureGelato_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce = printEpisode $ do
  enter Ichika
  enter Himari
  enter Aoi
  -- TODO: support tuple of girls: transform (Ichika, Himari, Aoi) ((SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureWhip_CureCustard_CureGelato_CureMacaron_SweetsPact_RabbitShortcake_SweetsPact_SquirrelPudding_SweetsPact_LionIce_SweetsPact_CatMacaron = printEpisode $ do
  enter Ichika
  enter Himari
  enter Aoi
  enter Yukari
  -- TODO: support tuple of girls: transform (Ichika, Himari, Aoi, Yukari) ((SweetsPact RabbitShortcake), (SweetsPact SquirrelPudding), (SweetsPact LionIce), (SweetsPact CatMacaron))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMacaron_CureChocolat_SweetsPact_CatMacaron_SweetsPact_DogChocolate = printEpisode $ do
  enter Yukari
  enter Akira
  -- TODO: support tuple of girls: transform (Yukari, Akira) ((SweetsPact CatMacaron), (SweetsPact DogChocolate))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureWhip_ALaModeStyle_CureCustard_ALaModeStyle_CureGelato_ALaModeStyle_CureMacaron_ALaModeStyle_CureChocolat_ALaModeStyle_CureParfait_ALaModeStyle_KirakiraruCreamer_SweetsCastle = printEpisode $ do
  enter CureWhip
  enter CureCustard
  enter CureGelato
  enter CureMacaron
  enter CureChocolat
  enter CureParfait
  -- TODO: support tuple of girls: transform (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat, CureParfait) (KirakiraruCreamer SweetsCastle)
  -- TODO: support tuple of PreCures: purify (CureWhip_ALaModeStyle, CureCustard_ALaModeStyle, CureGelato_ALaModeStyle, CureMacaron_ALaModeStyle, CureChocolat_ALaModeStyle, CureParfait_ALaModeStyle) ((KirakiraruCreamer SweetsCastle), (KirakiraruCreamer CrystalAnimalRabbit), (KirakiraruCreamer CrystalAnimalSquirrel), (KirakiraruCreamer CrystalAnimalLion), (KirakiraruCreamer CrystalAnimalCat), (KirakiraruCreamer CrystalAnimalDog), (KirakiraruCreamer CrystalAnimalPegasus))

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_CureMagical_Mofurun_LinkleStoneDia = printEpisode $ do
  enter Mirai
  enter Liko
  -- TODO: support tuple of girls: transform (Mirai, Liko) (Mofurun LinkleStoneDia)
  -- TODO: support tuple of PreCures: purify (CureMiracle, CureMagical) ((Mofurun LinkleStoneDia), (LinkleStick LinkleStoneDia))

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Ruby_CureMagical_Ruby_Mofurun_LinkleStoneRuby = printEpisode $ do
  enter Mirai
  enter Liko
  -- TODO: support tuple of girls: transform (Mirai, Liko) (Mofurun LinkleStoneRuby)
  -- TODO: support tuple of PreCures: purify (CureMiracle_Ruby, CureMagical_Ruby) ((Mofurun LinkleStoneRuby), (LinkleStick LinkleStoneRuby))

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Sapphire_CureMagical_Sapphire_Mofurun_LinkleStoneSapphire = printEpisode $ do
  enter Mirai
  enter Liko
  -- TODO: support tuple of girls: transform (Mirai, Liko) (Mofurun LinkleStoneSapphire)
  -- TODO: support tuple of PreCures: purify (CureMiracle_Sapphire, CureMagical_Sapphire) ((Mofurun LinkleStoneSapphire), (LinkleStick LinkleStoneSapphire))

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Topaz_CureMagical_Topaz_Mofurun_LinkleStoneTopaz = printEpisode $ do
  enter Mirai
  enter Liko
  -- TODO: support tuple of girls: transform (Mirai, Liko) (Mofurun LinkleStoneTopaz)
  -- TODO: support tuple of PreCures: purify (CureMiracle_Topaz, CureMagical_Topaz) ((Mofurun LinkleStoneTopaz), (LinkleStick LinkleStoneTopaz))

  -- NO NONITEM PURIFICATIONS


act_CureFelice_LinkleSmarthon_LinkleStoneEmerald = printEpisode $ do
  enter Kotoha
  transform Kotoha (LinkleSmarthon LinkleStoneEmerald)
  purify CureFelice (FlowerEchoWand LinkleStoneEmerald)

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_CureMagical_CureFelice_Mofurun_LinkleStoneDia_LinkleSmarthon_LinkleStoneEmerald = printEpisode $ do
  enter Mirai
  enter Liko
  enter Kotoha
  -- TODO: support tuple of girls: transform (Mirai, Liko, Kotoha) ((Mofurun LinkleStoneDia), (LinkleSmarthon LinkleStoneEmerald))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Ruby_CureMagical_Ruby_CureFelice_Mofurun_LinkleStoneRuby_LinkleSmarthon_LinkleStoneEmerald = printEpisode $ do
  enter Mirai
  enter Liko
  enter Kotoha
  -- TODO: support tuple of girls: transform (Mirai, Liko, Kotoha) ((Mofurun LinkleStoneRuby), (LinkleSmarthon LinkleStoneEmerald))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Sapphire_CureMagical_Sapphire_CureFelice_Mofurun_LinkleStoneSapphire_LinkleSmarthon_LinkleStoneEmerald = printEpisode $ do
  enter Mirai
  enter Liko
  enter Kotoha
  -- TODO: support tuple of girls: transform (Mirai, Liko, Kotoha) ((Mofurun LinkleStoneSapphire), (LinkleSmarthon LinkleStoneEmerald))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMiracle_Topaz_CureMagical_Topaz_CureFelice_Mofurun_LinkleStoneTopaz_LinkleSmarthon_LinkleStoneEmerald = printEpisode $ do
  enter Mirai
  enter Liko
  enter Kotoha
  -- TODO: support tuple of girls: transform (Mirai, Liko, Kotoha) ((Mofurun LinkleStoneTopaz), (LinkleSmarthon LinkleStoneEmerald))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMiracle_OverTheRainbow_CureMagical_OverTheRainbow_CureFelice_OverTheRainbow_Mofurun_LinkleStoneAlexandrite_LinkleSmarthon_LinkleStoneAlexandrite = printEpisode $ do
  enter CureMiracle
  enter CureMagical
  enter CureFelice
  -- TODO: support tuple of girls: transform (CureMiracle, CureMagical, CureFelice) ((Mofurun LinkleStoneAlexandrite), (LinkleSmarthon LinkleStoneAlexandrite))
  -- TODO: support tuple of PreCures: purify (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) ((RainbowCarriage (LinkleStoneAlexandrite, (Mofurun LinkleStoneAlexandrite))), PreciousBrace)

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_OverTheRainbow_CureMagical_OverTheRainbow_CureFelice_OverTheRainbow_Mofurun_LinkleStoneAlexandrite_LinkleSmarthon_LinkleStoneAlexandrite2 = printEpisode $ do
  enter CureMiracle_Ruby
  enter CureMagical_Ruby
  enter CureFelice
  -- TODO: support tuple of girls: transform (CureMiracle_Ruby, CureMagical_Ruby, CureFelice) ((Mofurun LinkleStoneAlexandrite), (LinkleSmarthon LinkleStoneAlexandrite))
  -- TODO: support tuple of PreCures: purify (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) ((RainbowCarriage (LinkleStoneAlexandrite, (Mofurun LinkleStoneAlexandrite))), PreciousBrace)

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_OverTheRainbow_CureMagical_OverTheRainbow_CureFelice_OverTheRainbow_Mofurun_LinkleStoneAlexandrite_LinkleSmarthon_LinkleStoneAlexandrite3 = printEpisode $ do
  enter CureMiracle_Sapphire
  enter CureMagical_Sapphire
  enter CureFelice
  -- TODO: support tuple of girls: transform (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice) ((Mofurun LinkleStoneAlexandrite), (LinkleSmarthon LinkleStoneAlexandrite))
  -- TODO: support tuple of PreCures: purify (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) ((RainbowCarriage (LinkleStoneAlexandrite, (Mofurun LinkleStoneAlexandrite))), PreciousBrace)

  -- NO NONITEM PURIFICATIONS


act_CureMiracle_OverTheRainbow_CureMagical_OverTheRainbow_CureFelice_OverTheRainbow_Mofurun_LinkleStoneAlexandrite_LinkleSmarthon_LinkleStoneAlexandrite4 = printEpisode $ do
  enter CureMiracle_Topaz
  enter CureMagical_Topaz
  enter CureFelice
  -- TODO: support tuple of girls: transform (CureMiracle_Topaz, CureMagical_Topaz, CureFelice) ((Mofurun LinkleStoneAlexandrite), (LinkleSmarthon LinkleStoneAlexandrite))
  -- TODO: support tuple of PreCures: purify (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) ((RainbowCarriage (LinkleStoneAlexandrite, (Mofurun LinkleStoneAlexandrite))), PreciousBrace)

  -- NO NONITEM PURIFICATIONS


act_CureMofurun_MiracleMofurunLight = printEpisode $ do
  enter (Mofurun MofurunLinkleStone)
  -- TODO: support tuple of girls: transform (Mofurun MofurunLinkleStone) MiracleMofurunLight
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureBlack_Max_CureWhite_Max_HeartfulCommuneMepple_HeartfulCommuneMipple = printEpisode $ do
  enter Nagisa
  enter Honoka
  -- TODO: support tuple of girls: transform (Nagisa, Honoka) (HeartfulCommuneMepple, HeartfulCommuneMipple)
  -- NO PURIFICATIONS
  -- TODO: support tuple of PreCures: purifyWithoutItem (CureBlack_Max, CureWhite_Max)


act_ShinyLuminous_TouchCommune_Porun = printEpisode $ do
  enter Hikari
  transform Hikari TouchCommune_Porun
  purify ShinyLuminous HeartielBaton

  -- NO NONITEM PURIFICATIONS


act_CureEcho_FeelingToBePreCure = printEpisode $ do
  enter Ayumi
  transform Ayumi FeelingToBePreCure
  -- NO PURIFICATIONS
  purifyWithoutItem CureEcho


act_CureHappy_SmilePact_CureDecors = printEpisode $ do
  enter Miyuki
  transform Miyuki (SmilePact CureDecors)
  purify CureHappy (SmilePact CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CureSunny_SmilePact_CureDecors = printEpisode $ do
  enter Akane
  transform Akane (SmilePact CureDecors)
  purify CureSunny (SmilePact CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CurePeace_SmilePact_CureDecors = printEpisode $ do
  enter Yayoi
  transform Yayoi (SmilePact CureDecors)
  purify CurePeace (SmilePact CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CureMarch_SmilePact_CureDecors = printEpisode $ do
  enter Nao
  transform Nao (SmilePact CureDecors)
  purify CureMarch (SmilePact CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CureBeauty_SmilePact_CureDecors = printEpisode $ do
  enter Reika
  transform Reika (SmilePact CureDecors)
  purify CureBeauty (SmilePact CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CureHappy_CureSunny_CurePeace_CureMarch_CureBeauty_SmilePact_CureDecors = printEpisode $ do
  enter Miyuki
  enter Akane
  enter Yayoi
  enter Nao
  enter Reika
  -- TODO: support tuple of girls: transform (Miyuki, Akane, Yayoi, Nao, Reika) (SmilePact CureDecors)
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_PrincessHappy_PrincessSunny_PrincessPeace_PrincessMarch_PrincessBeauty_PrincessCandle_CureDecors = printEpisode $ do
  enter CureHappy
  enter CureSunny
  enter CurePeace
  enter CureMarch
  enter CureBeauty
  -- TODO: support tuple of girls: transform (CureHappy, CureSunny, CurePeace, CureMarch, CureBeauty) (PrincessCandle CureDecors)
  -- TODO: support tuple of PreCures: purify (PrincessHappy, PrincessSunny, PrincessPeace, PrincessMarch, PrincessBeauty) (RoyalClock CureDecors)

  -- NO NONITEM PURIFICATIONS


act_CureBloom_CureEgret_MixCommuneFlappy_MixCommuneChoppy = printEpisode $ do
  enter Saki
  enter Mai
  -- TODO: support tuple of girls: transform (Saki, Mai) (MixCommuneFlappy, MixCommuneChoppy)
  -- NO PURIFICATIONS
  -- TODO: support tuple of PreCures: purifyWithoutItem (CureBloom, CureEgret)


act_CureBright_CureWindy_CrystalCommuneFlappy_CrystalCommuneChoppy = printEpisode $ do
  enter Saki
  enter Mai
  -- TODO: support tuple of girls: transform (Saki, Mai) (CrystalCommuneFlappy, CrystalCommuneChoppy)
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMelody_CureRhythm_CureModules_Dory_CureModules_Rery = printEpisode $ do
  enter Hibiki
  enter Kanade
  -- TODO: support tuple of girls: transform (Hibiki, Kanade) ((CureModules Dory), (CureModules Rery))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureBeat_CureModules_Lary = printEpisode $ do
  enter Ellen
  transform Ellen (CureModules Lary)
  purify CureBeat (LoveGuitarRod Sory)

  -- NO NONITEM PURIFICATIONS


act_CureMuse_CureModules_Dodory = printEpisode $ do
  enter Ako
  transform Ako (CureModules Dodory)
  purify CureMuse (CureModules Tiry)

  -- NO NONITEM PURIFICATIONS


act_CureMelody_CureRhythm_CureBeat_CureModules_Dory_CureModules_Rery_CureModules_Lary = printEpisode $ do
  enter Hibiki
  enter Kanade
  enter Ellen
  -- TODO: support tuple of girls: transform (Hibiki, Kanade, Ellen) ((CureModules Dory), (CureModules Rery), (CureModules Lary))
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


act_CureMelody_CureRhythm_CureBeat_CureMuse_CureModules_Dory_CureModules_Rery_CureModules_Lary_CureModules_Dodory = printEpisode $ do
  enter Hibiki
  enter Kanade
  enter Ellen
  enter Ako
  -- TODO: support tuple of girls: transform (Hibiki, Kanade, Ellen, Ako) ((CureModules Dory), (CureModules Rery), (CureModules Lary), (CureModules Dodory))
  -- TODO: support tuple of PreCures: purify (CureMelody, CureRhythm, CureBeat, CureMuse) HealingChest

  -- NO NONITEM PURIFICATIONS


act_CureDream_PinkyCatch = printEpisode $ do
  enter Nozomi
  transform Nozomi PinkyCatch
  purify CureDream PinkyCatch
  purify CureDream DreamTorch

  purifyWithoutItem CureDream


act_CureRouge_PinkyCatch = printEpisode $ do
  enter Rin
  transform Rin PinkyCatch
  purify CureRouge PinkyCatch
  purify CureRouge RougeTact

  purifyWithoutItem CureRouge


act_CureLemonade_PinkyCatch = printEpisode $ do
  enter Urara
  transform Urara PinkyCatch
  purify CureLemonade PinkyCatch
  purify CureLemonade LemonadeCastanet

  purifyWithoutItem CureLemonade


act_CureMint_PinkyCatch = printEpisode $ do
  enter Komachi
  transform Komachi PinkyCatch
  purify CureMint PinkyCatch
  purify CureMint MintLeaf

  purifyWithoutItem CureMint


act_CureAqua_PinkyCatch = printEpisode $ do
  enter Karen
  transform Karen PinkyCatch
  purify CureAqua PinkyCatch
  purify CureAqua AquaRibbon

  purifyWithoutItem CureAqua


act_CureDream_CureRouge_CureLemonade_CureMint_CureAqua_PinkyCatch = printEpisode $ do
  enter Nozomi
  enter Rin
  enter Urara
  enter Komachi
  enter Karen
  -- TODO: support tuple of girls: transform (Nozomi, Rin, Urara, Komachi, Karen) PinkyCatch
  -- TODO: support tuple of PreCures: purify (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) (DreamTorch, RougeTact, LemonadeCastanet, MintLeaf, AquaRibbon)
  -- TODO: support tuple of PreCures: purify (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) (CrystalFleuret, FireFleuret, ShiningFleuret, ProtectFleuret, TornadoFleuret)

  -- NO NONITEM PURIFICATIONS


act_CureDream_CureMo = printEpisode $ do
  enter Nozomi
  transform Nozomi CureMo
  purify CureDream PinkyCatch
  purify CureDream DreamTorch

  purifyWithoutItem CureDream


act_CureRouge_CureMo = printEpisode $ do
  enter Rin
  transform Rin CureMo
  purify CureRouge PinkyCatch
  purify CureRouge RougeTact

  purifyWithoutItem CureRouge


act_CureLemonade_CureMo = printEpisode $ do
  enter Urara
  transform Urara CureMo
  purify CureLemonade PinkyCatch
  purify CureLemonade LemonadeCastanet

  purifyWithoutItem CureLemonade


act_CureMint_CureMo = printEpisode $ do
  enter Komachi
  transform Komachi CureMo
  purify CureMint PinkyCatch
  purify CureMint MintLeaf

  purifyWithoutItem CureMint


act_CureAqua_CureMo = printEpisode $ do
  enter Karen
  transform Karen CureMo
  purify CureAqua PinkyCatch
  purify CureAqua AquaRibbon

  purifyWithoutItem CureAqua


act_MilkyRose_MilkyPalette = printEpisode $ do
  enter Kurumi
  transform Kurumi MilkyPalette
  purify MilkyRose MilkyPalette
  purify MilkyRose MilkyMirror

  -- NO NONITEM PURIFICATIONS


act_CureDream_CureRouge_CureLemonade_CureMint_CureAqua_CureMo = printEpisode $ do
  enter Nozomi
  enter Rin
  enter Urara
  enter Komachi
  enter Karen
  -- TODO: support tuple of girls: transform (Nozomi, Rin, Urara, Komachi, Karen) CureMo
  -- TODO: support tuple of PreCures: purify (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) (DreamTorch, RougeTact, LemonadeCastanet, MintLeaf, AquaRibbon)
  -- TODO: support tuple of PreCures: purify (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) (CrystalFleuret, FireFleuret, ShiningFleuret, ProtectFleuret, TornadoFleuret)

  -- NO NONITEM PURIFICATIONS


act_CureDream_CureRouge_CureLemonade_CureMint_CureAqua_MilkyRose_CureMo_MilkyPalette = printEpisode $ do
  enter Nozomi
  enter Rin
  enter Urara
  enter Komachi
  enter Karen
  enter Kurumi
  -- TODO: support tuple of girls: transform (Nozomi, Rin, Urara, Komachi, Karen, Kurumi) (CureMo, MilkyPalette)
  -- NO PURIFICATIONS
  -- NO NONITEM PURIFICATIONS


{---- NOT REFERRED PURIFICATIONS -------------
purify CureMacherie (PreHeart MiraiCrystalRed)
purify CureAmour (PreHeart MiraiCrystalPurple)
purify CureMacherie (TwinLoveGuitar MiraiCrystalRouge)
purify CureAmour (TwinLoveGuitar MiraiCrystalViolet)
purify CureMelody (MiracleBelltier Miry)
purify CureRhythm (FantasticBelltier Fary)
END NOT REFERRED PURIFICATIONS -}
{---- NOT REFERRED NON-ITEM PURIFICATIONS -------------
END NOT REFERRED NON-ITEM PURIFICATIONS -}
