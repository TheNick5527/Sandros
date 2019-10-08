/datum/faction/unaffiliated
	name = "Independent"
	description = {"<p>
	For individuals not necessarily tied to any of the governmental bodies lording
	over space, the mark of "independent" can open as many doors as it is likely to
	close. You would often see people lacking a concrete affiliation popping up as
	reporters, journalists, individual traders. Their presence, though often an inconvenience
	for the government, is often vital to keeping the people happy, and falsely informed.
	</p>"}

	allowed_role_types = list(
		/datum/job/journalist,
		/datum/job/merchant
	)

/datum/faction/unaffiliated/get_logo_name()
	return "faction_unaffiliated.png"
