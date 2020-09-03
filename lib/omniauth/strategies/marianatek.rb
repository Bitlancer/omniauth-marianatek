require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Provides an Omniauth strategy for Mariana Tek
    class MarianaTek < OmniAuth::Strategies::OAuth2
      option :name, 'marianatek'

      args %i[client_id client_secret brand]

      option :brand, nil

      uid do
        raw_info['id']
      end

      info do
        {
          'name' => "#{raw_info['first_name']} #{raw_info['last_name']}",
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def client
        site = "https://#{options.brand}.marianatek.com"
        ::OAuth2::Client.new(
          options.client_id,
          options.client_secret,
          {
            site: site,
            authorize_url: "#{site}/o/authorize",
            token_url: "#{site}/o/token"
          }.merge(deep_symbolize(options.client_options))
        )
      end

      def raw_info
        @raw_info ||= access_token.get('/api/users/self').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'marianatek', 'MarianaTek'
