# database-managment-system-project
An online transportation system for Road-Transport Authority (RTA) 
A relational database is to be designed/implemented for a transportation authority of a medium-sized city.
There are many buses owned by the authority. The buses operate on routes of the transportation network. As a 
part of the transportation network, a list of bus stops has already been identified. There are several routes in the 
network where each bus is assigned to exactly one route. On the other hand, there may be multiple buses 
operating on the same route. A route consists of a sequence of enumerated stops. The first and last of stops of 
each route are called its terminals. 

• Each route is identified by a numeric route ID and a unique route name.
• Buses are identified by licence plate number. Other attributes of a bus include: seat capacity, make, 
model, model year, and fuel type (petrol, diesel, hybrid or electric). 
• Bus stop names are unique.
• Each bus must be assigned to exactly one route. 
• A route may contain multiple bus stops. Moreover, bus stop names can repeat in routes, e.g., for loop 
routes.
• There is a semantic integrity constraint which requires that stop ordering per route cannot have a gap
or jump. For instance, if there are 9 stops along a route, the stops should be enumerated.
