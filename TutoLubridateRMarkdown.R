---
title: "LubriDate"
author: Gaspard PALAY
date: 9 Novembre 2020
output: pdf_document
---
  
# La manipulation des dates avec le R de base est parfois difficile voire impossible pour réaliser certaines tâches. De plus, dans les cas où R est capable de le faire, le code est long, ce qui le rend difficile à être reproduit. lubridate est une librairie qui nous permet de pallier à ces insuffisances. 
# a noter que lubridate est disponible avec la collection de package TidyVerse en open source.
# si vous souhaitez installer la totalité du package tidyverse (très utile) prenez la fonction suivante: install.packages("tidyverse")
#install.packages("lubridate")
library(lubridate)
# Transformer une chaîne de caractères en date
# transformation dun vecteur de classe chaîne de caractères en un vecteur de classe date:
class ("05 Mai 2020")
# 05 Mai 2020 est donc une chaine de charactère, je vais lui indiquer que le séléments composants cette chaine de caractère sont des Jours des Mois et des Années (DMY)
jourJ <- dmy("05 Mai 2020")
class(jourJ)
#grace au package Lubridate R transforme la chaine de caractère en date, si j exécute jourJ il le transformera :
jourJ
# quand on a des vecteurs qui regroupent à la fois la date et l heure (comme "11/04/2019 14h37" par exemple) on parle de "date-time"'''
ymd("2019/04_11")
ymd_hm("2019.04.11 14h37")
ymd_hms("20190407143752")
hms("14h37min52s")
# Lubridate nous permet aussi de récupérer seulement certains éléments compris dans une date grace aux fonctions suivantes : 
t <- ymd_hms("2020.11.09_17.56.32")
date(t)
hour(t)
minute(t)
second(t)
#On peut  arrondir une date, vers le haut (ceiling_date()), vers le bas (floor_date()), ou vers le plus proche (round_date()):
t <- ymd_hms("2020.11.09_17.56.32")
ceiling_date(t,"hour")
floor_date(t,"hour")
round_date(t,"hour")
#choisir à quelle unité se fait cet arrondi
t <- ymd_hms("2019.04.11 14h37min52s")
round_date(t,"minute")
round_date(t,"hour")
round_date(t,"day")
round_date(t,"month")
round_date(t,"year")
# Maintenant que cela est acquis nous pouvons nous pencher sur les périodes de temps écoulés ou la durée
# diff nous renseigne sur la "différence de temps" entre t1 et t2. Il s'agit d'un objet de classe difftime

t1 <- dmy("12/09/2020")
t2 <- dmy("30/01/2016")
diff <- t1-t2
as.duration(diff)
as.period(diff)
# si l'on veut connaitre la date d'un évenement dont on connait la récurrence (tous les 38 ans par exemple) on utilisa la fonction suivante : 
t0 <- dmy_h("12/09/2020 22h")
t0+years(38)
# le résultat est inexacte puisqu'il prédit un évenemet le 12/09 sans compter les années bissextiles, pour obtenir le bon résultat on fait : 
t0+dyears(38)
# si vous osuhaitez savoir si une année est bissextile, la fonction suivante le permet : 
leap_year(2016)
leap_year(2017)
# Non pouvons inclure des calculs arithmétiques sur des périodes ou des durées. 
#Les périodes correspondent au fonctions xxx() (par exemple days() ou months()) tandis que les durées correspondent aux fonctions dxxx() (par exemple ddays() ou dyears())
t1+months(9) # t1 + 9 mois
t1+ddays(287) # t1 + exactement 287 jours
ddays(287)/dweeks(1) # combien de semaines (exactement) pour 287 jours?
t2-dweeks(7) # t2 - 7 semaines
# Les intervals sont des intervalles de temps qui commencent et finissent à des instants bien déterminés (parce qu’ils sont liés à des dates spécifiques). 
#Les intervalles conservent des informations complètes sur un intervalle de temps. Les fonctions pour travailler avec l’objet intervals sont is.interval, as.interval, interval, int_start, int_end,int_shift, int_flip, int_aligns, int_overlaps et %within%. 
#Les intervalles peuvent également être manipulés avec les fonctions suivantes : intersect, union, et setdiff.
date_depart <- dmy_hm("27/12/2016 5:45", tz="Africa/Dakar")
date_arrive <- mdy_hm("dec 28, 2017  19:30", tz="America/Toronto")
duree <- interval(date_depart, date_arrive)
duree

! [CheatSheet Lubridate n°1](/Users/gaspardpalay/Desktop/lubridate.png)

! [CheatSheet Lubridate n°2](/Users/gaspardpalay/Desktop/lubridate2.png)
