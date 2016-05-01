Access Route4Me's logistics-as-a-service API using our Perl SDK
-------------------


### What does the Route4Me SDK permit me to do?
This SDK makes it easier for you use the Route4Me API, which creates optimally sequenced driving routes for many drivers.

### Who can use the Route4Me SDK (and API)?
The service is typically used by organizations who must route many drivers to many destinations. In addition to route optimization for new (future) routes, the API can also be used to analyze historical routes, and to distribute routes to field personnel.

### Who is prohibited from using the Route4Me SDK (and API)?
The Route4Me SDK and API cannot be resold or used in a product or system that competes directly with Route4Me. This means that developers cannot resell route optimization services to other businesses or developers. However, developers can integrate our route optimization SDK/API into their software applications. Developers and startups are also permitted to use our software for internal purposes (i.e. a same day delivery startup).


### How does the API/SDK Integration Work?
A Route4Me customer, integrator, or partner incorporates the Route4Me SDK or API into their code base.
Route4Me permits any paying subscriber to interact with every part of its system using it’s API.
The API is RESTful, which means that it’s web based and can be accessed by other programs and machines
The API/SDK should be used to automate the route planning process, or to generate many routes with minimal manual intervention



### Do optimized routes automatically appear inside my Route4Me account?
Every Route4Me SDK instance needs a unique API key. The API key can be retrieved inside your Route4Me.com account, inside the Settings tab called API. When a route is planned, it appears inside the corresponding Route4Me account. Because Route4Me web and mobile accounts are synchronized, the routes will appear in both environments at the same time.

### Can I test the SDK with other addresses without a valid API Key?
No. The sample API key only permits you to optimize routes with the sample address coordinates that are part of this SDK.

### Does the SDK have rate limits?
The number of requests you can make per second is limited by your current subscription plan. Typically, there are different rate limits for these core features:
Address Geocoding & Address Reverse Geocoding
Route Optimization & Management
Viewing a Route

### What is the recommended architecture for the Route4Me SDK?
There are two typical integration strategies that we recommend.  Using this SDK, you can make optimization requests and then the SDK polls the Route4Me API to detect state changes as the optimization progresses. Alternatively, you can provide a webhook/callback url, and the API will notify that callback URL every time there is a state change.

### I don't need route management or mobile capabilities. Is there a lower level Route4Me API just for the optimization engine?
Yes. Please contact support@route4me.com to learn about the low-level RESTful API.

### How fast is the route Route4Me Optimization Web Service?
Most routes having less than 200 destinations are optimized in 1 second or less.

### Can I disable optimization when planning routes?
Yes. You can send routes with optimization disabled if you want to conveniently see them on a map, or distribute them to your drivers in the order you prefer.

### Can the API be used for aerial vehicles such as drones or self-driving cars?
Yes. The API can accept lat/lng and an unlimited amount of per-address metadata. The metadata will be preserved as passthrough data by our API, so that the receiving device will have access to critical data when our API invokes a webhook callback to the device.

### Are all my optimized routes stored permanently stored in the Route4Me database?
Yes. All routes are permanently stored in the database and are no longer accessible to you after your subscription is terminated.


### Can I incorporate your API into my mobile application?
Route4Me’s route planning and optimization technology can only be added into applications that do not directly compete with Route4Me. 
This means the application’s primary capabilities must be unrelated to route optimization, route planning, or navigation.

### Can I pay you to develop a custom algorithm?
Yes

### Can I use your API and resell it to my customers?
White-labeling and private-labeling Route4Me is possible but the deal’s licensing terms vary considerably based on customer count, route count, and the level of support that Route4Me should provide to your customers.

### Does the API/SDK have TMS or EDI, or EDI translator capabilities?
Route4Me is currently working on these features but they are not currently available for sale.

### Can the API/SDK send notifications back to our system using callbacks, notifications, pushes, or webhooks?

Because Route4Me processes all routes asynchronously, Route4Me will conveniently notify the endpoint you specify as the route optimization job progresses through each state of the optimization. Every stage of the route optimization process has a unique stage id.

### Does the Route4Me API and SDK work in my country?
Route4Me.com, as well as all of Route4Me’s mobile applications use the Route4Me SDK’s and API.
Since Route4Me works globally, this means that all of Route4Me’s capabilities are available using the SDK’s in every country 


