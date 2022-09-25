require "http/server"

Content_ = "text/plain"
URL      = "http://127.0.0.1:8080"
Port     = 8080
StrResp  = "someuser"
Param    = "name"

puts "[+] Setting server up on #{URL}\n"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  if body = context.request.body
    if parameter["#{Param}"] = "#{StrResp}"
        context.response.print "Hello there you reached the if\n"
    else
        context.response.print "Hello #{params["name"]? || "Anonymous"}!"
    end
  else
    context.response.print "You didn't POST any data :("
  end
end

server.listen(8080)