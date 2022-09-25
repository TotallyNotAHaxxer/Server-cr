while true 
    begin
        input = gets.not_nil!.to_s
        break
    rescue
        puts "[-] Error: Invalid string, enter characters please not #{input}"
    end
end
puts "[+] Was given a valid string - #{input}"
