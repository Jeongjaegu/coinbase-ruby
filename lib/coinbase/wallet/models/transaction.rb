module Coinbase
  module Wallet
    class Transaction < APIObject
    end

    class Request < Transaction
      def resend!(params = {})
        @client.post("#{self['resource_path']}/resend", params) do |data, resp|
          yield(data, resp) if block_given?
        end
      end

      def cancel!(params = {})
        @client.delete("#{self['resource_path']}", params) do |data, resp|
          yield(data, resp) if block_given?
        end
      end
    end
  end
end

