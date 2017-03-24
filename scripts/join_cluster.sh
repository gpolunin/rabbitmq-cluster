#!/bin/bash
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbitmq-node0
rabbitmqctl start_app