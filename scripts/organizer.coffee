# Description:
#   Organizer 
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

isPrivateMsg = (res) ->
  res.message.room == res.message.user.name

module.exports = (robot) ->
  prefix = ""
  topic = ""
  id = 0
  open = 0
  partySize = []
  party = []
  author = ""

  #In Raid Chat
  robot.hear /(hosting|playing|doing|running) (.*)/i, (res) ->
    room = res.message.room
    if room is "raids-activities"
      prefix = res.match[1]
      topic = res.match[2]
      user = robot.brain.userForId res.envelope.user.id

      #Random Number - http://stackoverflow.com/questions/1527803/generating-random-numbers-in-javascript-in-a-specific-range
      id = "E" + Math.floor(Math.random() * (10000 - 1000 + 1) << 0)

      robot.send {room: res.envelope.user.name}, 'Would you like me to organize ' + topic + '? Reply with "<# of Open Spots>"'
# http://stackoverflow.com/questions/19715303/regex-that-accepts-only-numbers-0-9-and-no-characters
  robot.respond /(^[0-9]+$)/i, (res) ->
    if isPrivateMsg(res) and id isnt 0
      author = res.message.user.name
      open = res.match[1]
      robot.brain.data.activities ?= []
      for i in [1..open]
        partySize.push [i]

      robot.brain.data.activities.push { id: id, author: author, topic: topic, names: [] }
      robot.messageRoom "#raids-activities", topic + '(Reply with "Join ' + id + '"):\n' + [partySize.slice(0, -1).join('.\n'), partySize.slice(-1)[0]].join('.\n') + "."
      # .toString vs .join - http://stackoverflow.com/questions/1398830/add-different-delimiters-in-javascript-tostring
      # res.send topic + '(Reply with "Join ' + id + '"):\n' + [partySize.slice(0, -1).join('.\n'), partySize.slice(-1)[0]].join('.\n') + "."


  robot.respond /join (.*)/i, (res) ->
    id = res.match[1]
    index_of = -1
    for activities, i in robot.brain.data.activities
      if activities.id.toLowerCase() == id.toLowerCase()
        index_of = i

    if open isnt 0
      --open
      robot.brain.data.activities ?= []
      partySize.splice( 0, 1 ) if -1 != 0
      getName = res.message.user.name

      robot.brain.data.activities[index_of].names.push getName
      res.send "Joined"

      activities = robot.brain.data.activities[0].names.map (activities) ->
        activities
      # create the message with attachment object - https://github.com/slackhq/hubot-slack/issues/170 "#raids-activities"
      resData = {
        channel: res.envelope.user.name 
        text: ""
        attachments: [
          {
            fallback: topic + " - Full - " + topic + ":\n" + activities.join("\n") + "\n" + partySize.join("\n"),
            pretext: "",
            title: topic + " - Full",
            text: activities.join("\n") + "\n" + partySize.join("\n"),
            color: "#ff0000"
            mrkdwn_in: ["text"]
          }
        ]
      }

    else
      res.send "Full"
      # post the message
      robot.adapter.customMessage resData

  robot.respond /join/i, (res) ->
    id = ""
    robot.brain.data.activities ?= []
    if robot.brain.data.activities.length > 0
      activities = robot.brain.data.activities.map (activities) ->   
        id = activities.id

    if open isnt 0
      --open
      robot.brain.data.activities ?= []
      partySize.splice( 0, 1 ) if -1 != 0
      getName = res.message.user.name

      robot.brain.data.activities[index_of].names.push getName
      res.send "Joined"

      activities = robot.brain.data.activities[0].names.map (activities) ->
        activities
      # create the message with attachment object - https://github.com/slackhq/hubot-slack/issues/170 "#raids-activities"
      resData = {
        channel: res.envelope.user.name 
        text: ""
        attachments: [
          {
            fallback: topic + " - Full - " + topic + ":\n" + activities.join("\n") + "\n" + partySize.join("\n"),
            pretext: "",
            title: topic + " - Full",
            text: activities.join("\n") + "\n" + partySize.join("\n"),
            color: "#ff0000"
            mrkdwn_in: ["text"]
          }
        ]
      }
    else
      res.send "Full"


  robot.respond /list activities/i, (res) ->
    robot.brain.data.activities ?= []
    if robot.brain.data.activities.length > 0
      activities = robot.brain.data.activities.map (activities) ->
        "@" + activities.author + " - " + activities.topic + ' - Reply with "Join ' + activities.id + '" to join' 
      
      res.send "Ongoing Activities:\n\n" + activities.join("\n")

  robot.respond /(delete me|delete|remove me|remove|leave) from (.*)/i, (res) ->
    uid = res.match[2]
    username = res.message.user.name
    robot.brain.data.activities ?= []

    index_of = -1
    for activities, i in robot.brain.data.activities
      if activities.id.toLowerCase() == uid.toLowerCase()
        index_of = i
    length_before = robot.brain.data.activities[index_of].names.length

    arr_index_of = -1
    for names, i in robot.brain.data.activities[index_of].names
      if names == username
        arr_index_of = i

    robot.brain.data.activities[index_of].names.splice( arr_index_of, 1 ) if -1 != arr_index_of

    if length_before > robot.brain.data.activities[index_of].names.length
      # robot.messageRoom "#raids-activities", 'Removed ' + name + ' from Kick List'
      res.send 'Removed from' + uid
    else
      # res.send 'I couldn\'t find ' + uid
      res.send arr_index_of + console.log(arr_index_of)

  robot.respond /(finish|finished|reset|remove|delete) (.*)/i, (res) ->
    uid = res.match[2]
    arr_topic = ""
    robot.brain.data.activities ?= []
    length_before = robot.brain.data.activities.length

    index_of = -1
    for activities, i in robot.brain.data.activities
      if activities.id.toLowerCase() == uid.toLowerCase()
        arr_topic = activities.topic
        index_of = i

    robot.brain.data.activities.splice( index_of, 1 ) if -1 != index_of

    if length_before > robot.brain.data.activities.length
      # robot.messageRoom "#raids-activities", 'Finished ' + arr_topic
      robot.send {room: res.envelope.user.name}, 'Finished ' + arr_topic
    else
      res.send 'I couldn\'t find ' + uid

# Classes

# class activities

