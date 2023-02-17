class Card
    def initialize(card_value)
        @card_value = card_value
        @face_up = true
    end

    attr_reader :card_value, :face_up

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # def to_s(string)

end
