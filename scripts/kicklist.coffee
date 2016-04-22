# Description:
#   Kick List 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot add <name> to kick list because <reason> - reasons with scam/scams/scammer/scammed in them will automatically add the name to the scam list
#   hubot kick list - List all names/reasons that are on the kick list
#   hubot scam list - List all names/reasons that are on the scam list
#   hubot (delete|remove) <name> from kick list
#   hubot (delete|remove) <name> from scam list
#
# Author
#   skhy

module.exports = (robot) ->

##########
  robot.respond /add (.*) to kick list (because|for) (.*)/i, (res) ->
    name = res.match[1]
    reason = res.match[3]

    robot.brain.data.kicklist ?= []
    robot.brain.data.scamlist ?= []
    
    robot.brain.data.kicklist.push { name: name, reason: reason }
    #res.send "Added " + name + " to Kick List. Reason: " + reason
    #https://github.com/slackhq/hubot-slack/issues/70
    robot.messageRoom "#raids-activities", "Added " + name + " to Kick List. Reason: " + reason

    reason = reason.toLowerCase()
    wordList = ["scammer", "scams", "scam", "scammed"]
    bool = wordList.some (word) -> ~reason.indexOf word
    if bool
      robot.brain.data.scamlist.push { name: name }
      robot.messageRoom "#raids-activities", "Added " + name + " to Scam List."

##########
  robot.respond /change reason for (.*) on kick list to (.*)/i, (res) ->
    name = res.match[1]
    reason = res.match[3]

    robot.brain.data.kicklist ?= []
    robot.brain.data.scamlist ?= []

    index_of = -1
    for kicklist, i in robot.brain.data.kicklist
      if kicklist.name.toLowerCase() == name.toLowerCase()
        index_of = i

    robot.send {room: res.envelope.user.name}, 'Reason changed.'

    reason = reason.toLowerCase()
    wordList = ["scammer", "scams", "scam", "scammed"]
    bool = wordList.some (word) -> ~reason.indexOf word
    if bool
      robot.brain.data.scamlist.push { name: name }
      robot.messageRoom "#raids-activities", "Added " + name + " to Scam List."


##########
  robot.respond /kick list/i, (res) ->
    robot.brain.data.kicklist ?= []

    if robot.brain.data.kicklist.length > 0
      kicklist = robot.brain.data.kicklist.map (kicklist) ->

        '*' + kicklist.name + '* - ' + kicklist.reason
      
      res.send "Kick List:\n\n" + kicklist.join "\n"
      
##########
  robot.respond /(delete|remove) (.*) from kick list/i, (res) ->
    name = res.match[2]

    robot.brain.data.kicklist ?= []
    length_before = robot.brain.data.kicklist.length

    index_of = -1
    for kicklist, i in robot.brain.data.kicklist
      if kicklist.name.toLowerCase() == name.toLowerCase()
        index_of = i

    robot.brain.data.kicklist.splice( index_of, 1 ) if -1 != index_of

    if length_before > robot.brain.data.kicklist.length
      robot.messageRoom "#raids-activities", 'Removed ' + name + ' from Kick List'
    else
      res.send 'I couldn\'t find ' + name + '.'
##########
  robot.respond /(scammer|scam) list/i, (res) ->
    robot.brain.data.scamlist ?= []

    if robot.brain.data.scamlist.length > 0
      scamlist = robot.brain.data.scamlist.map (scamlist) ->

        scamlist.name
      
      res.send "Scam List:\n\n" + scamlist.join "\n"
      
    # else
    #   res.send "Boo"
##########
  robot.respond /(delete|remove) (.*) from (scammer|scam) list/i, (res) ->
    name = res.match[2]

    robot.brain.data.scamlist ?= []
    length_before = robot.brain.data.scamlist.length

    index_of = -1
    for scamlist, i in robot.brain.data.scamlist
      if scamlist.name.toLowerCase() == name.toLowerCase()
        index_of = i

    robot.brain.data.scamlist.splice( index_of, 1 ) if -1 != index_of

    if length_before > robot.brain.data.scamlist.length
      robot.messageRoom "#raids-activities", 'Removed ' + name + ' from Scammer List'
    else
      res.send 'I couldn\'t find ' + name + '.'
##########
  # robot.respond /(clear|flush) kick list/i, (res) ->
  #   robot.brain.data.kickList = []
  #   res.send "Deadlines cleared. Go do whatever you want."