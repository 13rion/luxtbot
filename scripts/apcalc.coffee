# Description:
#   AP Calculator 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ap calc <level>[SPACE]<enhance level>[SPACE]<enchant number>[SPACE]<enchant number>[SPACE]<quality number>
#   hubot ap calc artifact
#   hubot ap calc help
#
# Author
#   skhy

module.exports = (robot) ->

    robot.respond /ap calc (.*)\s(.*)\s(.*)\s(.*)\s(.*)/i, (res) ->
      level = parseInt(res.match[1])
      enhance = parseInt(res.match[2])
      enchant1 = parseInt(res.match[3])
      enchant2 = parseInt(res.match[4])
      quality = parseInt(res.match[5])

      item = "Level " + level + " +" + enhance + " Rank " + enchant1 + " ES Rank " + enchant2 + " ES " + quality + "* Quality"

      switch level
        when 60 then level = 500
        when 70 then level = 2000
        when 80 then level = 5000
        when 90 then level = 16000
        else level = 0

      switch enhance
        when 8 then enhance = 500
        when 9 then enhance = 1000
        when 10 then enhance = 2000
        when 11 then enhance = 5000
        when 12 then enhance = 8000
        when 13 then enhance = 13000
        when 14 then enhance = 20000
        when 15 then enhance = 30000
        else enhance = 0

      switch enchant1
        when 9 then enchant1 = 1000
        when 8 then enchant1 = 1000
        when 7 then enchant1 = 1000
        else enchant1 = 0

      switch enchant2
        when 9 then enchant2 = 1000
        when 8 then enchant2 = 1000
        when 7 then enchant2 = 1000
        else enchant2 = 0

      switch quality
        when 3 then quality = 1000
        when 4 then quality = 1000
        when 5 then quality = 2000
        else quality = 0


      total = level + quality + enchant1 + enchant2 + enhance

      # create the message with attachment object - https://github.com/slackhq/hubot-slack/issues/170
      resData = {
        channel: res.message.room
        text: ""
        attachments: [
          {
            fallback: "AP Calculator - " + total + " AP",
            pretext: "AP Calculator",
            title: item,
            text: total + " AP",
            color: "#e9e9e9"
            mrkdwn_in: ["text"]
          }
        ]
      }
      # post the message
      robot.adapter.customMessage resData

    robot.respond /ap calc help/i, (res) ->
      res.send "Format: 'ap calc [level][SPACE][enhance level][SPACE][enchant #][SPACE][enchant #][SPACE][quality #]'"
      res.send "If artifact, type 'ap calc artifact'"
      
    robot.respond /ap calc artifact/i, (res) ->
      res.send "5000 AP"
