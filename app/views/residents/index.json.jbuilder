json.array!(@residents) do |resident|
  json.extract! resident, :id, :name, :address
  json.url resident_url(resident, format: :json)
end
