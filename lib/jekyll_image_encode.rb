require "mimemagic"
require 'json/ext'

module ImageEncodeCache
  @@cached_base64_codes = Hash.new

  def cached_base64_codes
    @@cached_base64_codes
  end

  def cached_base64_codes= val
    @@cached_base64_codes = val
  end
end

module Jekyll
  module Tags
    class ImageEncodeTag < Liquid::Tag
      include ImageEncodeCache

      def initialize(tag_name, var, options)
        split = var.split(';')
        @var = split[0].strip
        @default = split[1].strip
        super
      end

      def render(context)
        require 'open-uri'
        require 'base64'

        encoded_image = ''

        begin
          # https://stackoverflow.com/questions/6672007/how-do-you-access-nested-elements-of-a-hash-with-a-single-string-key
          # Splat and dig, is the answer
          url = context.registers[:page].dig(*@var.split('.')) || File.join(__dir__, '..', @default)
          image_handle = open(url)

          if self.cached_base64_codes.has_key? url
            encoded_image = self.cached_base64_codes[url]
          else
            # p "Caching #{@url} as local base64 string ..."
            encoded_image = Base64.strict_encode64(image_handle.read)
            self.cached_base64_codes.merge!(url => encoded_image)
          end

          data_type = MimeMagic.by_magic(image_handle)
          image_handle.close

          "data:#{data_type};base64,#{encoded_image}"
        rescue OpenURI::HTTPError => e
          puts e.message
          "error!"
        end
      end
    end
  end
end

Liquid::Template.register_tag('base64', Jekyll::Tags::ImageEncodeTag)
