#!/bin/bash
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbitmq-0.rabbitmq-cluster
rabbitmqctl start_app
