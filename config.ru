$stdout.sync = true

use Rack::Static,
  :urls => ["/css", "/js", "/images", "/spec", "/bootstrap", "/font"],
  :root => "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

run Rack::URLMap.new( {
  "/"    => Rack::Directory.new( "public" ), # Serve our static content
} )