### Will the Route4Me API/SDK work in my program on the Mac, PC, or Linux?
Customers are encouraged to select their preferred operating system environment. The Route4Me API/SDK will function on any operating system that supports the preferred programming language of the customer. At this point in time, almost every supported SDK can run on any operating system.


### Does the Route4Me API/SDK require me to buy my own servers?
Route4Me has its own computing infrastructure that you can access using the API and SDKs. Customers typically have to run the SDK code on their own computers and/or servers to access this infrastructure.

### Does Route4Me have an on-premise solution?
Route4Me does not currently lease or sell servers, and does not have on-premise appliance solution. This would only be possible in exceptionally unique scenarios.


### Does the Route4Me API/SDK require me to have my own programmers?
The time required to integrate the SDK can be as little as 1 hour or may take several weeks, depending on the number of features being incorporated into the customer’s application and how much integration testing will be done by the client. A programmer’s involvement is almost always required to use Route4Me’s technology when accessing it through the API.


## Examples

### Single Driver Route Optimization

```perl
package SingleDriverRoundTrip;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use Route4MeSDK::DataTypes::TravelMode;
use Route4MeSDK::Route4MeManager;
use Route4MeSDK::DataTypes::RouteParameters;
use Route4MeSDK::DataTypes::OptimizationParameters
use Route4MeSDK::DataTypes::Address;
use Route4MeSDK::ExamplesInfrastructure;

sub SingleDriverRoundTrip {
    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $addresses = [
        Address->new(address => "754 5th Ave New York, NY 10019", is_depot => 1, alias => "Bergdorf Goodman",
            lat => 40.7636197, lng => -73.9744388, time => 0),
        Address->new(address => "717 5th Ave New York, NY 10022", alias => "Giorgio Armani",
            lat => 40.7669692, lng => -73.9693864, time => 0),
        Address->new(address => "888 Madison Ave New York, NY 10014", alias => "Ralph Lauren Women's and Home",
            lat => 40.7715154, lng => -73.9669241, time => 0),
        Address->new(address => "1011 Madison Ave New York, NY 10075", alias => "Yigal Azrou'l",
            lat => 40.7772129, lng => -73.9669, time => 0),
        Address->new(address => "440 Columbus Ave New York, NY 10024", alias => "Frank Stella Clothier",
            lat => 40.7808364, lng => -73.9732729, time => 0),
        Address->new(address => "324 Columbus Ave #1 New York, NY 10023", alias => "Liana",
            lat => 40.7803123, lng => -73.9793079, time => 0),
        Address->new(address => "110 W End Ave New York, NY 10023", alias => "Toga Bike Shop",
            lat => 40.7753077, lng => -73.9861529, time => 0),
        Address->new(address => "555 W 57th St New York, NY 10019", alias => "BMW of Manhattan",
            lat => 40.7718005, lng => -73.9897716, time => 0),
        Address->new(address => "57 W 57th St New York, NY 10019", alias => "Verizon Wireless",
            lat => 40.7558695, lng => -73.9862019, time => 0)
    ];

    my $parameters = RouteParameters->new(

        algorithm_type => AlgorithmType->TSP,
        store_route => 0,
        route_name => "Single Driver Round Trip",

        route_date    => time + 3600, # check! R4MeUtils.ConvertToUnixTimestamp(DateTime.UtcNow.Date.AddDays(1)),
        route_time    => 60 * 60 * 7,
        route_max_duration => 86400,
        vehicle_capacity => "1",
        vehicle_max_distance_mi => "10000",

        optimize     => Optimize->Distance,
        distance_unit => DistanceUnit->MI,
        device_type   => DeviceType->Web,
        travel_mode => TravelMode->Driving
    );


    my $optimizationParameters = OptimizationParameters->new(
        addresses => $addresses,
        parameters => $parameters
    );

    my $errorString = "";

    my $dataObject = $route4Me->runOptimization($optimizationParameters, \$errorString);

    ExamplesInfrastructure->PrintExampleOptimizationResult("SingleDriverRoundTrip", $dataObject, $errorString);

    return $dataObject;
}
;
```

