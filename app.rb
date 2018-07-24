# TO RUN AND TEST...
# start the server in a tmux session `ruby app.rb`
# then:
# - detach from the tmux session
# - logout
# - test in your browser `http://<yourserver>:6789`
# - submit the form at https://bugmark.net/ci
#

require 'sinatra'

set :bind, "0.0.0.0"

file_path = File.expand_path(__dir__) + "/ci_data.txt"

get '/' do
  "CI_SHOW FORM CAPTURE APP - #{Time.now}"
end

post '/ci_form' do
  File.open(file_path, 'a') do |f|
    f.puts params.merge({"time" => Time.now.strftime("%y-%m-%d_%H:%M:%S")}).inspect
  end
  redirect "https://bugmark.net/ci_thanks"
end
