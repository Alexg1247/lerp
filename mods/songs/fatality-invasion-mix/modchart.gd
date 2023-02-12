extends Modchart

func beat_hit():
	match Conductor.cur_beat:
		542:
			$speech.text = "MY TURN."
		545:
			$speech.text = ""
		552:
			$speech.text = "WHATS OCCURRED?" # whats occurred
		554:
			$speech.text = "WHATS OCCURRED? ANOTHER"
		556:
			$speech.text = "FATAL"
		558:
			$speech.text = "FATAL ERROR"
		560:
			$speech.text = "FILLING"
		561:
			$speech.text = "FILLING LESSER"
		563:
			$speech.text = "FILLING LESSER SOULS WITH"
		564:
			$speech.text = "RAGING"
		566:
			$speech.text = "RAGING TERROR"
		568:
			$speech.text = "NEVER"
		569:
			$speech.text = "NEVER INTENDED"
		572:
			$speech.text = "TO BE"
		573:
			$speech.text = "TO BE A"
		574:
			$speech.text = "TO BE A SCARER"
		576:
			$speech.text = "IT SEEMS"
		577:
			$speech.text = "IT SEEMS LIKE YOU"
		580:
			$speech.text = "IT SEEMS LIKE YOU WANT"
		582:
			$speech.text = "IT SEEMS LIKE YOU WANT MORE FROM ME"
		584:
			$speech.text = ""
		
