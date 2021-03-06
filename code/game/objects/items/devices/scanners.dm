/*
CONTAINS:
HEALTH ANALYZER
GAS ANALYZER
MASS SPECTROMETER
REAGENT SCANNER
BREATH ANALYZER
*/

/obj/item/device/healthanalyzer
	name = "health analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject."
	icon_state = "health"
	item_state = "analyzer"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 3
	w_class = 2.0
	throw_speed = 5
	throw_range = 10
	matter = list(DEFAULT_WALL_MATERIAL = 200)
	origin_tech = list(TECH_MAGNET = 1, TECH_BIO = 1)
	var/mode = 1

/obj/item/device/healthanalyzer/attack(mob/living/M as mob, mob/living/user as mob)
	health_scan_mob(M, user, FALSE)
	src.add_fingerprint(user)
	return

/obj/item/device/healthanalyzer/attack_self(mob/user)
	health_scan_mob(user, user, FALSE)
	src.add_fingerprint(user)
	return

/proc/calcDamage(var/DMGValue)
	switch(DMGValue)
		if (0 to 1)
			return "Healthy"
		if (1 to 10)
			return "Negligible"
		if (10 to 25)
			return "Minor"
		if (25 to 50)
			return "Moderate"
		if (50 to 75)
			return "Major"
		if (75 to 200)
			return "Critical"
		if (200 to INFINITY)
			return "Fatal"

