require "http/server"

port = 8080                     # port
host = "127.0.0.1"              # host
uril = "http://#{host}:#{port}" # url
file = "example.html"           # Form to serve
cont = "text/html"

server = HTTP::Server.new do |ctx|
    request = ctx.request

    if request.method == "GET" # if the method is GET continue 
        ctx.response.content_type = cont # Set the content type
        ctx.response.content_length = File.size(file) # Content length is equal to the length of the file
         File.open(file) do |f| # open and start a do loop to execute the file data
          IO.copy(f, ctx.response) # Call IO (Input Output) to copy the file data onto the response in our case ctx.response
        end
        next
    end
    if request.method == "POST" # Check request method
        ctx.response.content_type = cont # again set the content type
        if body = request.body # if the body is not empty and is true then follow 
            parameter = HTTP::Params.parse(body.to_s) # call all HTTP params used from the body being parsed, using .to_s we convert it to a string
            if parameter["name"] = "user123" # check if the http param from the post form named name is user123 if it is do the following 
                ctx.response.print "Hello there you reached the gateway #{parameter["name"]}\n" # use ctx to write to the HTTP response writer
            end
        end
    end
    ctx.response.content_type = cont
end

puts "[+] Listening on #{uril}"
server.listen(port)