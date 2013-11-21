require 'rest-client'
require 'json'

class ApiController < ApplicationController
  def postcard
    url = 'https://snapi.sincerely.com/shiplib/create'
    request = {
      :appkey => 'JM1WE0MPZPS6BETVQ94DH2VFUSKUHW4IXC1OL7AS',
      :testMode => true,
      :frontPhotoUrl => params[:photo_url],
      :profilePhotoUrl => params[:photo_url],
      :message => params[:message],
      :recipients => [ # TODO - from params[:zipcode]
         {
          :name => "Jane Doe",
          :street1 => "123 Mission Street",
          :city => "San Francisco",
          :state => "CA",
          :postalcode => "94105",
          :country => "UNITED STATES"
          }
         ].to_json,
      :sender => { # TODO maybe from constituent?
          :name => "Pepper Gram",
          :email => "pepper@sincerely.com",
          :street1 => "800 Market Street",
          :city => "San Francisco",
          :state => "CA",
          :postalcode => "94105",
          :country => "UNITED STATES"
        }.to_json
    }

    resp = RestClient.post(url,request,:accept=>:json)
    render :json => resp
  end
end
