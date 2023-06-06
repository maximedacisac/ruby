class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_all, 
    against: [:name, :etat], 
    associated_against: {
      client: [:lastname]
    },
    using: { tsearch: { prefix: true } }
  
  belongs_to :client

  ETATPRODUCT = ["neuf", "occasion", "reconditionné"]
end