/proc/health_scan_mob(var/mob/living/M, var/mob/living/user, var/adv, var/visible_msg, var/ignore_clumsiness, var/show_limb_damage = TRUE)
	if (((user.is_clumsy()) || (DUMB in user.mutations)) && prob(50))
		user.visible_message("<span class='warning'>\The [user] has analyzed the floor's vitals!</span>", "<span class='warning'>You try to analyze the floor's vitals!</span>", "<span class='notice'>You hear metal repeatedly clunking against the floor.</span>")
		user.show_message("<span class='notice'>Analyzing Results for The floor:</span>", 1)
		user.show_message("Overall Status: Healthy</span>", 1)
		user.show_message("<span class='notice'>    Damage Specifics: 0-0-0-0</span>", 1)
		user.show_message("<span class='notice'>Key: Suffocation/Toxin/Burns/Brute</span>", 1)
		user.show_message("<span class='notice'>Body Temperature: ???</span>", 1)
		return
	if (!usr.IsAdvancedToolUser())
		to_chat(usr, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return
	user.visible_message("<span class='notice'>[user] has analyzed [M]'s vitals.</span>","<span class='notice'>You have analyzed [M]'s vitals.</span>")

	if (!istype(M,/mob/living/carbon/human) || M.isSynthetic())
		//these sensors are designed for organic life
		user.show_message("<span class='notice'>Analyzing Results for ERROR:\n\t Overall Status: ERROR</span>")
		user.show_message("<span class='notice'>    Key: <font color='blue'>Suffocation</font>/<font color='green'>Toxin</font>/<font color='#FFA500'>Burns</font>/<font color='red'>Brute</font></span>", 1)
		user.show_message("<span class='notice'>    Damage Specifics: <font color='blue'>?</font> - <font color='green'>?</font> - <font color='#FFA500'>?</font> - <font color='red'>?</font></span>")
		user.show_message("<span class='notice'>Body Temperature: [M.bodytemperature-T0C]&deg;C ([M.bodytemperature*1.8-459.67]&deg;F)</span>", 1)
		user.show_message("<span class='warning'>Warning: Blood Level ERROR: --% --cl.</span> <span class='notice'>Type: ERROR</span>")
		user.show_message("<span class='notice'>Subject's pulse: <font color='red'>-- bpm.</font></span>")
		return

	var/fake_oxy = max(rand(1,40), M.getOxyLoss(), (300 - (M.getToxLoss() + M.getFireLoss() + M.getBruteLoss())))
	
	var/OX = 0
	var/TX = 0
	var/BU = 0
	var/BR = 0
	
	if (adv == TRUE)
		OX = M.getOxyLoss()
		TX = M.getToxLoss()
		BU = M.getFireLoss()
		BR = M.getBruteLoss()
	else
		OX = calcDamage(M.getOxyLoss())
		TX = calcDamage(M.getToxLoss())
		BU = calcDamage(M.getFireLoss())
		BR = calcDamage(M.getBruteLoss())
	
	if(M.status_flags & FAKEDEATH)
		if (adv == TRUE)
			OX = fake_oxy
		else
			OX = calcDamage(fake_oxy)
		user.show_message("<span class='notice'>Analyzing Results for [M]:</span>")
		user.show_message("<span class='notice'>	Overall Status: Dead</span>")
		user.show_message("<span class='notice'>    Key: <font color='blue'>Suffocation</font>/<font color='green'>Toxin</font>/<font color='#FFA500'>Burns</font>/<font color='red'>Brute</font></span>", 1)
		user.show_message("<span class='notice'>    Damage Specifics: <font color='blue'>[OX]</font> - <font color='green'>[TX]</font> - <font color='#FFA500'>[BU]</font> - <font color='red'>[BR]</font></span>")
		user.show_message("<span class='notice'>Body Temperature: [M.bodytemperature-T0C]&deg;C ([M.bodytemperature*1.8-459.67]&deg;F)</span>", 1)
	else
		user.show_message("<span class='notice'>Analyzing Results for [M]:\n\t Overall Status: [M.stat > 1 ? "Dead" : "[M.health - M.halloss]% healthy"]</span>")
		user.show_message("<span class='notice'>    Key: <font color='blue'>Suffocation</font>/<font color='green'>Toxin</font>/<font color='#FFA500'>Burns</font>/<font color='red'>Brute</font></span>", 1)
		user.show_message("<span class='notice'>    Damage Specifics: <font color='blue'>[OX]</font> - <font color='green'>[TX]</font> - <font color='#FFA500'>[BU]</font> - <font color='red'>[BR]</font></span>")
		user.show_message("<span class='notice'>Body Temperature: [M.bodytemperature-T0C]&deg;C ([M.bodytemperature*1.8-459.67]&deg;F)</span>", 1)
	if(M.tod && (M.status_flags & FAKEDEATH))
		user.show_message("<span class='notice'>Time of Death: [M.tod]</span>")
	else if(M.timeofdeath > 0 && M.stat == DEAD)
		user.show_message("<span class='notice'>Time of Death: [worldtime2text(M.timeofdeath)]</span>")
	if(istype(M, /mob/living/carbon/human) && show_limb_damage)
		var/mob/living/carbon/human/H = M
		var/list/damaged = H.get_damaged_organs(1,1)
		user.show_message("<span class='notice'>Localized Damage, Brute/Burn:</span>",1)
		if(length(damaged)>0)
			if (adv == TRUE)
				for(var/obj/item/organ/external/org in damaged)
					user.show_message(text("<span class='notice'>     [][]: [][] - []</span>",
					capitalize(org.name),
					(org.status & ORGAN_ROBOT) ? "(Cybernetic)" : "",
					(org.brute_dam > 0) ? "<font color='red'>[org.brute_dam]</font>" : "<font color='red'>0</font>",
					(org.status & ORGAN_BLEEDING)?"<span class='danger'> \[Bleeding\]</span>":"",
					(org.burn_dam > 0) ? "<font color='#FFA500'>[org.burn_dam]</font>" : "<font color='#FFA500'>0</font>"),1)
			else
				for(var/obj/item/organ/external/org in damaged)
					user.show_message(text("<span class='notice'>     [][]: [][] - []</span>",
					capitalize(org.name),
					(org.status & ORGAN_ROBOT) ? "(Cybernetic)" : "",
					(org.brute_dam > 0) ? "<font color='red'>[calcDamage(org.brute_dam)]</font>" : "<font color='red'>Healthy</font>",
					(org.status & ORGAN_BLEEDING)?"<span class='danger'> \[Bleeding\]</span>":"",
					(org.burn_dam > 0) ? "<font color='#FFA500'>[calcDamage(org.burn_dam)]</font>" : "<font color='#FFA500'>Healthy</font>"),1)
		else
			user.show_message("<span class='notice'>    Limbs are OK.</span>",1)
	if(istype(M, /mob/living/carbon))
		var/mob/living/carbon/C = M
		if(C.reagents.total_volume)
			var/unknown = 0
			var/reagentdata[0]
			for(var/A in C.reagents.reagent_list)
				var/datum/reagent/R = A
				if(R.scannable)
					reagentdata["[R.id]"] = "<span class='notice'>    [round(C.reagents.get_reagent_amount(R.id), 1)]u [R.name]</span>"
				else
					unknown++
			if(reagentdata.len)
				user.show_message("<span class='notice'>Beneficial reagents detected in subject's blood:</span>")
				for(var/d in reagentdata)
					user.show_message(reagentdata[d])
			if(unknown)
				user.show_message("<span class='warning'>Warning: Unknown substance[(unknown>1)?"s":""] detected in subject's blood.</span>")
		if(C.ingested && C.ingested.total_volume)
			var/unknown = 0
			for(var/datum/reagent/R in C.ingested.reagent_list)
				if(R.scannable)
					to_chat(user, "<span class='notice'>[R.name] found in subject's stomach.</span>")
				else
					++unknown
			if(unknown)
				to_chat(user, "<span class='warning'>Non-medical reagent[(unknown > 1)?"s":""] found in subject's stomach.</span>")
		if(C.virus2.len)
			for (var/ID in C.virus2)
				var/datum/record/virus/V = SSrecords.find_record("id", "[ID]", RECORD_VIRUS)
				if(istype(V))
					user.show_message("<span class='warning'>Warning: Pathogen [V.name] detected in subject's blood. Known antigen : [V.antigen]</span>")
					
	if(M.nutrition / M.max_nutrition <= CREW_NUTRITION_VERYHUNGRY)
		user.show_message("<span class='warning'>Subject malnourished. Food intake recommended.</span>")
	if(M.hydration / M.max_hydration <= CREW_HYDRATION_VERYTHIRSTY)
		user.show_message("<span class='warning'>Subject dehydrated. Fluid intake recommended.</span>")
	
	if (M.getCloneLoss())
		user.show_message("<span class='warning'>Subject appears to have been imperfectly cloned.</span>")
	for(var/datum/disease/D in M.viruses)
		if(!D.hidden[SCANNER])
			user.show_message(text("<span class='danger'>Warning: [D.form] Detected</span><span class='warning'>\nName: [D.name].\nType: [D.spread].\nStage: [D.stage]/[D.max_stages].\nPossible Cure: [D.cure]</span>"))

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if (H.getBrainLoss() >= config.default_brain_health || !H.has_brain())
			user.show_message("<span class='warning'>Subject is brain dead.</span>")
		else if (H.getBrainLoss() >= 120)
			to_chat(user, "\t<span class='alert'>Severe brain damage detected. Subject likely to have mental traumas.</span>")
		else if (H.getBrainLoss() >= 45)
			to_chat(user, "\t<span class='alert'>Brain damage detected.</span>")
		else if(LAZYLEN(H.get_traumas()))
			to_chat(user, "\t<span class='alert'>Severe brain damage detected. Subject likely to have mental traumas.</span>")
		for(var/name in H.organs_by_name)
			var/obj/item/organ/external/e = H.organs_by_name[name]
			if(!e)
				continue
			var/limb = e.name
			if(e.status & ORGAN_BROKEN)
				if(((e.name == BP_L_ARM) || (e.name == BP_R_ARM) || (e.name == BP_L_LEG) || (e.name == BP_R_LEG)) && (!(e.status & ORGAN_SPLINTED)))
					to_chat(user, "<span class='warning'>Unsecured fracture in subject [limb]. Splinting recommended for transport.</span>")
			if(e.has_infected_wound())
				to_chat(user, "<span class='warning'>Infected wound detected in subject [limb]. Disinfection recommended.</span>")

		for(var/name in H.organs_by_name)
			var/obj/item/organ/external/e = H.organs_by_name[name]
			if(e && e.status & ORGAN_BROKEN)
				user.show_message(text("<span class='warning'>Bone fractures detected. Advanced scanner required for location.</span>"), 1)
				break
		var/found_arterial = FALSE
		var/found_tendon = FALSE
		for(var/obj/item/organ/external/e in H.organs)
			if(e)
				if(!found_arterial && (e.status & ORGAN_ARTERY_CUT))
					user.show_message(text("<span class='warning'>Arterial bleeding detected. Advanced scanner required for location.</span>"))
					found_arterial = TRUE
				if(!found_tendon && (e.status & ORGAN_TENDON_CUT))
					user.show_message(text("<span class='warning'>Tendon or ligament damage detected. Advanced scanner required for location.</span>"))
					found_tendon = TRUE
			if(found_arterial && found_tendon)
				break
		if(M:vessel)
			var/blood_volume = round(M:vessel.get_reagent_amount("blood"))
			var/blood_percent = blood_volume / 560
			var/blood_type = M.dna.b_type
			blood_percent *= 100
			if(blood_volume <= 500 && blood_volume > 336)
				user.show_message("<span class='danger'>Warning: Blood Level LOW: [blood_percent]% [blood_volume]cl.</span> <span class='notice'>Type: [blood_type]</span>")
			else if(blood_volume <= 336)
				user.show_message("<span class='danger'><i>Warning: Blood Level CRITICAL: [blood_percent]% [blood_volume]cl.</i></span> <span class='notice'>Type: [blood_type]</span>")
			else
				user.show_message("<span class='notice'>Blood Level Normal: [blood_percent]% [blood_volume]cl. Type: [blood_type]</span>")
		user.show_message("<span class='notice'>Subject's pulse: <font color='[H.pulse == PULSE_THREADY || H.pulse == PULSE_NONE ? "red" : "blue"]'>[H.get_pulse(GETPULSE_TOOL)] bpm.</font></span>")
		
/obj/item/device/healthanalyzer/verb/toggle_mode()
	set name = "Switch Verbosity"
	set category = "Object"

	mode = !mode

	if(mode)
		to_chat(usr, "The scanner now shows specific limb damage.")
	else
		to_chat(usr, "The scanner no longer shows limb damage.")
		
/obj/item/device/healthanalyzer/adv
	name = "advanced health analyzer"
	desc = "An advanced hand-held body scanner able to accurately distinguish vital signs of the subject. Now in gold!"
	icon_state = "advhealth"
	matter = list(DEFAULT_WALL_MATERIAL = 250)
	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	
/obj/item/device/healthanalyzer/adv/attack(mob/living/M as mob, mob/living/user as mob)
	health_scan_mob(M, user, TRUE)
	src.add_fingerprint(user)
	return
	
/obj/item/device/healthanalyzer/adv/attack_self(mob/user)
	health_scan_mob(user, user, TRUE)
	src.add_fingerprint(user)
	return

/obj/item/device/analyzer
	name = "analyzer"
	desc = "A hand-held environmental scanner which reports current gas levels."
	icon_state = "atmos"
	item_state = "analyzer"
	w_class = 2.0
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 5
	throw_speed = 4
	throw_range = 20

	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 20)

	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)

