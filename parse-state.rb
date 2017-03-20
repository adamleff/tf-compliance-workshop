require 'json'

def format_hostname(hostname)
  return hostname unless hostname.include?('compliance-workstation')
  hostname = hostname.split('-')
  hostname.delete('compliance')
  hostname.delete('workstation')
  hostname.delete('of')

  suit = hostname.pop
  suit_char = case suit
              when "hearts"
                "♥︎"
              when "spades"
                "♠︎"
              when "diamonds"
                "⬥"
              when "clubs"
                "♣︎"
              else
                suit
              end

  hostname << suit_char
  hostname.join(' ')
end

file = ARGV[0];
raise "no file given -- Usage: #{__FILE__} tfstate_file" if file.nil?

raise "File not readable" unless File.readable?(file)

data = JSON.parse(File.read(file))

puts "| Workstation | IP Address |"
puts "| ----------- | ---------- |"

data['modules'].each do |m|
  m['resources'].each do |res_name, res_data|
    attrs = res_data['primary']['attributes']
    next if attrs['public_ip'].nil?
    puts "| #{format_hostname(attrs['tags.Name'])} | #{attrs['public_ip']} |"
  end
end

