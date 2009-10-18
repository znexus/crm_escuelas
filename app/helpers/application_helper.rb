# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def truncate_words(text = "Sin contenido", length = 20, end_string = ' ... ')
      text = strip_tags text
      words = text.split()
      words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end
  include TagsHelper
end
