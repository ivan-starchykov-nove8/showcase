/// Enumerates the application screens, where each value is associated with a navigation path.
enum ApplicationRoutes {
  root('/'),
  featureA('/featureA'),
  featureB('/featureB'),
  featureC('/featureC'),
  featureD('/featureD'),
  featureE('/featureE');

  /// Constructor for [ApplicationRoutes] with the associated path.
  const ApplicationRoutes(this.path);

  /// The path associated with the route.
  final String path;
}
