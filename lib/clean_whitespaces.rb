class CleanWhitespaces
   def do(objeto)
    objeto.attributes.each_pair do |key, value|
      RAILS_DEFAULT_LOGGER.debug("stripping #{key.to_s} with value #{value.to_s}")
      objeto[key] = value.strip if value.respond_to?('strip')
    end
  end
end
