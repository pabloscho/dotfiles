# Customized Rails Console Prompt

class String
  def red = "\033[31m#{self}\033[0m"
  def cyan = "\033[36m#{self}\033[0m"
end

if defined? Rails
  project_name = File.basename(Dir.pwd).cyan
  environment = ENV['RAILS_ENV'].red

  prompt = "#{project_name} (#{environment})"

  IRB.conf[:PROMPT] = {}
  IRB.conf[:PROMPT][:RAILS] = {
    PROMPT_I: "#{prompt}>> %03N > ",
    PROMPT_S: "#{prompt}%l>> %03N * ",
    PROMPT_C: "#{prompt}?> %03N ? ",
    RETURN: "=> %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS
end
