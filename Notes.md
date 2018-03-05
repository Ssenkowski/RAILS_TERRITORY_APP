Publisher Show page:
<%= @publisher.territories.each do |territory| #list all there signed out territories%>
Territory: <%= territory.designation %> <%= link_to "#{territory.number}", territory_path(current_publisher.territory_id) %> <%= territory.campaign_work? #was this sign_out during a campaign? %>
House to House Record: <%= territory.house_to_house_record_id %>
Do not calls: <%= territory.do_not_call_id %>
