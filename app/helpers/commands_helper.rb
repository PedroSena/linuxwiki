module CommandsHelper
  def command_pagination(term, next_page)
    term = term.gsub ' ', '-'
    "/commands/search/#{term}?page=#{next_page}"
  end

  def search_string_fix(string)
    '/commands/search/' + string.gsub(' ', '-')
  end
end