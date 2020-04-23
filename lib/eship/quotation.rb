# frozen_string_literal: true

module Eship
  def self.post_quotation
    response = ApiClient.post(path: Endpoints.quotation)
  end
end
