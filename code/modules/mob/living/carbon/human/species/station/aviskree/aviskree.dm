/datum/species/aviskree
	name = "Aviskree"
	short_name = "avi"
	name_plural = "Aviskree"
	bodytype = "Aviskree"
	icobase = 'icons/mob/human_races/aviskree/r_aviskree.dmi'
	deform = 'icons/mob/human_races/aviskree/r_def_aviskree.dmi'
	preview_icon = 'icons/mob/human_races/aviskree/aviskree_preview.dmi'
	tail = "aviskreetail"
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/claws,
		/datum/unarmed_attack/bite/sharp
	)
	darksight = 4
	slowdown = -1.25
	brute_mod = 1.3
	fall_mod = 0.25
	num_alternate_languages = 1
	secondary_langs = list(LANGUAGE_AVIACHIRP)
	name_language = LANGUAGE_AVIACHIRP
	climb_coeff = 0.75
	rarity_value = 3
	economic_modifier = 7

	blurb = "A tall avian species, Aviskree originally hail from Avis, of the Aindege system, \
 	a heavily forested planet of avian species, <br/> <br/> The Aviskree live in a tradition \
 	heavy society with a tech level resembling that of early 2000s earth with advances in electricity. \
 	They are still acclimating to human society, and their native language is Aviachirp, a language made mostly of high pitched chirps."


	spawn_flags = CAN_JOIN | IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#3A3A3A"
	base_color = "#222222"

	reagent_tag = IS_AVISKREE

	zombie_type = "Aviskree Zombie"

	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw

	allowed_citizenships = list(CITIZENSHIP_AVIS)
	allowed_religions = list(RELIGION_AVIKAN, RELIGION_NONE, RELIGION_OTHER)

/datum/species/aviskree/after_equip(var/mob/living/carbon/human/H)
	. = ..()
	if(H.shoes)
		return
	var/obj/item/clothing/shoes/sandal/S = new /obj/item/clothing/shoes/sandal(H)
	if(H.equip_to_slot_or_del(S,slot_shoes))
		S.autodrobe_no_remove = 1