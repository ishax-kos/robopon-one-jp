Pointers_6f4be:
	dw Data_6f4c4
	dw Data_6f4cf
	dw $0

Data_6f4c4:
	db "(ちょっとまってな)", $0

Data_6f4cf:
	db "(ちょちょいっと なおすさぁ)", $0

Pointers_6f4df:
	dw Data_6f4e3
	dw $0

Data_6f4e3:
	db "(そうかい またおいてﾞ)", $0

Pointers_6f4f1:
	dw Data_6f4f7
	dw Data_6f500
	dw $0

Data_6f4f7:
	db "(おまたせっ)!", $0

Data_6f500:
	db "(かんへﾟきに なおしといたよ)!", $0

AskRepairRobots:: ; 6f512 (1b:7512)
	ld a, $3
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli AllocateMemory
	ld hl, $c8
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpAttrMapRectangle
	ld a, $2
	ld [wc39a], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_6f6d0
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld a, $2
	ld [wc39a], a
	callba_hli Func_1482e
	push hl
	ld a, $2
	ld [wc39a], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop hl
	ld a, l
	or h
	jp nz, Func_6f66f
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6f4be)
	ld de, Pointers_6f4be
	ld hl, $10e
	call FarCall
	callba_hli RepairRobots
	xor a
	call OverworldPlaySong
	ld a, SONG_HEAL
	call OverworldPlaySong
	set_farcall_addrs_hli LoadEmote
	ld c, $2
	ld e, $2
	ld a, $8
	call FarCall
	callba_hli Func_9a84a
	ld a, $3
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6f4f1)
	ld de, Pointers_6f4f1
	ld hl, $10e
	call FarCall
	ld a, $c
	call OverworldPlaySong
	jp Func_6f685

Func_6f66f: ; 6f66f (1b:766f)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6f4df)
	ld de, Pointers_6f4df
	ld hl, $10e
	call FarCall
Func_6f685: ; 6f685 (1b:7685)
	ld a, $3
	ld [wc39a], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop de
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreAttrMapRectangle
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli FreeMemory
	pop hl
	call FarCall
	ret

Data_6f6d0:
	db "(しゅうりしてゆくかい)?", $0
