Feature: saveActiveVesselGeofences API

# History log:
# Refer to ticket MASS-100 - Created date 4/16/2015 - by Hoa Nguyen
# Update Center Map, refer MASS-200 - Upmmmm - By,,,

# Mains Scenario:
Scenario: Verify saveActiveVesselGeofences API should insert geofences when it doesn't exist on database
 Given the user is using saveActiveVesselGeofences API
 When the user enter valid json as:
 """
 {
    "geofenceId": "geofenceId",
    "vesselId": "vesselId",
    "enterTime": "enterTime"
}
aaaa
 """
 And the user sends the request
 Then the API should return correct json as:
 """
 Insert { message: "Insert success" }
 """

# Scenario 01- d
Scenario: Verify saveActiveVesselGeofences API should update geofences when it has existed on database
 Given the user is using saveActiveVesselGeofences API
 When the user enter valid json as:
 """
 {
    "geofenceId": "geofenceId",
    "vesselId": "vesselId",
    "enterTime": "enterTime"
}
 """
 And the user sends the request
 Then the API should return correct json as:
 """
 Update { message: "Update success" }
 """
# Other Scenario:
# Scenario 02
Scenario: Verify saveActiveVesselGeofences API returns error message when leaving vessel id blank
 Given the user is using saveActiveVesselGeofences API
 When the user leaves the request field blank
 And the user sends the request
 Then the system should display error message

Scenario: Verify saveActiveVesselGeofences API retuns error message when inputing non existent vessel id/geofenceId
 Given the user is using saveActiveVesselGeofences API
 When the user enters non existent vessel id/geofenceId
 And the user sends the request
 Then the system should display error message

Scenario: Verify saveActiveVesselGeofences API retuns error message when network is disconnected
 Given the user is using saveActiveVesselGeofences API
 And the network is disconnected
 When the user enters json as:
  """
 {
    "geofenceId": "geofenceId",
    "vesselId": "vesselId",
    "enterTime": "enterTime"
 }
 """
 And the user sends the request
 Then the system should display error message

Scenario: Verify saveActiveVesselGeofences API should update/insert new geofences when network is reconnected
 Given the user is using saveActiveVesselGeofences API
 And the network is reconnected
 When the user enters valid json
 And the user sends the request
 Then the system should display correct geofences.
