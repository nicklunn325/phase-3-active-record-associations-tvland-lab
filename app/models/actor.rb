class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.characters.map do |char|
            "#{char.name} - #{char.show.name}"
        end
    end
     
    # define method .alphabetical that lists all actors by last name alphabetically

    def self.alphabetical
        self.order(:last_name)
        # self.all.sort do |a, b|
        #     puts a.last_name, b.last_name
        #     a.last_name <=> b.last_name
        # end
    end

    # define method .most_gigs that returns the actor with the most characters

    def self.most_gigs
        self.all.sort do |a, b|
            a.characters.count <=> b.characters.count
        end.last

        # one active record solution
        # self.joins(:characters).group("actors.id").order("count(actors.id) DESC").limit(1)[0]
    end

end