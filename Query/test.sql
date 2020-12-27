# Cau 1
SELECT teams.team_id, teams.name
FROM team_user
INNER JOIN teams ON teams.team_id = team_user.team_id
INNER JOIN users ON users.user_id = team_user.user_id
WHERE users.name = "Thanh Nguyen Trung"

# Cau 2
SELECT users.name, team_user.role
FROM team_user
INNER JOIN teams ON teams.team_id = team_user.team_id
INNER JOIN users ON users.user_id = team_user.user_id
WHERE teams.name="Mô Hình Hóa Dữ Liệu Team"

# Cau 3
SELECT projects.name
FROM team_user
INNER JOIN teams ON teams.team_id = team_user.team_id
INNER JOIN projects ON projects.team_user_id = team_user.team_user_id
WHERE teams.name="Mô Hình Hóa Dữ Liệu Team"

# Cau 4 
SELECT stages.id, stages.name from stages
JOIN projects ON projects.projects_id = stages.project_id
WHERE projects.name = "Mô hình hóa dữ liệu Board"

# Cau 5
SELECT items.id, items.title from items
JOIN stages ON stages.stage_id = items.stages_id
WHERE stages.name = "Giai đoạn 01" 

# Cau 6
SELECT checklists.id, checklists.title from checklists
JOIN items ON items.item_id = checklists.item_id
WHERE items.title = "Họp lên kế hoạch"

# Cau 7
SELECT value from field_values
JOIN items ON items.item_id = field_values.item_id
WHERE items.title = "Họp lên kế hoạch"

# Cau 8

# Cau 9
SELECT items.item_id, items.title, items.done
FROM stages
INNER JOIN projects ON projects.project_id = stages.project_id
INNER JOIN items ON items.stages_id = stages.stage_id
WHERE projects.name = "Mô hình hóa dữ liệu Board"

# Cau 10

# Cau 11
