class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !!freebies.where(item_name: item_name).first || false
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id) unless freebie.dev_id != self.id
    end
end