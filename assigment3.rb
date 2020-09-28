$matches_played = {}
$wins = {}
$draws = {}
$loses = {}
$points = {}

def summary(info)
  # looping through every match
  info.each do |match|
    update_matches_played(match)
    update_match_results_and_points(match)
  end
  output_summary
end

# update number of matches for every team
def update_matches_played(match)
  for i in 0...2
    $matches_played[match[i]] = $matches_played[match[i]].to_i + 1
  end
end

# update matches results(win/loose) and points for every team with every match
def update_match_results_and_points(match)
  case match[2]
  when 'W'
    $wins[match[0]] = $wins[match[0]].to_i + 1
    $loses[match[1]] = $loses[match[1]].to_i + 1
    $points[match[0]] = $points[match[0]].to_i + 3
  when 'L'
    $loses[match[0]] = $loses[match[0]].to_i + 1
    $wins[match[1]] = $wins[match[1]].to_i + 1
    $points[match[1]] = $points[match[1]].to_i + 3
  else
    $draws[match[0]] = $draws[match[0]].to_i + 1
    $draws[match[1]] = $draws[match[1]].to_i + 1
    $points[match[0]] = $points[match[0]].to_i + 1
    $points[match[1]] = $points[match[1]].to_i + 1
  end
end

# create output table with match and results
def output_summary
  output_summary = ""
  unless $matches_played.empty?
    output_summary << "Team | MP | W | D | L | P "
    output_summary << " \n "

    # sorting the results on the basis of points if points are greater than 0
    $points = $points.sort.to_h
    $points.each do |team, val|
      output_summary << "#{team}    | #{$matches_played[team]} | #{$wins[team] || 0} | #{$draws[team] || 0} | #{$loses[team] || 0} | #{val || 0}"
      output_summary << " \n "
    end

    # finding teams with 0 points
    $matches_played.delete_if { |k,_| $points.key?(k) }

    # output the teams with 0 points
    $matches_played.each do |team, val|
      output_summary << "#{team}    | #{val} | #{$wins[team] || 0} | #{$draws[team] || 0} | #{$loses[team] || 0} | #{$points[team] || 0}"
      output_summary << " \n "
    end
  end
  output_summary
end

# start the program execution
tournament_info = [["B", "C", "W"], ["A", "D", "D"], ["A", "B", "W"], ["D", "C", "L"], ["C", "A", "L"], ["B", "D", "W"]]
puts summary(tournament_info)