/obj/item/device/analyzer/atmosanalyze(var/mob/user)
	var/air = user.return_air()
	if (!air)
		return

	return atmosanalyzer_scan(src, air, user)

/obj/item/device/analyzer/attack_self(mob/user as mob)

	if (user.stat)
		return
	if (!usr.IsAdvancedToolUser())
		to_chat(usr, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	analyze_gases(src, user)
	return

/obj/item/device/mass_spectrometer
	name = "mass spectrometer"
	desc = "A hand-held mass spectrometer which identifies trace chemicals in a blood sample."
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = 2.0
	flags = CONDUCT | OPENCONTAINER
	slot_flags = SLOT_BELT
	throwforce = 5
	throw_speed = 4
	throw_range = 20

	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 20)

	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	var/details = 0
	var/recent_fail = 0

/obj/item/device/mass_spectrometer/New()
	..()
	var/datum/reagents/R = new/datum/reagents(5)
	reagents = R
	R.my_atom = src

/obj/item/device/mass_spectrometer/on_reagent_change()
	if(reagents.total_volume)
		icon_state = initial(icon_state) + "_s"
	else
		icon_state = initial(icon_state)

/obj/item/device/mass_spectrometer/attack_self(mob/user as mob)
	if (user.stat)
		return
	if (!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return
	if(reagents.total_volume)
		var/list/blood_traces = list()
		for(var/datum/reagent/R in reagents.reagent_list)
			if(R.id != "blood")
				reagents.clear_reagents()
				to_chat(user, "<span class='warning'>The sample was contaminated! Please insert another sample</span>")
				return
			else
				blood_traces = params2list(R.data["trace_chem"])
				break
		var/dat = "Trace Chemicals Found: "
		for(var/R in blood_traces)
			if(details)
				dat += "[R] ([blood_traces[R]] units) "
			else
				dat += "[R] "
		to_chat(user, "[dat]")
		reagents.clear_reagents()
	return

/obj/item/device/mass_spectrometer/adv
	name = "advanced mass spectrometer"
	icon_state = "adv_spectrometer"
	details = 1
	origin_tech = list(TECH_MAGNET = 4, TECH_BIO = 2)

/obj/item/device/reagent_scanner
	name = "reagent scanner"
	desc = "A hand-held reagent scanner which identifies chemical agents."
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = 2.0
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 5
	throw_speed = 4
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 20)

	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	var/details = 0
	var/recent_fail = 0

