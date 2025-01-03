function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    reservationUrl: '/api/flights/reservation', //The URL of the API
    clustersUrl: '/api/flights/clusters', //The URL of the API
  }
  if (env === 'dev') {
    config.reservationUrl = 'http://localhost:3070' + config.reservationUrl //The entire URL with the host
    config.clustersUrl = 'http://localhost:4070' + config.clustersUrl //The entire URL with the host

  } else if (env === 'e2e') {
    config.reservationUrl = 'http://localhost:3070' + config.reservationUrl
    config.clustersUrl = 'http://localhost:4070' + config.clustersUrl //The entire URL with the host
  }
  return config;
}