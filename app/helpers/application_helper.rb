module ApplicationHelper
  def num_to_phone(num)
    "#{ num[0..2] }-#{ num[3..6] }-#{ num[7..-1] }"
  end
end
