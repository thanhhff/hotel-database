SELECT teams.team_id, teams.name
FROM team_user
INNER JOIN teams ON teams.team_id = team_user.team_id
INNER JOIN users ON users.user_id = team_user.user_id
WHERE users.name = "Thanh Nguyen Trung"
