SpriteObjects:						; the sprite objects (docs/sprite_objects.md): the record list, then the
									; palettes; each record is one sprite, its frames point into bank $C1
	dw SpriteRecordList
	dl SpritePalettes
