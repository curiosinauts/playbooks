#!/bin/sh

nginx-prometheus-exporter -nginx.scrape-uri=http://localhost:8080/stub_status