/obj/item/device/reagent_scanner/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if (user.stat)
		return
	if (!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return
	if(!istype(O))
		return

	if(!isnull(O.reagents))
		var/dat = ""
		if(O.reagents.reagent_list.len > 0)
			var/one_percent = O.reagents.total_volume / 100
			for (var/datum/reagent/R in O.reagents.reagent_list)
				dat += "\n \t <span class='notice'>[R][details ? ": [R.volume / one_percent]%" : ""]"
		if(dat)
			to_chat(user, "<span class='notice'>Chemicals found: [dat]</span>")
		else
			to_chat(user, "<span class='notice'>No active chemical agents found in [O].</span>")
	else
		to_chat(user, "<span class='notice'>No significant chemical agents found in [O].</span>")

	return

/obj/item/device/reagent_scanner/adv
	name = "advanced reagent scanner"
	icon_state = "adv_spectrometer"
	details = 1
	origin_tech = list(TECH_MAGNET = 4, TECH_BIO = 2)

/obj/item/device/slime_scanner
	name = "slime scanner"
	icon_state = "adv_spectrometer"
	item_state = "analyzer"
	origin_tech = list(TECH_BIO = 1)
	w_class = 2.0
	flags = CONDUCT
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 20)

/obj/item/device/slime_scanner/attack(mob/living/M as mob, mob/living/user as mob)
	if (!isslime(M))
		to_chat(user, "<B>This device can only scan slimes!</B>")
		return
	var/mob/living/carbon/slime/T = M
	user.show_message("Slime scan results:")
	user.show_message(text("[T.colour] [] slime", T.is_adult ? "adult" : "baby"))
	user.show_message(text("Nutrition: [T.nutrition]/[]", T.get_max_nutrition()))
	if (T.nutrition < T.get_starve_nutrition())
		user.show_message("<span class='alert'>Warning: slime is starving!</span>")
	else if (T.nutrition < T.get_hunger_nutrition())
		user.show_message("<span class='warning'>Warning: slime is hungry</span>")
	user.show_message("Electric change strength: [T.powerlevel]")
	user.show_message("Health: [T.health]")
	if (T.slime_mutation[4] == T.colour)
		user.show_message("This slime does not evolve any further")
	else
		if (T.slime_mutation[3] == T.slime_mutation[4])
			if (T.slime_mutation[2] == T.slime_mutation[1])
				user.show_message(text("Possible mutation: []", T.slime_mutation[3]))
				user.show_message("Genetic destability: [T.mutation_chance/2]% chance of mutation on splitting")
			else
				user.show_message(text("Possible mutations: [], [], [] (x2)", T.slime_mutation[1], T.slime_mutation[2], T.slime_mutation[3]))
				user.show_message("Genetic destability: [T.mutation_chance]% chance of mutation on splitting")
		else
			user.show_message(text("Possible mutations: [], [], [], []", T.slime_mutation[1], T.slime_mutation[2], T.slime_mutation[3], T.slime_mutation[4]))
			user.show_message("Genetic destability: [T.mutation_chance]% chance of mutation on splitting")
	if (T.cores > 1)
		user.show_message("Anomalious slime core amount detected")
	user.show_message("Growth progress: [T.amount_grown]/10")


