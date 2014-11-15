json.array!(@developmental_levels) do |developmental_level|
  json.extract! developmental_level, :id, :student,, :date, :recorder,, :fba_not_present,, :fba_fleeting,, :fba_constricted,, :fba_stable,, :ibc_not_present,, :ibc_fleeting,, :ibc_constricted,, :ibc_stable,, :sm_not_present,, :sm_fleeting,, :sm_constricted,, :sm_stable,, :p_not_present,, :p_fleeting,, :p_constricted,, :p_stable,, :d_not_present,, :d_fleeting,, :d_constricted,, :d_stable,, :wo_not_present,, :wo_fleeting,, :wo_constricted,, :wo_stable,, :time
  json.url developmental_level_url(developmental_level, format: :json)
end
