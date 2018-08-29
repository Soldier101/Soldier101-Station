//Original coding by Wicker0

/datum/game_mode/purge
	name = "purge"
	config_tag = "purge"
	false_report_weight = 5
	required_players = 10

	announce_span = "purge notice"
	announce_text = "Since this is a purge round rules will be pretty low. Additionally, do not expect admins to answer ahelps as they are not obliged to. Have fun and enjoy the round! -Wicker0"
/datum/game_mode/purge/pre_setup()
	return 1

//Announce the transmission
/datum/game_mode/purge/generate_report()
	return "The transmission mostly failed to mention your sector. It is possible that external threats may effect the experiment. Keep this in mind."

/datum/game_mode/purge/announced
	name = "purge"
	config_tag = "purge"
	false_report_weight = 0

/datum/game_mode/extended/announced/generate_station_goals()
	for(var/T in subtypesof(/datum/station_goal))
		var/datum/station_goal/G = new T
		station_goals += G
		G.on_report()

/datum/game_mode/extended/announced/send_intercept(report = 0)
	priority_announce("Greetings [station_name()]. Your station is undergoing a social experiment. For this entire shift space law has been revoked for all members. How you react is up to yourselves. You may team up or kill as you see fit. Calling the shuttle is not advised as this will end the experiment which is a 'one time deal.'Enjoy your freedom. Bless NanoTrasen.", "Security Report", 'code/modules/antagonists/purge/purgecommence.ogg')

