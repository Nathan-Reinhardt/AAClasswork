class Card

    attr_accessor :face_value
    
    def initialize(face_value)
        @face_value = face_value
        @face_show = false
    end

    def hide
        @face_show = false
    end

    def reveal
        @face_show = true
    end

    # def !=(other_card)
    #     self.face_value != other_card.face_value
    # end
end