class Post < ApplicationRecord
    has_many :post_hash_tags
    has_many :hash_tag, through: :post_hash_tags
    belongs_to :user
    has_one_attached :image
    after_commit :create_hash_tags, on: :create

    def extract_name_hash_tags
        description.to_s.scan(/#\w+/).map{|name| name.gsub("#","")}
    end

    def create_hash_tags
        #create hash_tag of Post 
        extract_name_hash_tags.each do |name|
            hash_tag.create(name: name)
        end
    end



end
