module ApplicationHelper
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

def show_svg(path)
  File.open("app/assets/images/#{path}", "rb") do |file|
    raw file.read
  end
end
end
