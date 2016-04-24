package R4MEInfrastructureSettings;
use strict;
use warnings FATAL => 'all';
use constant {
    ApiVersion => "4",

    MainHost      => "https://www.route4me.com",
};
use constant {
    ApiHost       => MainHost."/api.v4/optimization_problem.php",
    ShowRouteHost => MainHost."/route4me.php",
    RouteHost     => MainHost."/api.v4/route.php",
    SetGpsHost    => MainHost."/track/set.php",
    GetUsersHost  => MainHost."/api/member/view_users.php",
    AddRouteNotesHost => MainHost."/actions/addRouteNotes.php",
    GetActivitiesHost => MainHost."/api/get_activities.php",
    GetAddress => MainHost."/api.v4/address.php",
    DuplicateRoute => MainHost."/actions/duplicate_route.php",
    MoveRouteDestination => MainHost."/actions/route/move_route_destination.php",
    AddressBook => MainHost."/api.v4/address_book.php",
    Avoidance => MainHost."/api.v4/avoidance.php",
};
1;