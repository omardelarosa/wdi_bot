_ = require 'underscore'

module.exports = (robot) ->

  students_arr = [ 'Clayton Albachteh', 'Joe Biggica', 'Jeffrey Campomanes', 'Nastassia Carmona', 'Lee Crawford', 'Daniel Farber', 'Crawford Forbes', 'Conor Hastings', 'Shotaro Kamegai', 'Timoor Kurdi', 'Quardean Lewis-Allen', ' Adrian Lin', 'Yoshie Muranaka', 'Brenda Dargan-Levy', 'Andrea Ortega-Williams', 'Tejal Patel', 'Janine Rosen', 'Tess Shapiro', 'Iris Martinez', 'Lisa Wells', 'Heidi Williams-Foy', 'Eric Kramer', 'Jill Ortenberg', 'Patricia Laws', 'Alex Fong' ]

  robot.respond /groupr, (msg) ->
    arr = students_arr.pop()
    msg.send arr