/obj/item/device/price_scanner
	name = "price scanner"
	desc = "Using an up-to-date database of various costs and prices, this device estimates the market price of an item up to 0.001% accuracy."
	icon_state = "price_scanner"
	slot_flags = SLOT_BELT
	w_class = 2
	throwforce = 0
	throw_speed = 3
	throw_range = 3
	matter = list(DEFAULT_WALL_MATERIAL = 25, "glass" = 25)

/obj/item/device/price_scanner/afterattack(atom/movable/target, mob/user as mob, proximity)
	if(!proximity)
		return

	var/value = get_value(target)
	user.visible_message("\The [user] scans \the [target] with \the [src]")
	user.show_message("Price estimation of \the [target]: [value ? value : "N/A"] Credits")

/obj/item/device/breath_analyzer
	name = "breath analyzer"
	desc = "A hand-held breath analyzer that provides a robust amount of information about the subject's repository system."
	icon_state = "breath_analyzer"
	item_state = "analyzer"
	w_class = 2.0
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 0
	throw_speed = 3
	throw_range = 3
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 20)
	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)

/obj/item/device/breath_analyzer/attack(mob/living/carbon/human/H, mob/living/user as mob)

	if (!istype(H))
		to_chat(user,"<span class='warning'>You can't find a way to use \the [src] on [H]!</span>")
		return

	if ( ((user.is_clumsy()) || (DUMB in user.mutations)) && prob(20))
		to_chat(user,"<span class='danger'>Your hand slips from clumsiness!</span>")
		eyestab(H,user)
		to_chat(user,"<span class='danger'>Alert: No breathing detected.</span>")
		return

	if (!user.IsAdvancedToolUser())
		to_chat(user,"<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	if(user == H && !H.can_eat(src))
		return
	else if(!H.can_force_feed(user, src))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(H)

	user.visible_message("<span class='notice'>[user] is trying to take a breath sample from [H].</span>","<span class='notice'>You gently insert \the [src] into [H]'s mouth.</span>")

	if (!LAZYLEN(src.other_DNA))
		LAZYADD(src.other_DNA, H.dna.unique_enzymes)
		src.other_DNA_type = "saliva"

	if (!do_after(user, 2 SECONDS, act_target = H))
		to_chat(user,"<span class='notice'>You and the target need to be standing still in order to take a breath sample.</span>")
		return

	user.visible_message("<span class='notice'>[user] takes a breath sample from [H].</span>","<span class='notice'>\The [src] clicks as it finishes reading [H]'s breath sample.</span>")

	to_chat(user,"<b>Breath Sample Results:</b>")

	if(H.stat == DEAD || H.losebreath || !H.breathing)
		to_chat(user,"<span class='danger'>Alert: No breathing detected.</span>")
		return

	switch(H.getOxyLoss())
		if(0 to 25)
			to_chat(user,"Subject oxygen levels nominal.")
		if(25 to 50)
			to_chat(user,"<font color='blue'>Subject oxygen levels abnormal.</font>")
		if(50 to INFINITY)
			to_chat(user,"<font color='blue'><b>Severe oxygen deprivation detected.</b></font>")

	var/obj/item/organ/L = H.internal_organs_by_name[BP_LUNGS]
	if(istype(L))
		if(L.is_bruised())
			to_chat(user,"<font color='red'><b>Ruptured lung detected.</b></font>")
		else if(L.is_damaged())
			to_chat(user,"<b>Damaged lung detected.</b>")
		else
			to_chat(user,"Subject lung health nominal.")
	else
		to_chat(user,"<span class='warning'>Subject lung health unknown.</span>")

	var/additional_string = "<font color='green'>\[NORMAL\]</font>"
	var/bac = H.get_blood_alcohol()
	switch(bac)
		if(INTOX_JUDGEIMP to INTOX_MUSCLEIMP)
			additional_string = "\[LIGHTLY INTOXICATED\]"
		if(INTOX_MUSCLEIMP to INTOX_VOMIT)
			additional_string = "\[MODERATELY INTOXICATED\]"
		if(INTOX_VOMIT to INTOX_BALANCE)
			additional_string = "<font color='red'>\[HEAVILY INTOXICATED\]</font>"
		if(INTOX_BALANCE to INTOX_DEATH)
			additional_string = "<font color='red'>\[ALCOHOL POISONING LIKELY\]</font>"
		if(INTOX_DEATH to INFINITY)
			additional_string = "<font color='red'>\[DEATH IMMINENT\]</font>"
	to_chat(user,"<span class='normal'>Blood Alcohol Content: [round(bac,0.01)] <b>[additional_string]</b></span>")

	if(H.breathing && H.breathing.total_volume)
		var/unknown = 0
		for(var/datum/reagent/R in H.breathing.reagent_list)
			if(R.scannable)
				to_chat(user,"<span class='notice'>[R.name] found in subject's respitory system.</span>")
			else
				++unknown
		if(unknown)
			to_chat(user,"<span class='warning'>Non-medical reagent[(unknown > 1)?"s":""] found in subject's respitory system.</span>")
