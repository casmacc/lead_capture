# TO TEST...
# start the server in a tmux session `ruby app.rb`
# then:
# - detach from the tmux session
# - logout
# - test in your browser `http://<yourserver>:6789`
# - submit the form at https://bugmark.net/ci
#

require 'sinatra'

redirect_path = ENV['REDIRECT_PATH'] || 'https://casmacc.io'
output_dir    = ENV['OUTPUT_DIR']    || '/tmp/lead_capture'
full_dir      = File.expand_path(output_dir)

system "mkdir -p #{full_dir}"

file_path = full_dir + '/form_capture_data.txt'

set :bind, '0.0.0.0'

get '/' do
  vhost = ENV['VIRTUAL_HOST'] || 'NA'
  url   = 'https://github.com/casmacc/lead_capture'
  link  = "<a href='#{url}' target='_blank'>#{url}</a>"
  <<~HTML
    <style>
      table {border-collapse: collapse;}
      table, th, td {border: 1px solid black;}
      th, td {padding: 10px;}
    </style>
    <h2>LEAD_CAPTURE</h2>
    <table>
    <tr><td>TIME</td><td>#{Time.now.strftime('%m-%d %H:%M:%S')}</td></tr>
    <tr><td>VHOST</td><td>#{vhost}</td></tr>
    <tr><td>SOURCE</td><td>#{link}</td></tr>
    </table>
  HTML
end

post '/formcap' do
  File.open(file_path, 'a') do |f|
    f.puts params.merge({'time' => Time.now.strftime('%y-%m-%d_%H:%M:%S')}).inspect
  end
  redirect redirect_path
end
