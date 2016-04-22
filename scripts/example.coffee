# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md
module.exports = (robot) ->
  # partySize = []

  # robot.respond /test/i, (res) ->
  #   daily = (res) ->
  #     arr = [{id: "boo", author: "you", names: ['brion','krissy','steph','vik']},{id: "boo2", author: "you2", names: ['brion2','krissy2','steph2','vik2']},{id: "boo3", author: "you3", names: ['brion3','krissy3','steph3','vik3']}]
  #     moo = arr[0].names.map (arr) ->
  #       arr
  #     robot.send {room: "#marketplace"}, moo.join("\n")
  #   username = (res) ->
  #     res.send "brion"

  #   daily(res)

    # robot.send {room: "#marketplace"}, 
  #   username = "krissy"
  #   arr = [{id: "boo", author: "you", names: ['brion','krissy','steph','vik']},{id: "boo2", author: "you2", names: ['brion2','krissy2','steph2','vik2']},{id: "boo3", author: "you3", names: ['brion3','krissy3','steph3','vik3']}]

  #   arr_index_of = -1
  #   for names, i in arr[0].names
  #     if names == username
  #       arr_index_of = i

  #   arr[0].names.splice( arr_index_of, 1 ) if -1 != arr_index_of
  #   console.log(arr)

    # arr = [{id: "boo", author: "you", names: ['brion','krissy','steph','vik']},{id: "boo2", author: "you2", names: ['brion2','krissy2','steph2','vik2']},{id: "boo3", author: "you3", names: ['brion3','krissy3','steph3','vik3']}]
    # moo = arr[0].names.map (arr) ->
    #   arr
    # res.send moo.join("\n")

    # for i in [1..8]
    #   partySize.push [i]
    # res.send [partySize.slice(0, -1).join('.\n'), partySize.slice(-1)[0]].join('.\n') + "."
  #   robot.brain.data.test ?= []
  #   id = "E" + Math.floor(Math.random() * (10000 - 1000 + 1) << 0)
  #   robot.brain.data.test.push { id: id, author: "author", event: "topic" , names: []}

  # robot.respond /rawr/i, (res) ->
  #   robot.brain.data.test ?= []
  #   robot.brain.data.test[0].names.push "name"

    #   robot.respond /rawr/i, (res) ->
    # robot.brain.data.test ?= []
    # robot.brain.data.test[0].name = {author: "replaced", event: "replaced" }

    # robot.hear /badger/i, (res) ->
    #  res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

    # robot.respond /open the (.*) doors/i, (res) ->
    #  doorType = res.match[1]
    #  if doorType is "pod bay"
    #    res.reply "I'm afraid I can't let you do that."
    #  else
    #    res.reply "Opening #{doorType} doors"

    # robot.hear /I like pie/i, (res) ->
    #  res.emote "makes a freshly baked pie"

    # lulz = ['lol', 'rofl', 'lmao']

    # robot.respond /lulz/i, (res) ->
    #  res.send res.random lulz
  
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  
  
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  
  # annoyIntervalId = null
  
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  
  
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  
  #   robot.messageRoom room, "I have a secret: #{secret}"
  
  #   res.send 'OK'
  
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
    # robot.respond /have a soda/i, (res) ->
    #  # Get number of sodas had (coerced to a number).
    #  sodasHad = robot.brain.get('totalSodas') * 1 or 0

    #  if sodasHad > 4
    #    res.reply "I'm too fizzy.."

    #  else
    #    res.reply 'Sure!'

    #    robot.brain.set 'totalSodas', sodasHad+1
  
    # robot.respond /sleep it off/i, (res) ->
    #  robot.brain.set 'totalSodas', 0
    #  res.reply 'zzzzz'

    # robot.respond /ap calc (.*):(.*):(.*):(.*):(.*)/i, (res) ->
    #   level = parseInt(res.match[1])
    #   enhance = parseInt(res.match[2])
    #   enchant1 = parseInt(res.match[3])
    #   enchant2 = parseInt(res.match[4])
    #   quality = parseInt(res.match[5])

    #   switch level
    #     when 60 then level = 500
    #     when 70 then level = 2000
    #     when 80 then level = 5000
    #     when 90 then level = 16000
    #     else level = 0

    #   switch enhance
    #     when 8 then enhance = 500
    #     when 9 then enhance = 1000
    #     when 10 then enhance = 2000
    #     when 11 then enhance = 5000
    #     when 12 then enhance = 8000
    #     when 13 then enhance = 13000
    #     when 14 then enhance = 20000
    #     when 15 then enhance = 30000
    #     else enhance = 0

    #   switch enchant1
    #     when 9 then enchant1 = 1000
    #     when 8 then enchant1 = 1000
    #     when 7 then enchant1 = 1000
    #     else enchant1 = 0

    #   switch enchant2
    #     when 9 then enchant2 = 1000
    #     when 8 then enchant2 = 1000
    #     when 7 then enchant2 = 1000
    #     else enchant2 = 0

    #   switch quality
    #     when 3 then quality = 1000
    #     when 4 then quality = 1000
    #     when 5 then quality = 2000
    #     else quality = 0


    #   total = level + quality + enchant1 + enchant2 + enhance
    #   res.send total + " AP"

    # robot.respond /ap calc help/i, (res) ->
    #   res.send "Format: 'ap calc [level]:[enhance level]:[enchant number]:[enchant number]:[quality number]'"
    #   res.send "If artifact, type 'ap calc artifact'"
      
    # robot.respond /ap calc artifact/i, (res) ->
    #   res.send "5000 AP"

    #Send DM
    #https://github.com/slackhq/hubot-slack/issues/159
    # robot.respond /secret/i, (res) ->
    #   user = robot.brain.userForId res.envelope.user.id
    #   robot.send {room: res.envelope.user.name}, "How many"
    #   robot.respond /(.*)/i, (res) ->
    #     doorType = res.match[1]
    #     robot.send {room: res.envelope.user.name}, doorType