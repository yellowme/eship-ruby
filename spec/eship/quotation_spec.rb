require 'spec_helper'

RSpec.describe Eship do
  context 'With valid payload' do

    let(:payload){
      {
        "address_from":{
          "name":"Grupo Rico",
          "phone":"0120120120",
          "street1":"Algo 01",
          "city":"Mexico",
          "state":"Ciudad de Mexico",
          "country":"MX",
          "zip":"01090"
        },
        "address_to":{
          "name":"Gabo Test_API",
          "phone":"9971120789",
          "email":"Gabo@test.com",
          "street1":"Calle 18c x9 y 9b ",
          "street2": "Viva 2",
          "state":"Yucatán",
          "city":"Ticul",
          "country":"MX",
          "zip":"97862"
        },
        "parcels":[
          {
            "length":"10",
            "height":"10",
            "width":"10",
            "distance_unit":"cm",
            "weight":"1",
            "mass_unit":"kg",
            "reference": "Detrás del auditorio municipal"
          }
        ],
        "order_info":{
          "paid": true,
          "order_num": "1200"
        },
        "items": [
        {
        "quantity": "1",
        "description": "Premium",
        "price": 0
        }
        ]

      }
    }

    let(:response){
      { "object_id"=>"5ea33ff682e45", "rates"=>[{"rate_id"=>"5ea33ff72e9f9", "provider"=>"FedEx", "provider_image_75"=>"../assets/img/fedex_75.png", "currency"=>"MXN", "days"=>11, "amount"=>"142.45", "account_id"=>"3", "servicelevel"=>{"name"=>"Express Saver", "token"=>"FEDEX_EXPRESS_SAVER"}, "status"=>"SUCCESS"}, {"rate_id"=>"5ea33ff8cde4b", "provider"=>"DHL Express", "provider_image_75"=>"../assets/img/dhl_75.png", "currency"=>"MXN", "days"=>6, "amount"=>"534.71", "account_id"=>"4", "servicelevel"=>{"name"=>"EXPRESS DOMESTIC", "token"=>"N/N"}, "status"=>"SUCCESS"}, {"rate_id"=>"5ea33ff935a0d", "provider"=>"Estafeta", "provider_image_75"=>"../assets/img/estafeta_75.png", "currency"=>"MXN", "days"=>5, "amount"=>"348.18", "account_id"=>"5", "servicelevel"=>{"name"=>"Terrestre", "token"=>"70"}, "status"=>"SUCCESS"}], "messages"=>[], "address_from"=>{"name"=>"Grupo Rico", "phone"=>"0120120120", "street1"=>"Algo 01", "city"=>"Mexico", "state"=>"Ciudad de Mexico", "country"=>"MX", "zip"=>"01090", "email"=>"", "company"=>"", "street2"=>""}, "address_to"=>{"name"=>"Gabo Test_API", "phone"=>"9971120789", "email"=>"Gabo@test.com", "street1"=>"Calle 18c x9 y 9b ", "street2"=>"Viva 2", "state"=>"Yucat\u00E1n", "city"=>"Ticul", "country"=>"MX", "zip"=>"97862", "company"=>""}, "parcels"=>[{"length"=>"10", "height"=>"10", "width"=>"10", "distance_unit"=>"cm", "weight"=>"1", "mass_unit"=>"kg", "reference"=>"Detr\u00E1s del auditorio municipal"}], "extras"=>{"amount"=>"0", "currency"=>"MXN", "notes"=>""}, "items"=>[{"quantity"=>"1", "description"=>"Premium", "price"=>0, "weight"=>0, "currency"=>"MXN", "store_id"=>""}], "save_order"=>1}
    }

    let(:parsed_payload){ JSON.parse(payload.to_json) }

    before do
      #WebMock.allow_net_connect!
      stub_request(:post, "#{Eship.base_uri}#{Eship::Endpoints::POST_QUOTATION}").to_return(
        status: 200,
        body: response.to_json
      )
    end
    

    it 'Generates an order in the eship panel' do
      response = Eship.post_quotation(payload)
      p response
      #Check origin address
      expect(parsed_payload['address_from']['name']).to eq response['address_from']['name']
      expect(parsed_payload['address_from']['phone']).to eq response['address_from']['phone']
      expect(parsed_payload['address_from']['street1']).to eq response['address_from']['street1']
      expect(parsed_payload['address_from']['city']).to eq response['address_from']['city']
      expect(parsed_payload['address_from']['state']).to eq response['address_from']['state']
      expect(parsed_payload['address_from']['country']).to eq response['address_from']['country']
      expect(parsed_payload['address_from']['zip']).to eq response['address_from']['zip']

      #Check address_to 
      expect(parsed_payload['address_to']['name']).to eq response['address_to']['name']
      expect(parsed_payload['address_to']['phone']).to eq response['address_to']['phone']
      expect(parsed_payload['address_to']['street1']).to eq response['address_to']['street1']
      expect(parsed_payload['address_to']['city']).to eq response['address_to']['city']
      expect(parsed_payload['address_to']['state']).to eq response['address_to']['state']
      expect(parsed_payload['address_to']['country']).to eq response['address_to']['country']
      expect(parsed_payload['address_to']['zip']).to eq response['address_to']['zip']

      expect(response['save_order']).to eq 1
    end
  end
end