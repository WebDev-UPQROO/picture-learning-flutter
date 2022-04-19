# routes

Contains the ongenerateroute with all the routes of the application

# routes\_[name]

Contains the static methods and names of each route in that view group.

## Structure of each route

-   Each route contains a bloc provider that provides its views with its corresponding bloc
-   Each provider returns a consumer, which is responsible for listening and notifying changes in the state of the view
-   Each consumer has the screen widget
