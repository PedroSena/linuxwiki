module CommandsHelper
  def command_pagination(term, next_page)
    term = term.gsub ' ', '-'
    "/commands/search/#{term}?page=#{next_page}"
  end
end