class Card
  attr_reader :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def face_up?
    @face_up
  end

  def to_s
    if self.face_up?
      return '%02d' % self.value.to_s
    else
      return "**"
    end
  end
end
