/datum/faction/nano_trasen
	name = "Colony Personnel"
	description = "The standard worker on the colony. Welcome to the Sandros, the Sandros Colony Hub, and, of course, welcome home."
	title_suffix = "CIV"

	is_default = TRUE

/datum/faction/nano_trasen/New()
	..()

	allowed_role_types = list()

	for (var/datum/job/job in SSjobs.occupations)
		allowed_role_types += job.type

	// Really shitty hack until I get around to rewriting jobs a bit.
	allowed_role_types -= list(
		/datum/job/merchant,
		/datum/job/officer,
		/datum/job/representative,
		/datum/job/warden,
		/datum/job/hos,
		/datum/job/detective,
		/datum/job/forensics,
		/datum/job/intern_sec,
		/datum/job/captain,
		/datum/job/hop,
		/datum/job/cmo,
		/datum/job/rd,
		/datum/job/ai,
		/datum/job/cyborg,
		/datum/job/chief_engineer
	)