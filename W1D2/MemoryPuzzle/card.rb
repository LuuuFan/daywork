class Card


  attr_reader :face_value, :face_down

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def flip
    if @face_down
      @face_down = false
    else
      @face_down = true
    end
  end

  def display
    if @face_down
      nil
    else
      @face_value
    end
  end

  def to_s
    if @face_down
      ' * '
    else
      " #{@face_value.to_s} "
    end
  end

  def ==(card)
    if card.class != Card
      false
    else
      @face_value == card.face_value
    end
  end


end
