# frozen_string_literal: true

module Eship
  def self.post_quotation(payload)
    response = ApiClient.post(
      path: Endpoints::POST_QUOTATION,
      body: payload
    )
  end
end
