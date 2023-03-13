class Article < ApplicationRecord
    validates :name, presence: true,
                     uniqueness: true
    validates :body, presence: true,
                     length: { minimum: 5 }

    def self.all
        super
        binding.pry
    end
end
