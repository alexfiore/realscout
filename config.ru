use Rack::Static, 
  :urls => ["/img", "/public", "/font-awesome", "/css"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html',
      'AddType'  => 'text/css',
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/cover.html', File::RDONLY)
  ]
}

require 'rack/rewrite'

use Rack::Rewrite do
  rewrite "/", "/cover.html"
end

run Rack::File.new("public")