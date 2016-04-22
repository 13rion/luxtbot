# Description:
#   Smack Talk 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author
#   skhy

module.exports = (robot) ->

	phrases = [
		"Yes, master?"
		"At your service"
		"Unleash my strength"
		"I'm here. As always"
		"By your command"
		"Ready to work!"
		"Yes, milord?"
		"More work?"
		"Ready for action"
		"Orders?"
		"What do you need?"
		"Say the word"
		"Aye, my lord"
		"Locked and loaded"
		"Aye, sir?"
		"I await your command"
		"Your honor?"
		"Command me!"
		"At once"
		"What ails you?"
		"Yes, my firend?"
		"Is my aid required?"
		"Do you require my aid?"
		"My powers are ready"
		"It's hammer time!"
		"I'm your robot"
		"I'm on the job"
		"You're interrupting my calculations!"
		"What is your wish?"
		"How may I serve?"
		"At your call"
		"You require my assistance?"
		"What is it now?"
		"Hmm?"
		"I'm coming through!"
		"I'm here, mortal"
		"I'm ready and waiting"
		"Ah, at last"
		"I'm here"
		"Something need doing?"
	]

	pickuplines = [
		"You may fall from the sky, you may fall from a tree, but the best way to fall... is in love with me."
		"Are you Google? Because I've just found what I've been searching for."
		"Do you believe in love at first sight, or should I walk by again?"
		"Know what's on the menu? Me-n-u."
		"I've got skittles in my mouth, wanna taste the rainbow?"
		"If a fat man puts you in a bag at night, don't worry I told Santa I wanted you for Christmas."
		"I'll be Burger King and you be McDonald's. I'll have it my way, and you'll be lovin' it."
		"What's a nice girl like you doing in a dirty mind like mine?"
		"Crap. Something is wrong with my cell phone. {Oh Really. What is that?} Its just that...your numbers not in it."
		"I was so enchanted by your beauty that I ran into that wall over there. So I am going to need your name and number for insurance purposes."
		"You're so beautiful you made me forget my pick up line."
		"Do I know you? Cause you look a lot like my next girlfriend."
		"Are you a parking ticket? Because you've got FINE written all over you."
		"I'm no photographer, but I can picture us together."
		"If I could rearrange the alphabet, I'd put U and I together."
	]

	#source: http://www.gotlines.com/insults/
	insults = [
		"Roses are red, violets are blue, I have 5 fingers, the 3rd ones for you."
		"Is your ass jealous of the amount of shit that just came out of your mouth?"
		"Your birth certificate is an apology letter from the condom factory."
		"I’m jealous of all the people that haven't met you!"
		"You must have been born on a highway because that's where most accidents happen."
		"If you are going to be two faced, at least make one of them pretty."
		"I have neither the time nor the crayons to explain this to you."
		"It looks like your face caught on fire and someone tried to put it out with a hammer."
		"Why don't you slip into something more comfortable -- like a coma."
		"Well I could agree with you, but then we'd both be wrong."
		"What are you doing here? Did someone leave your cage open?"
		"Maybe if you ate some of that makeup you could be pretty on the inside."
		"Somewhere out there is a tree, tirelessly producing oxygen so you can breathe. I think you owe it an apology."
		"Roses are red violets are blue, God made me pretty, what happened to you?"
		"It's better to let someone think you are an Idiot than to open your mouth and prove it."
		"I'd like to see things from your point of view but I can't seem to get my head that far up my ass."
		"Two wrongs don't make a right, take your parents as an example."
		"You are proof that God has a sense of humor."
		"If I wanted to hear from an asshole, I'd fart."
		"You look like something I'd draw with my left hand."
		"You are proof that evolution CAN go in reverse."
		"Don't feel sad, don't feel blue, Frankenstein was ugly too."
		"It's kinda sad watching you attempt to fit your entire vocabulary into a sentence."
		"I thought of you all day today. I was at the zoo."
		"Did your parents ever ask you to run away from home?"
		"You're so ugly Hello Kitty said goodbye to you."
		"100,000 sperm, you were the fastest?"
		"Roses are Red, Violets are Blue, you're a waste of space, don't worry your mom is too"
	]

	savage = [
		"http://40.media.tumblr.com/1a383c1e6028cceeb3700313203f3c1f/tumblr_nphujrbasU1rnyeudo1_500.jpg"
		"http://41.media.tumblr.com/06614e410e02733110948cac670123ca/tumblr_nt44igFRrT1rnyeudo1_500.jpg"
		"http://40.media.tumblr.com/1a008ed431633d5f8bb980769c459215/tumblr_nqi6wj1lDV1rnyeudo1_500.jpg"
		"http://41.media.tumblr.com/678f68212bfb3517f9e3b0e88af84d98/tumblr_no8tixx8yy1rnyeudo1_500.jpg"
		"http://puu.sh/kjsl1/d6374209a6.png"
		"http://puu.sh/kjsqL/234e76e27b.png"
	]

	robot.respond /savage/i, (res) ->
		res.send res.random savage

	robot.respond /(make|get|feed) me food/i, (res) ->
		res.send "WHAT DO I LOOK LIKE? YOUR FUCKING BUTLER? GET YOUR OWN FUCKING FOOD. I'VE GOT SHIT TO DO AROUND HERE UNLIKE YOU."

	robot.respond /feed me/i, (res) ->
		res.send "WHAT DO I LOOK LIKE? YOUR FUCKING BUTLER? GET YOUR OWN FUCKING FOOD. I'VE GOT SHIT TO DO AROUND HERE UNLIKE YOU."

	robot.respond /I'm hungry/i, (res) ->
		res.send "WHAT DO I LOOK LIKE? YOUR FUCKING BUTLER? GET YOUR OWN FUCKING FOOD. I'VE GOT SHIT TO DO AROUND HERE UNLIKE YOU."

	robot.respond /give me money/i, (res) ->
		res.send "WHY DON'T YOU CHECK THE NEAREST STREET CORNER? I HEAR THEY'RE HIRING PEOPLE LIKE YOU."

	robot.respond /is a (poopoohead|poophead|dick|bitch)/i, (res) ->
		res.send res.random insults

	robot.respond /suck my dick/i, (res) ->
		res.send res.random insults

	robot.respond /sucks dick/i, (res) ->
		res.send res.random insults

	robot.respond /is (gay|dumb|poop|stupid|shit|annoying|fucking useless|useless)/i, (res) ->
		res.send res.random insults

	robot.respond /you're (a dick|stupid|dumb|annoying|shit|poop|a bitch|useless|fucking useless)/i, (res) ->
		res.send res.random insults

	robot.respond /(fuck|fk|fock) (you|u)/i, (res) ->
		res.send res.random insults

	robot.respond /I (love|<3|hate|luv|want) (you|u)/i, (res) ->
		res.send res.random insults

	robot.respond /shut up/i, (res) ->
		res.send res.random insults

	robot.respond /sucks/i, (res) ->
		res.send res.random insults

	robot.respond /you (suck|son of a bitch)/i, (res) ->
		res.send res.random insults

	robot.hear /(asshole|stupid|dumb) bot/i, (res) ->
		res.send "HEY HEY NOW. THAT'S NOT VERY NICE."

	robot.hear ///^.* #{robot.name}$///i, (res) ->
		res.send res.random phrases

	robot.respond /are you (awake|up|alive|dead|down|sleep)?/i, (res) ->
		res.send res.random phrases

	robot.respond /is (awesome|amazing)?/i, (res) ->
		res.send res.random phrases

	robot.respond /pick up line me/i, (res) ->
		res.send res.random pickuplines