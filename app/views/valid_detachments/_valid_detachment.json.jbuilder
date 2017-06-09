json.extract! valid_detachment, :id, :name, :command_points, :min_troops, :min_elites, :min_fast, :min_heavy, :min_hq, :min_lord, :min_flyer, :dedicated_allowed, :max_troops, :max_elites, :max_fast, :max_heavy, :max_hq, :max_lord, :max_flyer, :created_at, :updated_at
json.url valid_detachment_url(valid_detachment, format: :json)
