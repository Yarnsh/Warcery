extends Node

const spells = [
	preload("res://Spells/blast.gd"),
	preload("res://Spells/rapid.gd"),
	preload("res://Spells/shield.gd"),
	preload("res://Spells/resistance.gd"),
	preload("res://Spells/barrier.gd"),
]

func _check_spell(s, runes):
		if s.runes.size() > runes.size():
			return null
		var cast = true
		var i = -1
		var i2 = 0
		for r in s.runes:
			if s.runes[i] != runes[i2]:
				cast = false
				break;
			i -= 1
			i2 += 1
		if cast:
			return s
		return null
	

func check_spells(runes, trigger = null):
	for s in spells:
		if trigger and !trigger.has(s.trigger):
			continue
		var res = _check_spell(s, runes)
		if res:
			return res
	return null

