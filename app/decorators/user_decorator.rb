class UserDecorator < Draper::Decorator
  delegate_all

  def ranking_top3(index)
    if index + 1 == 1
      h.image_tag('gold_oukan.png', size: '20x20')
    elsif index + 1 == 2
      h.image_tag('silver_oukan.png', size: '20x20')
    elsif index + 1 == 3
      h.image_tag('bronze_oukan.png', size: '20x20')
    end
  end
end
