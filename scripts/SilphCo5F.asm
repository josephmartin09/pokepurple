SilphCo5F_Script:
	call SilphCo5Script_19f4d
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo5TrainerHeader0
	ld de, SilphCo5F_ScriptPointers
	ld a, [wSilphCo5FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo5FCurScript], a
	ret

SilphCo5Script_19f4d:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo5GateCoords
	call SilphCo4Script_19d5d
	call SilphCo5Script_19f9e
	CheckEvent EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .asm_19f74
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 2, 3
	predef ReplaceTileBlock
	pop af
.asm_19f74
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .asm_19f87
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 3
	predef ReplaceTileBlock
	pop af
.asm_19f87
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR2
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 5, 7
	predef_jump ReplaceTileBlock

SilphCo5GateCoords:
	db $02,$03
	db $06,$03
	db $05,$07
	db $FF

SilphCo5Script_19f9e:
	EventFlagAddress hl, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .next1
	SetEventReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.next1
	cp $2
	jr nz, .next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret

SilphCo5F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo5F_TextPointers:
	dw SilphCo5Text1
	dw SilphCo5Text2
	dw SilphCo5Text3
	dw SilphCo5Text4
	dw SilphCo5Text5
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SilphCo5Text9
	dw SilphCo5Text10
	dw SilphCo5Text11

SilphCo5TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_0
	dw SilphCo5BattleText2 ; TextBeforeBattle
	dw SilphCo5AfterBattleText2 ; TextAfterBattle
	dw SilphCo5EndBattleText2 ; TextEndBattle
	dw SilphCo5EndBattleText2 ; TextEndBattle

SilphCo5TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_1
	dw SilphCo5BattleText3 ; TextBeforeBattle
	dw SilphCo5AfterBattleText3 ; TextAfterBattle
	dw SilphCo5EndBattleText3 ; TextEndBattle
	dw SilphCo5EndBattleText3 ; TextEndBattle

SilphCo5TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_2
	dw SilphCo5BattleText4 ; TextBeforeBattle
	dw SilphCo5AfterBattleText4 ; TextAfterBattle
	dw SilphCo5EndBattleText4 ; TextEndBattle
	dw SilphCo5EndBattleText4 ; TextEndBattle

SilphCo5TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_3
	dw SilphCo5BattleText5 ; TextBeforeBattle
	dw SilphCo5AfterBattleText5 ; TextAfterBattle
	dw SilphCo5EndBattleText5 ; TextEndBattle
	dw SilphCo5EndBattleText5 ; TextEndBattle

	db $ff

SilphCo5Text1:
	text_asm
	ld hl, SilphCo5Text_1a010
	ld de, SilphCo5Text_1a015
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo5Text_1a010:
	text_far _SilphCo5Text_1a010
	text_end

SilphCo5Text_1a015:
	text_far _SilphCo5Text_1a015
	text_end

SilphCo5Text2:
	text_asm
	ld hl, SilphCo5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText2:
	text_far _SilphCo5BattleText2
	text_end

SilphCo5EndBattleText2:
	text_far _SilphCo5EndBattleText2
	text_end

SilphCo5AfterBattleText2:
	text_far _SilphCo5AfterBattleText2
	text_end

SilphCo5Text3:
	text_asm
	ld hl, SilphCo5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText3:
	text_far _SilphCo5BattleText3
	text_end

SilphCo5EndBattleText3:
	text_far _SilphCo5EndBattleText3
	text_end

SilphCo5AfterBattleText3:
	text_far _SilphCo5AfterBattleText3
	text_end

SilphCo5Text4:
	text_asm
	ld hl, SilphCo5TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText4:
	text_far _SilphCo5BattleText4
	text_end

SilphCo5EndBattleText4:
	text_far _SilphCo5EndBattleText4
	text_end

SilphCo5AfterBattleText4:
	text_far _SilphCo5AfterBattleText4
	text_end

SilphCo5Text5:
	text_asm
	ld hl, SilphCo5TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText5:
	text_far _SilphCo5BattleText5
	text_end

SilphCo5EndBattleText5:
	text_far _SilphCo5EndBattleText5
	text_end

SilphCo5AfterBattleText5:
	text_far _SilphCo5AfterBattleText5
	text_end

SilphCo5Text9:
	text_far _SilphCo5Text9
	text_end

SilphCo5Text10:
	text_far _SilphCo5Text10
	text_end

SilphCo5Text11:
	text_far _SilphCo5Text11
	text_end
