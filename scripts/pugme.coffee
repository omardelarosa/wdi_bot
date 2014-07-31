# Description:
#   Pugme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

moment = require('moment');

is_good_time = () ->
  # returns true if the time isn't between 9am and 5pm on a weekday.
  current_hour = moment().hour() - 4
  current_minute = moment().minute()
  is_weekend = () -> moment().day() == 0 or moment().day() == 7
  if is_weekend() or current_hour < 9 or current_hour >= 17
    return true
  else
    return false

module.exports = (robot) ->

  robot.respond /pug me/i, (msg) ->
    unless is_good_time()
      msg.send "Sorry. Perhaps you should be paying attention to class?"
    else
      msg.http("http://pugme.herokuapp.com/random")
        .get() (err, res, body) ->
          msg.send JSON.parse(body).pug

  robot.respond /pug bomb( (\d+))?/i, (msg) ->
    unless is_good_time()
      msg.send "Sorry. Perhaps you should be paying attention to class?"
    else
      count = msg.match[2] || 5
      msg.http("http://pugme.herokuapp.com/bomb?count=" + count)
        .get() (err, res, body) ->
          msg.send pug for pug in JSON.parse(body).pugs

  robot.respond /how many pugs are there/i, (msg) ->
    unless is_good_time()
      msg.send "Sorry. Perhaps you should be paying attention to class?"
    else
      msg.http("http://pugme.herokuapp.com/count")
        .get() (err, res, body) ->
          msg.send "There are #{JSON.parse(body).pug_count} pugs."