### Multiple Depot Multiple driver route optimization

```perl
package MultipleDepotMultipleDriver;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::Route4MeManager;
use Route4MeSDK::DataTypes::RouteParameters;
use Route4MeSDK::DataTypes::OptimizationParameters
use Route4MeSDK::DataTypes::Address;
use Route4MeSDK::ExamplesInfrastructure;

sub MultipleDepotMultipleDriver {

    #Create the manager with the api key
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addresses = [
        Address->new( address => "3634 W Market St, Fairlawn, OH 44333",

            #all possible originating locations are depots, should be marked as true
            #stylistically we recommend all depots should be at the top of the destinations list
            is_depot          => 1,
            lat               => 41.135762259364,
            lng               => -81.629313826561,

            #the number of seconds at destination
            time              => 300,

            #together these two specify the time window of a destination
            #seconds offset relative to the route start time for the open availability of a destination
            time_window_start => 28800,

            #seconds offset relative to the route end time for the open availability of a destination
            time_window_end   => 29465
        ),
        Address->new( address => "1218 Ruth Ave, Cuyahoga Falls, OH 44221",
            lat               => 41.135762259364,
            lng               => -81.629313826561,
            time              => 300,
            time_window_start => 29465,
            time_window_end   => 30529 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 30529,
            time_window_end   => 33779 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 100,
            time_window_start => 33779,
            time_window_end   => 33944 ),

        Address->new( address => "3495 Purdue St, Cuyahoga Falls, OH 44221",
            lat               => 41.162971496582,
            lng               => -81.479049682617,
            time              => 300,
            time_window_start => 33944,
            time_window_end   => 34801 ),

        Address->new( address => "1659 Hibbard Dr, Stow, OH 44224",
            lat               => 41.194505989552,
            lng               => -81.443351581693,
            time              => 300,
            time_window_start => 34801,
            time_window_end   => 36366 ),

        Address->new( address => "2705 N River Rd, Stow, OH 44224",
            lat               => 41.145240783691,
            lng               => -81.410247802734,
            time              => 300,
            time_window_start => 36366,
            time_window_end   => 39173 ),

        Address->new( address => "10159 Bissell Dr, Twinsburg, OH 44087",
            lat               => 41.340042114258,
            lng               => -81.421226501465,
            time              => 300,
            time_window_start => 39173,
            time_window_end   => 41617 ),

        Address->new( address => "367 Cathy Dr, Munroe Falls, OH 44262",
            lat               => 41.148578643799,
            lng               => -81.429229736328,
            time              => 300,
            time_window_start => 41617,
            time_window_end   => 43660 ),

        Address->new( address => "367 Cathy Dr, Munroe Falls, OH 44262",
            lat               => 41.148578643799,
            lng               => -81.429229736328,
            time              => 300,
            time_window_start => 43660,
            time_window_end   => 46392 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 46392,
            time_window_end   => 48389 ),

        Address->new( address => "559 W Aurora Rd, Northfield, OH 44067",
            lat               => 41.315116882324,
            lng               => -81.558746337891,
            time              => 50,
            time_window_start => 48389,
            time_window_end   => 48449 ),

        Address->new( address => "3933 Klein Ave, Stow, OH 44224",
            lat               => 41.169467926025,
            lng               => -81.429420471191,
            time              => 300,
            time_window_start => 48449,
            time_window_end   => 50152 ),

        Address->new( address => "2148 8th St, Cuyahoga Falls, OH 44221",
            lat               => 41.136692047119,
            lng               => -81.493492126465,
            time              => 300,
            time_window_start => 50152,
            time_window_end   => 51982 ),

        Address->new( address => "3731 Osage St, Stow, OH 44224",
            lat               => 41.161357879639,
            lng               => -81.42293548584,
            time              => 100,
            time_window_start => 51982,
            time_window_end   => 52180 ),

        Address->new( address => "3731 Osage St, Stow, OH 44224",
            lat               => 41.161357879639,
            lng               => -81.42293548584,
            time              => 300,
            time_window_start => 52180,
            time_window_end   => 54379 )
    ];

    my $parameters = RouteParameters->new(
        #specify capacitated vehicle routing with time windows and multiple depots, with multiple drivers
        algorithm_type          => AlgorithmType->CVRP_TW_MD,

        #set an arbitrary route name
        #this value shows up in the website, and all the connected mobile device
        route_name              => "Multiple Depot, Multiple Driver",

        #the route start date in UTC, unix timestamp seconds (Tomorrow)
        route_date              => time + 3600,

        #the time in UTC when a route is starting (7AM)
        route_time              => 60 * 60 * 7,

        #the maximum duration of a route
        route_max_duration      => 86400,
        vehicle_capacity        => "1",
        vehicle_max_distance_mi => "10000",

        optimize                => Optimize->Distance,
        distance_unit           => DistanceUnit->MI,
        device_type             => DeviceType->Web,
        travel_mode             => TravelMode->Driving,
        metric                  => Metric->Geodesic
        );

    my $optimizationParameters = OptimizationParameters->new(
        addresses  => $addresses,
        parameters => $parameters
    );

    my $errorString = "";

    my $dataObject = $route4Me->runOptimization( $optimizationParameters, \$errorString );

    ExamplesInfrastructure->PrintExampleOptimizationResult( "MultipleDepotMultipleDriver", $dataObject, $errorString );

    return $dataObject;
}

;
```

