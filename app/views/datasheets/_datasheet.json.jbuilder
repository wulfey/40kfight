json.extract! datasheet, :id, :name, :role, :power, :movement, :shooting_skill, :strength, :combat_skill, :attacks, :wounds, :leadership, :armor_save, :invul_shooting, :invul_combat, :single_model_point_cost, :model_count_increment, :power_for_each_increment, :min_model_count, :max_model_count,  :created_at, :updated_at
json.url datasheet_url(datasheet, format: :json)
