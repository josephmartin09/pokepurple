TitleMons:
; mons on the title screen are randomly chosen from here
IF DEF(_RED)
	db STARTER1
	db STARTER2
	db STARTER3
	db WEEDLE
	db NIDORAN_M
	db SCYTHER
	db PIKACHU
	db CLEFAIRY
	db RHYDON
	db ABRA
	db GASTLY
	db DITTO
	db PIDGEOTTO
	db ONIX
	db PONYTA
	db MAGIKARP
ENDC
IF DEF(_GREEN)
	db STARTER3
	db STARTER1
	db STARTER2
	db CATERPIE
	db NIDORAN_F
	db PINSIR
	db PIKACHU
	db CLEFAIRY
	db RHYDON
	db ABRA
	db GASTLY
	db DITTO
	db PIDGEOTTO
	db ONIX
	db PONYTA
	db MAGIKARP
ENDC
IF DEF(_BLUE)
	db GENGAR
	db AERODACTYL
	db DITTO
	db STARTER2
	db STARTER1
	db STARTER3
	db MANKEY
	db HITMONLEE
	db VULPIX
	db CHANSEY
	db JOLTEON
	db GLOOM
	db POLIWRATH
	db DODUO
	db PORYGON
	db RAICHU
ENDC
