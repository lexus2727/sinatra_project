require './config/environment'



use Rack::MethodOverride

use TreksController
use UsersController
run ApplicationController
