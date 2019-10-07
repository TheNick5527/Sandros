/datum/faction/eridani_pmc
	name = "Terran Eighth Fleet Command"
	description = {"<p>
	Welcome to the Terran Eighth Fleet. Whether you're a brand new officer, an enlisted
	who's been serving for the better part of fifteen years, you've gained yourself a
	position leading people. Whether you plan to lead with an iron fist, or with a
	flowery persona, keep in mind you're going to be held accountable for any orders
	you give. Be that saving the colony and earning yourself a promotion, or leading
	your mean to death and getting... taken care of.
	</p>
	<p>Some character examples are:
	<ul>
	<li><b>Die-hard Protections Commander</b>: You are the law, civil disorder
	is something you won't stand for. You uphold the colony's law with an
	iron fist, and you won't relinquish it unless you're bleeding out on the
	snow. And even then, the loyalty you inspire keeps your men fellowing your
	word even after. We're proud to have you, Security Chief.</li>
	<li><b>Fleet Intelligence Representative</b>: You are the direct link to
	High Command on the Sandros, with a top secret clearance and the ability,
	knowledge, and will to help the people on this colony run it cleanly, efficiently,
	and following government and military standards. This also means you take care of
	any complaints that may come across your desk. You do, of course, manage all the
	enlisted.</li>
	</ul></p>"}
	title_suffix = "COM"

	allowed_role_types = list(
		/datum/job/representative,
		/datum/job/hos
	)

	allowed_species_types = list(
		/datum/species/human
	)

	titles_to_loadout = list(
		"Security Chief" = /datum/outfit/job/hos/command,
		"Fleet Intelligence Representative" = /datum/outfit/job/representative/command
	)

/datum/outfit/job/hos/command
	name = "Security Chief - COM"
	uniform = /obj/item/clothing/under/military/command
	id = /obj/item/weapon/card/id/gold

/datum/outfit/job/representative/command
	name = "Fleet Intelligence Representative - COM"
	uniform = /obj/item/clothing/under/military/snco
	id = /obj/item/weapon/card/id/gold