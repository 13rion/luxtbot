# # Description:
# #   Marketplace 
# #
# # Dependencies:
# #   None
# #
# # Configuration:
# #   None
# #
# # Commands:
# #
# # Author
# #   skhy

# isPrivateMsg = (res) ->
#   res.message.room == res.message.user.name

# getUsername = (res) ->
#   res.message.user.name

module.exports = (robot) ->
#     topic = ""

#     #In Marketplace Chat
#     robot.hear /(buying |selling |trading |b>|s>|lf>|f>|t>)(.*)/i, (res) ->
#       room = res.message.room
#       if room is "marketplace"
#         topic = res.match[1] + " " + res.match[2]
#         user = robot.brain.userForId res.envelope.user.id

#         robot.send {room: res.envelope.user.name}, 'Would you like me to post "' + topic + '" daily in the #marketplace channel? Reply with "mp post daily"'

#     robot.hear /mp post (.*)/i, (res) ->
#       if isPrivateMsg(res)
#         name = res.message.user.name
#         input = res.match[1]
#         robot.brain.data.marketplace ?= []
#         robot.brain.data.marketplace.push { name: name, topic: topic }
#         res.send 'Added. To Remove, reply with "FUCK I MESSED UP"'

#     robot.hear /FUCK I MESSED UP/i, (res) ->
#       res.send "Too bad, so sad. Contact Brion :_haha:"
