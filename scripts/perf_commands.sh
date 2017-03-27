#!/usr/bin/env bash
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -a
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable1.queue -s 1000 -C 500000
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable1.queue -s 1000 -C 500000 -f persistent
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable3.queue -s 1000 -C 500000 -f persistent
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -c 1000 -f persistent
