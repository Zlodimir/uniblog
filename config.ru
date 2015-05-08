# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

header_rules = [
    [:all, { 'Content-Disposition' => 'attachment;' }]
]

use Rack::Static, root: 'public',
                  urls: ['/uploads/attachment'],
                  header_rules: header_rules

run Rails.application