-------------------
##Optimization Problem Types

Route4Me provides solutions for different types of routes:

### Single depot, Single Driver

Single Depot, Single Driver is particular case of an Optimization Problem of VRP (Vehicle Routing Problem), in which a vehicle departs from a depot and visits a set of customers.

See video tutorial at [Single Driver, Single Depot](http://support.route4me.com/route-planning-help.php?id=manual0:tutorial2:chapter1:subchapter1)

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Single%20Depot,%20Single%20Driver)

### Single Driver Route 10 Stops

Single Depot, Single Driver and 10 stops is particular case of an Optimization Problem, in which a vehicle departs from a depot, visits 10 stops and ends exactly in the 10th stop.

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Single%20Driver%20Route%2010%20Stops)

### Single Driver Round Trip

Single Driver Round Trip is particular case of an Optimization Problem, in which a vehicle departs from a depot, visits a set of customers and ends it's routes in the depot.

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Single%20Driver%20Round%20Trip)

### Single Depot, Multiple Driver

Single Depot, Multiple Driver is particular case of an Optimization Problem, in which multiple vehicles depart from a depot, visit a set of customers and end their routes in the depot.

See video tutorial at [Single Depot, Multiple Driver](http://support.route4me.com/route-planning-help.php?id=manual0:tutorial2:chapter1:subchapter2)

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Single%20Depot,%20Multiple%20Driver)

### Single Depot, Multiple Driver, Time window

Single Depot, Multiple Driver, Time window is particular case of an Optimization Problem with time constraints, in which multiple vehicles depart from a depot, visit a set of customers and end their routes in the depot.

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Single%20Depot,%20Multiple%20Driver,%20Time%20window)

### Multiple Depot, Multiple Driver

Multiple Depot, Multiple Driver is particular case of an Optimization Problem, in which multiple vehicles depart from the multiple depot, visit a set of customers and end their routes in the depots.

See video tutorial at [Multiple Depot, Multiple](http://support.route4me.com/route-planning-help.php?id=manual0:tutorial2:chapter2:subchapter1)

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Multiple%20Depot,%20Multiple%20Driver)

### Multiple Depot, Multiple Driver, Time window

Multiple Depot, Multiple Driver, Time window is particular case of an Optimization Problem with time constraints, in which multiple vehicles depart from the multiple depot, visit a set of customers and end their routes in the depots.

See video tutorial at [Multiple Depot, Multiple Driver, Time window](http://support.route4me.com/route-planning-help.php?id=manual0:tutorial2:chapter2:subchapter2)

Required parameters: addresses, api_key, algorithm_types.

see detailed description of parameters and sample values [here] (https://www.route4me.com/api/demo/add_optimization_problem.php?sample=Multiple%20Depot,%20Multiple%20Driver,%20Time%20window)

...

**See other interesting video tutorials about Different Types of Routes [here](http://support.route4me.com/route-planning-help.php?id=manual0:tutorial2)**

-------------------
