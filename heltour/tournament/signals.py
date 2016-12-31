from django.dispatch.dispatcher import Signal

# Signals that run tasks
do_generate_pairings = Signal(providing_args=['round_id', 'overwrite'])
do_round_transition = Signal(providing_args=['round_id'])
do_pairings_published = Signal(providing_args=['round_id'])
do_validate_registration = Signal(providing_args=['reg_id'])

# Signals that send notifications
pairing_forfeit_changed = Signal(providing_args=['instance'])
player_account_status_changed = Signal(providing_args=['instance', 'old_value', 'new_value'])
notify_mods_unscheduled = Signal(providing_args=['round_'])
notify_mods_no_result = Signal(providing_args=['round_'])
pairings_generated = Signal(providing_args=['round_'])
no_round_transition = Signal(providing_args=['season', 'warnings'])
starting_round_transition = Signal(providing_args=['season', 'msg_list'])
alternate_search_started = Signal(providing_args=['season', 'team', 'board_number', 'round_'])
alternate_search_reminder = Signal(providing_args=['season', 'team', 'board_number', 'round_'])
alternate_search_all_contacted = Signal(providing_args=['season', 'team', 'board_number', 'round_', 'number_contacted'])
alternate_search_failed = Signal(providing_args=['season', 'team', 'board_number', 'round_'])
alternate_assigned = Signal(providing_args=['season', 'alt_assignment'])
alternate_needed = Signal(providing_args=['alternate', 'response_time', 'accept_url', 'decline_url'])
alternate_spots_filled = Signal(providing_args=['alternate', 'response_time'])
notify_players_round_start = Signal(providing_args=['round_'])
notify_players_unscheduled = Signal(providing_args=['round_'])
notify_players_game_time = Signal(providing_args=['pairing'])
before_game_time = Signal(providing_args=['player', 'pairing', 'offset'])
game_warning = Signal(providing_args=['pairing', 'warning'])
