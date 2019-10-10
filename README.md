# Rails Logstash Example

This is an example Rails 6 application that is configured to send its logs to a Logstash 
instance over UDP.

You can read [Sending Rails Application Logs to Logstash over UDP](https://benbarber.co.uk/blog/sending-rails-application-logs-to-logstash-over-udp) over on my blog which walks you 
through the steps required to add this to an existing Rails app.

## Getting started

To run the project you will need Docker and DockerCompose installed on your machine. You
can then run the project via DockerCompose as below;

```bash
docker-compose up
```

Once you have the application up and running you can access the services at the following 
URLs:

- http://localhost:3000 - The Rails app
- http://localhost:5601 - Kibana for viewing your logs
