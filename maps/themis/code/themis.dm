// This file is not included because this map does not work at the moment.

/datum/map/themis
	name = "Themis Alpha"
	full_name = "Themis Alpha Colony"
	path = "themis"

	lobby_screens = list("exodus_art")

	station_name = "Themis Alpha Colony"
	station_short = "Themis"
	dock_name = "TRDF Artemis"
	dock_short = "Artemis"
	boss_name = "High Command"
	boss_short = "HighCom"
	company_name = "Terran Republics"
	company_short = "TAR"
	system_name = "Epsilon Segunta"

	station_networks = list(
		NETWORK_CIVILIAN_EAST,
		NETWORK_CIVILIAN_WEST,
		NETWORK_COMMAND,
		NETWORK_ENGINE,
		NETWORK_ENGINEERING,
		NETWORK_ENGINEERING_OUTPOST,
		NETWORK_STATION,
		NETWORK_MEDICAL,
		NETWORK_MINE,
		NETWORK_RESEARCH,
		NETWORK_RESEARCH_OUTPOST,
		NETWORK_ROBOTS,
		NETWORK_PRISON,
		NETWORK_SECURITY
	)

	shuttle_docked_message = "The scheduled Crew Transfer Shuttle to %dock% has docked with the station. It will depart in approximately %ETA% minutes."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% minutes until the shuttle docks at %dock%."
	shuttle_called_message = "A crew transfer to %dock% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA% minutes."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station. You have approximately %ETD% minutes to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% minutes until the shuttle docks at %dock%."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive in approximately %ETA% minutes."

	station_levels = list(4,5)
	admin_levels = list(5)
	contact_levels = list(1, 2)
	player_levels = list(1, 2, 3, 5, 4, 5, 6)
	accessible_z_levels = list("1" = 5, "3" = 10, "4" = 15, "5" = 10, "6" = 60)

/datum/map/exodus/generate_asteroid()
	new /datum/random_map/automata/cave_system(null, 13, 32, 5, 217, 223)
	new /datum/random_map/noise/ore(null, 13, 32, 5, 217, 223)

/datum/map/exodus/finalize_load()
	world.maxz++
