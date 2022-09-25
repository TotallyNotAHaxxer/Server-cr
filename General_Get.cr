require "http/server"

server = HTTP::Server.new do |ctx|
    request = ctx.request # Request conversion from CTX (HTTP server context)
    if request.method == "GET" # check for a request method
        ctx.response.content_type = "text/plain" # Assign the content type to plain text
        if response_body = ctx.request.body # Check if there is a REQUEST body
            parameter = HTTP::Params.parse(response_body.to_s) # need to convert the body to a string
            ctx.response.print "Welcome to the server #{parameter["user"]? || " User "}!" # use #{} to format, then use [] to reach a value in the format
        else
            ctx.response.print "Could not welcome you to the server, no data was posted" # if no data was posted using a POST request using the user HTTP param
        end
    end
end

puts "[+] Server starting on http://127.0.0.1:8080"
server.listen(8080) # listen

