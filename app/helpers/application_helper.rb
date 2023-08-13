module ApplicationHelper
  def render_svg(name)
    File.open("app/assets/icons/#{name}.svg", "rb") do |file|
      raw file.read
    end
  end
end
