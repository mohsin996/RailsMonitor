require 'prometheus_exporter/middleware'
require 'prometheus_exporter/instrumentation'

PrometheusExporter::Client.default = PrometheusExporter::Client.new(
  host: 'prometheus_exporter', # Use the service name defined in Docker Compose
  port: 9394
)

Rails.application.middleware.unshift PrometheusExporter::Middleware
PrometheusExporter::Instrumentation::Process.start(type: 'web')

