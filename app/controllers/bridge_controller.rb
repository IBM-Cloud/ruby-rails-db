class BridgeController < ApplicationController
  def index
    render :inline =>
<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Say voice="woman" language="de">
    Bitte bleiben Sie dran. Ihr Anruf wird in Kürze beginnen.
  </Say>
  <Dial>
    <Conference>my room</Conference>
  </Dial>
</Response>
EOF
  end
end
