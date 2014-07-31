_ = require 'underscore';

students_arr = ['Clayton Albachteh', 'Joe Biggica', 'Jeffrey Campomanes', 'Nastassia Carmona', 'Lee Crawford', 'Daniel Farber', 'Crawford Forbes', 'Conor Hastings', 'Shotaro Kamegai', 'Timoor Kurdi', 'Quardean Lewis-Allen', 'Adrian Lin', 'Yoshie Muranaka', 'Brenda Dargan-Levy', 'Andrea Ortega-Williams', 'Tejal Patel', 'Janine Rosen', 'Tess Shapiro', 'Iris Martinez', 'Lisa Wells', 'Heidi Williams-Foy', 'Eric Kramer', 'Jill Ortenberg', 'Patricia Laws', 'Alex Fong']

module.exports = (robot) ->

  shuffle = (array) ->
    counter = array.length
    temp = undefined
    index = undefined

    while counter > 0

      index = Math.floor(Math.random() * counter)

      counter--

      temp = array[counter]
      array[counter] = array[index]
      array[index] = temp

    return array

  robot.respond /groupr victim/, (msg) ->
    student = shuffle(students_arr).pop()
    msg.send student

  robot.respond /groupr test me (.*)/, (msg) ->
    one = msg.match[1]
    two = msg.match[2]
    three = msg.match[3]
    msg_full = msg.match
    msg.send "#{one}, #{two}, #{three}, #{msg_full}"

  robot.respond /groupr split (\d+)/, (msg) ->
    num = msg.match[1]
    msg.send num
