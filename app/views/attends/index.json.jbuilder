json.array!(@attends) do |attend|
  json.extract! attend, :id, :in_date, :in_time, :out_time, :duration, :user_id
  json.url attend_url(attend, format: :json)
end
