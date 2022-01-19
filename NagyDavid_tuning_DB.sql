-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 19. 18:59
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tuning`
--
CREATE DATABASE IF NOT EXISTS `tuning` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `tuning`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alkatresz`
--

DROP TABLE IF EXISTS `alkatresz`;
CREATE TABLE `alkatresz` (
  `id` int(11) NOT NULL,
  `katId` int(11) NOT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `nev_bg` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `alkatresz`
--

INSERT INTO `alkatresz` (`id`, `katId`, `nev`, `nev_bg`) VALUES
(1, 1, 'Vezérműtengely', 'vezermutengely'),
(2, 1, 'Szelepek', 'szelepek'),
(3, 1, 'Szelepvezetők', 'szelepvezetok'),
(4, 1, 'Szeleprugók', 'szeleprugok'),
(5, 1, 'Hidrótőke', 'hidrotoke'),
(6, 1, 'Tömítések', 'tomitesek'),
(7, 1, 'Szívó oldal', 'szivo_oldal'),
(8, 1, 'Kipufogó oldal', 'kipufogo_oldal'),
(9, 1, 'Hengerfej', 'hengerfej'),
(10, 1, 'Vezérlés', 'vezerles'),
(11, 2, 'Dugattyú', 'dugattyu'),
(12, 2, 'Hajtókar', 'hajtokar'),
(13, 2, 'Fötengely', 'fotengely'),
(14, 2, 'Nyugvó csapágy', 'nyugvo_csapagy'),
(15, 2, 'Csavarszett', 'csavarszett'),
(16, 2, 'Stroker kit', 'stroker_kit'),
(17, 2, 'Olajzás', 'olajzas'),
(18, 2, 'Tömítések', 'tomitesek');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `kategoria` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`id`, `kategoria`) VALUES
(1, 'Hengerfej'),
(2, 'Motorblokk'),
(3, 'Üzemanyag');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `marka`
--

