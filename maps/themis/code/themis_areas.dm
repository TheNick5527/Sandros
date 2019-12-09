area/syndicate_station/southwest
	name = "\improper south-west of SS13"
	icon_state = "southwest"

/area/syndicate_station/northwest
	name = "\improper north-west of SS13"
	icon_state = "northwest"

/area/syndicate_station/northeast
	name = "\improper north-east of SS13"
	icon_state = "northeast"

/area/syndicate_station/southeast
	name = "\improper south-east of SS13"
	icon_state = "southeast"

/area/syndicate_station/north
	name = "\improper north of SS13"
	icon_state = "north"

/area/syndicate_station/south
	name = "\improper south of SS13"
	icon_state = "south"

/area/syndicate_station/commssat
	name = "\improper south of the communication satellite"
	icon_state = "south"

/area/syndicate_station/mining
	name = "\improper north east of the mining asteroid"
	icon_state = "north"
/area/skipjack_station/southwest_solars
	name = "\improper aft port solars"
	icon_state = "southwest"

/area/skipjack_station/northwest_solars
	name = "\improper fore port solars"
	icon_state = "northwest"

/area/skipjack_station/northeast_solars
	name = "\improper fore starboard solars"
	icon_state = "northeast"

/area/skipjack_station/southeast_solars
	name = "\improper aft starboard solars"
	icon_state = "southeast"

/area/skipjack_station/mining
	name = "\improper nearby mining asteroid"
	icon_state = "north"

/area/gateway
	name = "\improper Gateway"
	icon_state = "teleporter"

/area/medical/surgery2
	name = "\improper Operating Theatre 2"
	icon_state = "surgery"

/area/alien
	name = "\improper Alien base"
	icon_state = "yellow"
	requires_power = 0

/area/AIsattele
	name = "\improper AI Satellite Teleporter Room"
	icon_state = "teleporter"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "\improper Alien Shuttle Base"
	requires_power = 1

/area/shuttle/alien/mine
	icon_state = "shuttle"
	name = "\improper Alien Shuttle Mine"
	requires_power = 1

/*
 * THEMIS AREAS
*/

// Main areas

/area/themis/entry/gammadock
	name = "\improper Gamma Dock"
	icon_state = "gamma_dock"
	holomap_color = HOLOMAP_AREACOLOR_ARRIVALS

// Medical HOLOMAP_AREACOLOR_MEDICAL


/area/themis/medical
	station_area = 1
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

// Main level

/area/themis/medical/mainlevel/hallwaywest
	name = "\improper Medical Main Level Hallway West"
	icon_state = "medbay"
	sound_env = LARGE_ENCLOSED

/area/themis/medical/mainlevel/staffhallwaynorth
	name = "\improper Medical Main Level Staff Hallway North"
	icon_state = "medbay2"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/reception
	name = "\improper Medical Main Level Reception"
	icon_state = "medbay3"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/gtw
	name = "\improper Medical Main General Treatment Ward #1"
	icon_state = "patients"
	sound_env = LARGE_ENCLOSED

/area/themis/medical/mainlevel/gtw/two
	name = "\improper Medical Main General Treatment Ward #2"
	icon_state = "patients"
	sound_env = LARGE_ENCLOSED


/area/themis/medical/mainlevel/staffrotunda
	name = "\improper Medical Main Level Staff Facilities Rotunda"
	icon_state = "medbay4"
	sound_env = LARGE_ENCLOSED

/area/themis/medical/mainlevel/pharmacy
	name = "\improper Medical Main Level Pharmacy"
	icon_state = "phar"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/primarystorage
	name = "\improper Medical Main Level Primary Storage"
	icon_state = "exam_room"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/surgicalstorage
	name = "\improper Medical Main Level Surgical Storage"
	icon_state = "exam_room"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/surgicalhallway
	name = "\improper Medical Main Level Surgical Hallway North"
	icon_state = "surgery"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/surgicalhallway/south
	name = "\improper Medical Main Level Surgical Hallway South"
	icon_state = "surgery"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/operatingtheatre
	name = "\improper Medical Main Level Operating Theatre #1"
	icon_state = "surgery"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/operatingtheatre/two
	name = "\improper Medical Main Level Operating Theatre #2"
	icon_state = "surgery"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/powerfacilities
	name = "Medical Main Level Power Sub-room"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/substation
	name = "Medical Main Level Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/mdoffice
	name = "Medical Main Level Medical Director's Office"
	icon_state = "head_quarters"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/janitorial
	name = "Medical Main Level Medical Janitorial Closet"
	icon_state = "janitor"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/mainlevel/security
	name = "Medical Main Level Medical Security Office"
	icon_state = "checkpoint1"
	sound_env = SMALL_ENCLOSED

// Sub level

/area/themis/medical/sublevel/morguea
	name = "\improper Morgue A"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/morgueb
	name = "\improper Morgue B"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/controlroom
	name = "\improper Morgue Control Room"
	icon_state = "exam_room"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/autopsy
	name = "\improper Autopsy Room"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/storage
	name = "\improper Sublevel Morgue Storage"
	icon_state = "exam_room"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/coroneroffice
	name = "\improper Coroner's Office"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/hallway
	name = "\improper Medical Sublevel Hallway"
	icon_state = "medbay"
	sound_env = LARGE_ENCLOSED

/area/themis/medical/sublevel/substation
	name = "Medical Sublevel Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/themis/medical/sublevel/ventshaft
	name = "Medical Sublevel Vent Shaft"
	icon_state = "maint_medbay"
	flags = RAD_SHIELDED | HIDE_FROM_HOLOMAP
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	ambience = list(
		'sound/ambience/ambimaint1.ogg',
		'sound/ambience/ambimaint2.ogg',
		'sound/ambience/ambimaint3.ogg',
		'sound/ambience/ambimaint4.ogg',
		'sound/ambience/ambimaint5.ogg'
	)
	station_area = 1

/area/themis/medical/sublevel/elevatorshaft
	name = "\improper Medical Sublevel Elevator Shaft"
	icon_state = "maint_medbay"
	flags = RAD_SHIELDED | HIDE_FROM_HOLOMAP
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	ambience = list(
		'sound/ambience/ambimaint1.ogg',
		'sound/ambience/ambimaint2.ogg',
		'sound/ambience/ambimaint3.ogg',
		'sound/ambience/ambimaint4.ogg',
		'sound/ambience/ambimaint5.ogg'
	)
	station_area = 1