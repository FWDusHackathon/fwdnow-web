require 'net/http'

class ApiController < ApplicationController
  def postcard
    sincerely_args = params.clone
    sincerely_args['appkey'] = 'JM1WE0MPZPS6BETVQ94DH2VFUSKUHW4IXC1OL7AS'
    response = Net::HTTP.post_form
      URI.parse('https://snapi.sincerely.com/shiplib/create'),
      sincerely_args
    # AMK NEXT: todo actually pass params thru
    puts response.code, response.body

    return response
  end
end
