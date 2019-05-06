# Rock-Paper-Scissors Application

## Requires

    - Ruby 2.3.7
    - Rails 5.2.1
    
##### Quick Note :
      I did attempt to connect to the API listed here for a "CURB" throw request :
      
      - https://curbrockpaperscissors.docs.apiary.io
     
      Which happens to be:
      
      https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw
      
      
      I had placed the following within my Game Controller, along with a method that would be used to retrieve the thow from the API
      but was met with errors, and my application not rendering accordingly :
''''''      
      
        require 'net/http'
        url = URI.parse('https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
         http.request(req)
        }
        puts res.body
''''''''      
      
      Hence why I followed this instruction on : https://github.com/ridecharge/rps
      which states : 
      "If the api given above doesn’t work or you’ve run out of time, 
       an alternative is to generate a random throw locally"
    
      
      
#### Did Complete the Application within an hour, it's pretty basic , but it does what it needs to get done. 
#### 404 and 500 error routes, controller and templates aren't necessary , but not everyone who uses a computer knows what 404 and 500 errors are
      





