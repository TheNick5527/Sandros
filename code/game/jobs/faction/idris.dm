/datum/faction/idris_incorporated
	name = "Colony Administration"
	description = {"<p>
	Welcome to your colony, Administration. You've been tasked with
	leading this place in it's new coming years for the glory of the
	Terran Republic. We're going to prove to everyone that we're more
	than just talk and an iron fist. Do us proud, or don't bother coming
	back.
	</p>
	<p>Some character examples are:
	<ul>
	<li><b>Underqualified Colony Director</b>: You're not quite sure how
	you got this job. You did, however, get a confirmation in the mail that
	you were one of the several Directors picked to lead this colony on the
	frontier. You guess they needed anyone they could get. It may be best to
	listen to the senior military staff, and your underlings who may know what
	they're doing.</li>
	<li><b>Unethical Science Director</b>: Science. The thing that keeps the
	galaxy spinning around that black hole in the center. At least so you think.
	Scientific process must be continued, and you took the first posting that could
	get you even more pull in the scientific community. A well renowned scientist
	in your departmental circles, perhaps you could even get away with human experiments
	out here, away from all that armed government oversight... this is, of course, yours now.</li>
	</ul></p>"}
	title_suffix = "ADMIN"

	allowed_role_types = list(
		/datum/job/captain,
		/datum/job/hop,
		/datum/job/rd,
		/datum/job/chief_engineer,
		/datum/job/cmo
	)

	allowed_species_types = list(
		/datum/species/human,
		/datum/species/skrell,
		/datum/species/machine,
		/datum/species/tajaran,
		/datum/species/unathi
	)
