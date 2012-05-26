module Screencap
  class Fetcher
    def initialize(url)
      @url = url
    end

    def fetch(opts = {})
      @filename = opts.fetch(:output, clean_filename)
      raster(@url, @filename, opts[:div])
    end

    def filename
      @filename
    end

    def raster(*args)
      Screencap::Phantom.rasterize(*args)
    end

    def clean_filename
      "#{TMP_DIRECTORY}/#{@url.delete('/.:?!')}.png"
    end
  end
end