DROP TABLE IF EXISTS `marka`;
CREATE TABLE `marka` (
  `id` int(11) NOT NULL,
  `marka` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `marka`
--

INSERT INTO `marka` (`id`, `marka`) VALUES
(1, 'Nissan'),
(2, 'Toyota'),
(3, 'Mitsubishi'),
(4, 'Honda'),
(5, 'Mazda');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `motor`
--

DROP TABLE IF EXISTS `motor`;
CREATE TABLE `motor` (
  `id` int(11) NOT NULL,
  `markaId` int(11) NOT NULL,
  `motor` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `kategoriak` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `motor`
--

INSERT INTO `motor` (`id`, `markaId`, `motor`, `kategoriak`) VALUES
(1, 1, 'RB26', '1,2,3'),
(2, 1, 'SR20', '1,2,3'),
(3, 1, 'CA18', '1,2,3'),
(4, 1, 'KA24', '1,2,3'),
(5, 1, 'VR38', '1,2,3'),
(6, 2, '2JZ', '1,2,3'),
(7, 2, '2ZZ', '1,2,3'),
(8, 2, '1ZZ', '1,2,3');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parts`
--

DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci NOT NULL,
  `motorId` int(11) NOT NULL,
  `alkatreszId` int(11) NOT NULL,
  `kep` text COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `parts`
--

INSERT INTO `parts` (`id`, `nev`, `leiras`, `motorId`, `alkatreszId`, `kep`, `ar`) VALUES
(1, 'Tomei Poncam Set 254 deg/9.15mm (Type 1)', 'Kiváló minőségű vezérműtengely RB26-hoz. Alkalmazható gyári és az N1 turbóhoz. A szett a kipufogó és a szívó oldali tengelyeket tartalmazza.', 1, 1, 'tomei_poncam_set_254_915_type1_rb26.jpg', 210000),
(2, 'Kelford L182-C Set 282 deg/9.2mm (Type-1)', 'Kiváló minőségű vezérműtengely RB26-hoz. A cég 1968 óta gyárt verseny célokra vezérműtengelyeket. A csomag a szívó és kipufogó oldali tengelyeket tartalmazza', 1, 1, 'kelford_l182c_282_92_type1_rb26.jpg', 270000),
(3, 'Brian Cower Stage 2 264 deg/9.14mm 9.15mm', 'Kiváló minőségű vezérműtengely RB26-hoz. A szívó oldali tengely 9.15mm lift, kioufogó oldali tengely 9.14mm lift.', 1, 1, 'brian_cower_stage2_264_914_919.jpg', 250000),
(4, 'Supertech STD szelep készlet', 'Kiváló minőségű szelepkészlet RB26-hoz. A szelep kiválóan alkalmas magas fordulatú és magas teljesítményű motor építéséhez. Anyaga rozsdamentes acél, ami egy fekete nitrid bevonattal van ellátva, hogy segítse a hűtést. A csomag 12 szívó és 12 kipufogó szelepet tartalmaz.', 1, 2, 'supertech_rb26_szelep_szett.jpg', 225000),
(5, 'Tomei Oversized (+1mm) verseny szelep készlet', 'Kiváló minőségű szelepkészlet RB26-hoz. A készlet +1mm túlmérettel rendelkezik amihez a gyári alapméretű szelepfészket fel kell marni. A túlméretnek köszönhetően sokkal jobb a levegó és lipufogó gáznak az áramlása. Tökéletesen alkalmas nagyteljesítményű motor építésére. Szívó szelep anyaga: SUH35, kipufogó szelep: Inconel 751. A szett 12 szívó és 12 kipufogó szelepet tartalmazz.', 1, 2, 'tomei_oversize1_rb26_racing_valve.jpg', 216000),
(6, 'Tomei bronz szelepvezető készlet', 'Kiváló minőségű szelepvezető RB26-hoz. Szelepvezető feladata, hogy a hengerfejben a szelepet megvezesse. Anyaga bronz, kiválóan alkalmas nagyteljesítményű motor építésére de fontos, hogy időközönként ellenőrizzük a vezetők állapotát (főleg drag és drift motorok esetén). A készlet a szívó és lipufogó oldali vezetőket tartalmazza.', 1, 3, 'tomei_szelepvezeto_bronz_rb26.jpg', 110000),
(7, 'Supertech szívóoldali szelepvezető készlet', 'Kiváló minőségű szelepvezető RB26-hoz. Anyaga magnézium-bronz keveréke. A készlet csak a szívó oldali vezetőket tartalmazza.', 1, 3, 'supertech_rb26_szelepvezeto_szivo.jpg', 27000),
(8, 'Tomei Type-A szeleprugó készlet', 'Kiváló minőségű szeleprugó készlet RB26-hoz. Kiválóan alkalmas magas fordulathoz. Fontos a szelepkészletet maximum 10.85mm-es nyitási mélységhez lehet használni. A cég a Tomei Procam tengelyekhez ajánla. A szett a mindkét oldali rugó készletet tartalmazza.', 1, 4, 'tomei_rb26_typea_szeleprugo.jpg', 136000),
(9, 'Supertech szeleprugó készlet', 'Kiváló minőségű szeleprugó készlet RB26-hoz. A rugó szilicium-króm-vanádium-acél ötvözetéből készült, így tökéletesen alkalmas magas teljesítmény és fordulathoz. A készlet a rögzítők is benne vannak amik katonai igazolású titánium ötvözetből készült.', 1, 4, 'supertech_rb26_szelep_rugo_rogzitovel.jpg', 160000),
(10, 'Tomei fixtőke alapméret', 'Kiváló minőségű fixtőke RB26-hoz. A fix tőke sokkal jobban alkalmas magas teljesítményú motor építéséhez mint a hidrotőke. A gyári alapátmérőjű vezérműtengelyekhez alkalmas. A szett mind két oldali készletet tartalmazza.', 1, 5, 'tomei_rb26_fixtoke_alapmeret.jpg', 110000),
(11, 'Tomei fixtőke -1mm csökkentett magasságú', 'Kiváló minőségű fixtőke RB26-hoz. A fix tőke sokkal jobban alkalmas magas teljesítményú motor építéséhez mint a hidrotőke. A gyárinál nagyobb alapátmérőjű vezérműtengelyekhez alkalmas. A szett mind két oldali készletet tartalmazza.', 1, 5, 'tomei_rb26_fixtoke_1mmtulmeret.jpg', 110000),
(12, 'Cometic StreetPro hengerfej tömítés készlet (87mm x .51mm)', 'Kiváló minöségű tömítés készlet RB26-hoz. A szett a teljes hengerfej tömítéséhez tartalmazza a tömítéseket. Hengerfej tömítés átmérője 87mm, vastagsága .51mm.', 1, 6, 'cometic_streetpro_rb26_hengerfej_tomites_keszlet.jpg', 74000),
(13, 'Supertech fém hengerfej tömítés (87.5mm x 1.2)', 'Kiváló minőségű hengerfej tömítés RB26-hoz. Anyaga fém, így sokkal jobban ellenáll a hőnek. Átmerője: 87.5mm, vastagsága: 1.2mm.', 1, 6, 'supertech_rb26_hengerfej_tomites_875x12.png', 67000),
(14, 'Tomei szívótorok tömítés készlet', 'Kiváló minőségű tömítés készlet RB26-hoz. Anyaga fém. A csomag a szívóoldalhoz az összes tömítést tartalmazza.', 1, 6, 'tomei_rb26_szivooldal_tomites_keszlet.jpg', 32000),
(15, 'Hypertune \'Raw Spec V2 Billet szívótorok\'', 'Kiváló minőségű szívótorok RB26-hoz. Anyaga billet alumínium. Fontos, hogy ezzel a torkkal nem lehet a gyári fojtószelepeket használni, így egy külön egyedülálló szelepet kell használni. Kérhető fojtószeleppel (90mm vagy 102mm) és üzemenyegcsatornával.', 1, 7, 'hypertune_rawspec_v2_billet_rb26_szivotorok.jpg', 632000),
(16, 'Greedy szívótorok', 'Kiváló minőségű szívótorok RB26-hoz. Anyaga alumínium. Csak a gyári fojtószeleppel használható.', 1, 7, 'greedy_szivotorok_rb26.jpg', 300000);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alkatresz`
--
ALTER TABLE `alkatresz`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alkatresz`
--
ALTER TABLE `alkatresz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `marka`
--
ALTER TABLE `marka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `motor`
--
ALTER TABLE `motor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
